import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skinmitra/authentication/auth_class.dart';
import 'package:skinmitra/camera/camera_page.dart';
import 'package:skinmitra/widgets/login_button.dart';
import 'package:skinmitra/widgets/nav_draw.dart';

import '../main.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key, required User user}) : _user = user, super(key: key);

  final User _user;
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Welcome(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      drawer: NavigationDrawerWidget(),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text("Welcome ${_user.displayName}"),
      ),

      
    );
  }
}
