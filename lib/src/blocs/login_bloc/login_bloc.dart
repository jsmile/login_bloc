import 'dart:async';

class LoginBloc {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // Change data( Add changed data to stream )
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Retrieve data from stream
  Stream<String> get email => _emailController.stream;
  Stream<String> get password => _passwordController.stream;
}
