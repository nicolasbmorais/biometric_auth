import 'package:biometric_auth/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AuthCheckController with ChangeNotifier {
  final LocalAuthentication auth = LocalAuthentication();
  bool isLocalAuthFailed = false;

  Future<void> checkLocalAuth(BuildContext context) async {
    final isLocalAuthAvailable = await isBiometricAvailable();
    isLocalAuthFailed = false;

    if (isLocalAuthAvailable) {
      final authenticated = await authenticate();

      if (!authenticated) {
        isLocalAuthFailed = true;
      } else {
        Navigator.pushReplacementNamed(context, Routes.welcomePage);
      }
    }
  }

  Future<bool> isBiometricAvailable() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    return canAuthenticate;
  }

  Future<bool> authenticate() async {
    return await auth.authenticate(
      localizedReason: 'Por favor, autentique-se para acessar o app.',
    );
  }
}
