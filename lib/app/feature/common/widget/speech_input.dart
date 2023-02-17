import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/shared/util/spacing.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechInput extends StatefulWidget {
  SpeechInput(this.kizukiController);

  final TextEditingController kizukiController;

  @override
  _SpeechInputState createState() => _SpeechInputState();
}

/// An example that demonstrates the basic functionality of the
/// SpeechToText plugin for using the speech recognition capability
/// of the underlying platform.
class _SpeechInputState extends State<SpeechInput> {
  bool _hasSpeech = false;
  bool _logEvents = false;

  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    _hasSpeech ? null : initSpeechState();
  }

  @override
  void dispose() {
    // do something...
    super.dispose();
  }

  /// This initializes SpeechToText. That only has to be done
  /// once per application, though calling it again is harmless
  /// it also does nothing. The UX of the sample app ensures that
  /// it can only be called once.
  Future<void> initSpeechState() async {
    print('initSpeechState async begin');
    _logEvent('Initialize');
    try {
      var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: true,
      );
      if (hasSpeech) {
        // Get the list of languages installed on the supporting platform so they
        // can be displayed in the UI for selection by the user.
        _localeNames = await speech.locales();

        var systemLocale = await speech.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? '';
      }
      if (!mounted) return;

      setState(() {
        _hasSpeech = hasSpeech;
      });
    } catch (e) {
      setState(() {
        lastError = 'Speech recognition failed: ${e.toString()}';
        _hasSpeech = false;
      });
    }
    print('initSpeechState async end ${_hasSpeech}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              if (speech.isListening) stopListening;
              widget.kizukiController.text =
                  widget.kizukiController.text + lastWords;
              Navigator.of(context).pop();
            }),
        title: const Text('音声入力', style: TextStyle(fontFamily: 'NotoSansJP')),
      ),
      body: Column(children: [
        Container(
          child: Column(
            children: <Widget>[
              SpeechControlWidget(
                _hasSpeech,
                initSpeechState,
                speech.isListening,
                startListening,
                stopListening,
                cancelListening,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: RecognitionResultsWidget(lastWords: lastWords, level: level),
        ),
      ]),
    );
  }

  // This is called each time the users wants to start a new speech
  // recognition session
  void startListening() {
    print('  start listening');
    _logEvent('start listening');
    lastWords = '';
    lastError = '';
    final pauseFor = 5;
    final listenFor = 30;
    // Note that `listenFor` is the maximum, not the minimun, on some
    // systems recognition will be stopped before this value is reached.
    // Similarly `pauseFor` is a maximum not a minimum and may be ignored
    // on some devices.
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: listenFor),
        pauseFor: Duration(seconds: pauseFor),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
    print('  start listening over');
  }

  void stopListening() {
    _logEvent('stop');
    speech.stop();
    if (mounted) {
      setState(() {
        level = 0.0;
      });
    }
  }

  void cancelListening() {
    _logEvent('cancel');
    speech.cancel();
    if (mounted) {
      setState(() {
        level = 0.0;
      });
    }
  }

  /// This callback is invoked each time new recognition results are
  /// available after `listen` is called.
  void resultListener(SpeechRecognitionResult result) {
    _logEvent(
        'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    if (mounted) {
      setState(() {
        lastWords = '${result.recognizedWords}';
      });
    }
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // _logEvent('sound level $level: $minSoundLevel - $maxSoundLevel ');
    if (mounted) {
      setState(() {
        this.level = level;
      });
    }
  }

  void errorListener(SpeechRecognitionError error) {
    _logEvent(
        'Received error status: $error, listening: ${speech.isListening}');
    if (mounted) {
      setState(() {
        lastError = '${error.errorMsg} - ${error.permanent}';
      });
    }
  }

  void statusListener(String status) {
    _logEvent(
        'Received listener status: $status, listening: ${speech.isListening}');
    if (mounted) {
      setState(() {
        lastStatus = '$status';
      });
    }
  }

  void _logEvent(String eventDescription) {
    var eventTime = DateTime.now().toIso8601String();
  }
}

/// Displays the most recently recognized words and the sound level.
class RecognitionResultsWidget extends ConsumerWidget {
  const RecognitionResultsWidget({
    Key? key,
    required this.lastWords,
    required this.level,
  }) : super(key: key);

  final String lastWords;
  final double level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                color: Theme.of(context).selectedRowColor,
                child: Center(
                  child: Text(lastWords,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'NotoSansJP')),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Controls to start and stop speech recognition
class SpeechControlWidget extends StatefulWidget {
  const SpeechControlWidget(
      this.hasSpeech,
      this.initSpeechState,
      this.isListening,
      this.startListening,
      this.stopListening,
      this.cancelListening,
      {Key? key})
      : super(key: key);

  final bool hasSpeech;
  final Future<void> Function() initSpeechState;
  final bool isListening;
  final void Function() startListening;
  final void Function() stopListening;
  final void Function() cancelListening;

  @override
  State<SpeechControlWidget> createState() => _SpeechControlWidgetState();
}

class _SpeechControlWidgetState extends State<SpeechControlWidget> {
  @override
  initState() {
    super.initState();
    widget.hasSpeech ? null : widget.initSpeechState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacing.height(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton.icon(
              onPressed: () async {
                print(
                    '------ 30 ------ ${widget.hasSpeech} ${widget.isListening}');
                !widget.hasSpeech || widget.isListening
                    ? null
                    : widget.startListening();
                print('------ 40 ------');
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(150, 40),
                side: BorderSide(
                    width: 1, color: Colors.black87, style: BorderStyle.solid),
              ),
              icon: Icon(FontAwesomeIcons.microphone,
                  size: 16, color: Colors.black),
              label: Text(
                '開始',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'NotoSansJP'),
              ),
            ),
            // OutlinedButton.icon(
            //   onPressed: () async {
            //     widget.isListening ? widget.stopListening : null;
            //   },
            //   style: OutlinedButton.styleFrom(
            //     backgroundColor: Colors.white,
            //     fixedSize: Size(150, 40),
            //     side: BorderSide(
            //         width: 1, color: Colors.black87, style: BorderStyle.solid),
            //   ),
            //   icon: Icon(FontAwesomeIcons.microphone ,size: 16,color: Colors.black),
            //   label: Text('終了', style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'NotoSansJP'),
            //   ),
            // ),
            // OutlinedButton.icon(
            //   onPressed: () async {
            //     widget.isListening ? widget.cancelListening : null;
            //   },
            //   style: OutlinedButton.styleFrom(
            //     backgroundColor: Colors.white,
            //     fixedSize: Size(150, 40),
            //     side: BorderSide(
            //         width: 1, color: Colors.black87, style: BorderStyle.solid),
            //   ),
            //   icon: Icon(FontAwesomeIcons.microphone ,size: 16,color: Colors.black),
            //   label: Text('キャンセル', style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'NotoSansJP'),
            //   ),
            // ),
          ],
        ),
        Spacing.height(24),
      ],
    );
  }
}
