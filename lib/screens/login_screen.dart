import 'package:flutter/material.dart';
import 'package:flutter_state_mangement/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late AuthProvider _authProvider;

  @override
  void initState() {
    super.initState();
    _authProvider = context.read<AuthProvider>();
    _authProvider.addListener(_authChanged);
  }

  void _authChanged() {
    if (_authProvider.isAuthenticated) {
      Navigator.pushReplacementNamed(context, "/main");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  void dispose() {
    _authProvider.removeListener(_authChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<AuthProvider>(context,listen: false).login();
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
