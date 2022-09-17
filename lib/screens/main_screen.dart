import 'package:flutter/material.dart';
import 'package:flutter_state_mangement/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late AuthProvider _authProvider;

  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _authProvider = context.read<AuthProvider>();
    _authProvider.addListener(_authChanged);
  }

  void _authChanged() {
    if (!_authProvider.isAuthenticated) {
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
        title: Text('Main Screen'),
        actions: [
          // logout button
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: _currentIndex == 0 ? Center(
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
      ) : Center(
        child: Text('Account'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
