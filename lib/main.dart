import 'package:biometric_auth/src/routes/routes.dart';
import 'package:biometric_auth/src/services/local_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthCheckController>(
          create: (context) => AuthCheckController(),
        ),
      ],
      child: MaterialApp(
          title: 'Biometric Auth',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.authCheck,
          navigatorKey: Routes.navigatorKey,
          routes: Routes.list),
    );
  }
}
