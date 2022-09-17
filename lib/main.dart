import 'package:flutter/material.dart';
import 'package:flutter_state_mangement/providers/app_config_provider.dart';
import 'package:flutter_state_mangement/screens/account_screen.dart';
import 'package:flutter_state_mangement/screens/error_screen.dart';
import 'package:flutter_state_mangement/screens/home_screen.dart';
import 'package:flutter_state_mangement/screens/login_screen.dart';
import 'package:flutter_state_mangement/screens/main_screen.dart';
import 'package:flutter_state_mangement/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AppConfigProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        //TODO:: method 1
        onGenerateRoute: (settings) {
          if (settings.name == "/") {
            return MaterialPageRoute(builder: (context) => SplashScreen());
          } else if (settings.name == '/main') {
            return MaterialPageRoute(builder: (context) => MainScreen());
          } else if (settings.name == '/home') {
            return MaterialPageRoute(builder: (context) => HomeScreen());
          } else if (settings.name == "/account") {
            return MaterialPageRoute(
              builder: (context) => Provider(
                create: (_) => SimpleMode(),
                child: AccountScreen(),
              ),
            );
          } else if (settings.name == "/login") {
            return MaterialPageRoute(builder: (context) => LoginScreen());
          }
          return MaterialPageRoute(builder: (context) => ErrorScreen());
        },
        // TODO:: method 2
        // initialRoute: "/",
        // routes: {
        //   "/": (context) => MainScreen(),
        //   "/home": (context) => HomeScreen(),
        //   "/account": (context) => AccountScreen(),
        // },
      ),
    );
  }
}
// Navigator.of(context).pushNamed("/home");
