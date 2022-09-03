import 'package:flutter/material.dart';

import 'home_provider.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({Key? key}) : super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  String userInfo = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final _userInfo = HomeProvider.of(context).homeService.getUserInfo();
    _userInfo.then((value) {
      setState(() {
        userInfo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = HomeProvider.of(context);
    return Scaffold(
      backgroundColor: homeProvider.homeDetailPageColor,
      body: FutureBuilder<String>(
        future: homeProvider.homeService.getUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final userInfo = homeProvider.homeService.getUserInfo();
          // setState(() {
          //   this.userInfo = userInfo;
          // });
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
