import 'dart:async';
import 'login_validator.dart';

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
