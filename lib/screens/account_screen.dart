import 'package:flutter/material.dart';
import 'package:flutter_state_mangement/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text('Account'),
      ),
    );
  }
}