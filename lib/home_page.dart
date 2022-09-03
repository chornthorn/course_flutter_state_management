import 'package:flutter/material.dart';

import 'home_detail_page.dart';
import 'home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: HomeDetailPage(),
    );
  }
}
