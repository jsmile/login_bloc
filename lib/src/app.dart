import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'blocs/login_bloc/login_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Scoped Instance 로 Single Global Instance 효과를 내기 위해
    // Provider() 의 child 로 MaterialApp() 선언함.
    return LoginProvider(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Bloc Flutter',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
