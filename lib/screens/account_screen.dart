import 'package:flutter/material.dart';
import 'package:flutter_state_mangement/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Text(Provider.of<SimpleMode>(context).simple),
      ),
    );
  }
}