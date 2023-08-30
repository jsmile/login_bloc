import 'package:flutter/material.dart';
import '../blocs/login_bloc/login_bloc.dart';
import '../blocs/login_bloc/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginProvider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(loginBloc),
          passwordField(loginBloc),
          const SizedBox(height: 20.0),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField(LoginBloc loginBloc) {
    return StreamBuilder<String>(
      stream: loginBloc.email,
      // snapshot : stream 에서 받은 data
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'abc@def.com',
            hintStyle: const TextStyle(color: Colors.grey),
            errorText: snapshot.hasError ? '${snapshot.error}' : null,
          ),
          // onChanged: (inputValue) {
          //   loginBloc.changeEmail(inputValue);
          // },
          onChanged: loginBloc.changeEmail, // 선언과 동시에 실행하는 것이 아니므로 () 를 제거.
        );
      },
    );
  }

  Widget passwordField(LoginBloc loginBloc) {
    return StreamBuilder<String>(
      stream: loginBloc.password,
      // snapshot : stream 에서 받은 data
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'password',
            hintStyle: const TextStyle(color: Colors.grey),
            errorText: snapshot.hasError ? '${snapshot.error}' : null,
          ),
          // onChanged: (inputValue) {
          //   loginBloc.changePassword(inputValue);
          // },
          onChanged: loginBloc.changePassword, // 선언과 동시에 실행하는 것이 아니므로 () 를 제거.
        );
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () {},
      child: const Text('login'),
    );
  }
}
