import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFBA4DE3),
      body: Center(
        child: Text(
          'Bem vindo! :)',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
