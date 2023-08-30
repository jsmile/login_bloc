import 'package:flutter/material.dart';

import 'login_bloc.dart';

class LoginProvider extends InheritedWidget {
  final bloc = LoginBloc();

  // child 를 받아서 super 인 InheritedWidget 에 전달
  LoginProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  // context 에서 LoginProvider 를 찾아서 LoginBloc 을 반환함.
  // dependOnInheritedWidgetOfExactType<LoginProvider>() 이 null 반환할 수 있으므로 강제로 as LoginProvider
  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LoginProvider>()
            as LoginProvider)
        .bloc;
  }

  @override
  bool updateShouldNotify(_) => true;
  // bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
