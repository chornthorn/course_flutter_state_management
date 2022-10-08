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
      _showLoginFailureAlert();
    }
  }

  // login failure alert snake bar
  void _showLoginFailureAlert() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login Failure'),
        backgroundColor: Colors.red,
      ),
    );
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(context,listen: false).login();
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(width: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(context,listen: false).loginWithFailure();
                  },
                  child: Text('Login with Failure'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
