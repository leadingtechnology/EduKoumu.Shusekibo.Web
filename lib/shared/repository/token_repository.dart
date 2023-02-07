import 'package:shusekibo/shared/model/token.dart';
import 'package:shusekibo/shared/util/platform_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class TokenRepositoryProtocol {
  Future<void> remove();
  Future<void> saveToken(Token token);
  Future<Token?> fetchToken();
}

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  return TokenRepository(ref);
});

class TokenRepository implements TokenRepositoryProtocol {
  TokenRepository(this._ref) {}

  late final PlatformType _platform = _ref.read(platformTypeProvider);
  final Ref _ref;
  Token? _token;

  @override
  Future<void> remove() async {
    _token = null;
  }

  @override
  Future<void> saveToken(Token token) async {
    _token = token;
  }

  @override
  Future<Token?> fetchToken() async {
    return _token;
  }
}
