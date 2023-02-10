import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shusekibo/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/feature/home/provider/books_provider.dart';
import 'package:shusekibo/feature/home/widget/row_book_widget.dart';
import 'package:shusekibo/l10n/l10n.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

class HomeRoute extends PageRouteInfo {
  const HomeRoute() : super(name, path: '/home');
  static const String name = 'HomeRoute';
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(context.l10n.books),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.adjust),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
          ),
        ],
      ),
      //body: _widgetContent(context, ref),
      body: Container(),
    );
  }

  Widget _widgetShimmer(BuildContext context, WidgetRef ref) {
    return Container();
  }

  Widget _widgetContent(BuildContext context, WidgetRef ref) {
    final state = ref.watch(booksProvider);

    return state.when(
      loading: () {
        return _widgetShimmer(context, ref);
      },
      booksLoaded: (books) {
        return ListView.builder(
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return RowBookWidget(book: books[index]);
            });
      },
      error: (AppException error) {
        return _widgetShimmer(context, ref);
      },
    );
  }
}
