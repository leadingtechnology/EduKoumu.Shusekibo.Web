import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shusekibo/feature/auth/provider/auth_provider.dart';

class SignInRoute extends PageRouteInfo {
  const SignInRoute() : super(name, path: '/signin');
  static const String name = 'SignInRoute';
}    

class SignInPage extends ConsumerWidget {

  SignInPage({super.key});
  
  final _emailController = TextEditingController(text: 'login0001');
  final _passwordController = TextEditingController(text: 'P@ssw0rd');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 892,
              child: Column(children: <Widget>[
                const SizedBox(height: 50),
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1.0,
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(2, 0),
                      )
                    ],
                  ),
                  child: Wrap(
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        //padding: EdgeInsets.fromLTRB(25,0,0,0),
                        //width: double.infinity,
                        //height: double.infinity,
                        child: Image.asset(
                          'assets/images/login_page_picture.png',
                        ),
                      ),
                      Container(
                        //color: Colors.yellow,
                        padding: const EdgeInsets.all(30),
                        width: 320,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/login_page_logo.png',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Form(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ログインID'),
                                  ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxHeight: 30),
                                    child: TextFormField(
                                      textAlignVertical: TextAlignVertical.top,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6),
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                      controller: _emailController,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text('パスワード'),
                                  ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxHeight: 30),
                                    child: TextFormField(
                                      textAlignVertical: TextAlignVertical.top,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6),
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                      controller: _passwordController,
                                      obscureText: true,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      SizedBox(
                                        width: 100,
                                        child: InkWell(
                                          child: OutlinedButton(
                                            child: Text('ログイン'),
                                            style: OutlinedButton.styleFrom(
                                              //primary: Colors.black45,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              side: const BorderSide(
                                                  color: Colors.black45),
                                            ),
                                            onPressed: () async {
                                                  await ref
                                                  .read(authProvider.notifier)
                                                  .login(_emailController.text,
                                                      _passwordController.text,);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
             
              ],),),
          ),
        ),);
  }

}
