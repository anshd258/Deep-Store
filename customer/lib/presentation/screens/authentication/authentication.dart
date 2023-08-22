import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../middleware/blocs/authentication/authentication_bloc.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login / signup'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthenticationBloc>().add(UpdateAuthenticationEvent());
          },
          child: const Text('Dummy logIn!!'),
        ),
      ),
    );
  }
}
