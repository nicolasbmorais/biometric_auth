import 'package:biometric_auth/src/services/local_auth.dart';
import 'package:flutter/material.dart';

class AuthCheckPage extends StatefulWidget {
  const AuthCheckPage({super.key});

  @override
  State<AuthCheckPage> createState() => _AuthCheckPageState();
}

class _AuthCheckPageState extends State<AuthCheckPage> {
  final AuthCheckController _authCheckController = AuthCheckController();

  @override
  void initState() {
    _authCheckController.checkLocalAuth(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBA4DE3),
      body: FutureBuilder(
        initialData: _authCheckController.isLocalAuthFailed,
        builder: (context, failed) {
          if (failed.hasData) {
            return Center(
              child: button(
                onPressed: () => _authCheckController.checkLocalAuth(context),
              ),
            );
          }
          return const Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget button({required Function()? onPressed}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
                side: const BorderSide(
                  color: Colors.white,
                  width: 1.0,
                  style: BorderStyle.solid,
                )),
          ),
          child: Container(
            height: 48.0,
            alignment: Alignment.center,
            child: const Text(
              'Tentar autenticar novamente',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      );
}
