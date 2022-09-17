import 'package:flutter/material.dart';
import 'package:flutter_state_mangement/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text(context.watch<AppConfigProvider>().appName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AppConfigProvider>().setNewApp("New App Name");
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
