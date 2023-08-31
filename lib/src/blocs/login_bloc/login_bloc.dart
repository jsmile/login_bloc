import 'dart:async';
import 'login_validator.dart';
import 'package:rxdart/rxdart.dart';

// Bloc : StreamController, sink.add(), StreamTransformer, listen()
// 사용은 UI 에서 StreamBuilder 를 통해 Stream 을 listen 하고,
// StreamBuilder() 의 snapshot 을 통해 Stream 에서 받은 data 를 UI 에서 사용.
class LoginBloc with LoginValidator {
  // 병합이 가능한 brodcast stream 을 사용
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // Change data( Add changed data to stream )
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);
  // rxdart 패키지를 사용하여 stream 들을 결합시킴.
  Stream<bool> get submitValid => CombineLatestStream.combine2(
        email,
        password,
        (email, password) {
          // 각각의 validation 을 통과한 email 과 password 등 2개의 stream 들을 결합시켜서
          // 일단 true data 를 갖은 Stream 으로 반환
          return true;
        },
      );

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
// MatrialApp() 에 Provider() 를 선언하면 Single Global Instance 와 동일한 효과를 낳는다.
