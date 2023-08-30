import 'dart:async';
import 'login_validator.dart';

// Bloc : StreamController, sink.add(), StreamTransformer, listen()
// 사용은 UI 에서 StreamBuilder 를 통해 Stream 을 listen 하고,
// StreamBuilder() 의 snapshot 을 통해 Stream 에서 받은 data 를 UI 에서 사용.
class LoginBloc with LoginValidator {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // Change data( Add changed data to stream )
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  // Close stream
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

// for Single Global Instance
// final loginBloc = LoginBloc();   // Provider 를 통한 Global Instance 사용을 위해 주석처리
// Scoped Instance 는 UI에서 Bloc 이 필요한 Widget 의 상위에 선언.
// InheritedWidget을 상속받은 Provider 를 사용함.