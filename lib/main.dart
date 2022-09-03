import 'package:flutter/material.dart';
import 'package:flutter_state_mangement/home_provider.dart';

import 'home_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeProvider(
        name: "acess token dkjasldjkflsakdjflsjk",
        homeDetailPageColor: Colors.red,
        homeService: HomeService(),
        child: HomePage(
          name: "Home Provider from MyApp",
        ),
      ),
    );
  }
}
