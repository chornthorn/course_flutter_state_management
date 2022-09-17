import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/home");
              },
              // child: Text(context.read<AppConfigProvider>().appName),
              // child: Text(Provider.of<AppConfigProvider>(context).appName),
              child: Consumer<AppConfigProvider>(
                builder: (context, appConfig, child) {
                  return Text(appConfig.appName);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/account");
              },
              child: Text('Account'),
            ),
          ],
        ),
      ),
    );
  }
}
