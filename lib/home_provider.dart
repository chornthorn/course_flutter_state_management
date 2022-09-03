import 'package:flutter/material.dart';

class HomeProvider extends InheritedWidget {
  HomeProvider({
    required this.name,
    required this.child,
    required this.homeDetailPageColor,
    required this.homeService,
  }) : super(child: child);

  final Widget child;
  final String name;
  final Color homeDetailPageColor;
  final HomeService homeService;

  static HomeProvider of(BuildContext context) {
    final HomeProvider? result =
        context.dependOnInheritedWidgetOfExactType<HomeProvider>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class HomeService {
  Future<String> getUserInfo() async{
    await Future.delayed(Duration(seconds: 2));
    return "this user info";
  }
}


/*App name:
   appColor:
   appName:
   appVersion:
   currentUserName;
*/