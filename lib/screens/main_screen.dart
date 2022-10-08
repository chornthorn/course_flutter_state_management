import 'package:flutter/material.dart';
import 'package:flutter_state_mangement/providers/auth_provider.dart';
import 'package:flutter_state_mangement/providers/post_provider.dart';
import 'package:flutter_state_mangement/services/post_service.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'post_page.dart';

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


  // list of pages
  final List<Widget> _pages = [
    HomeScreen(),
    PostScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Post',
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
