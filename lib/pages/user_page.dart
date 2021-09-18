import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skinmitra/authentication/auth_class.dart';
import 'package:skinmitra/camera/camera_page.dart';
import 'package:skinmitra/widgets/login_button.dart';

import '../main.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Welcome ${_user.displayName}"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              _user.photoURL != null
                  ? ClipOval(
                      child: Material(
                        color: Colors.blue,
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: Material(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 16.0),

              Text(
                _user.displayName!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '( ${_user.email!} )',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'You are now signed in using your Google account. To sign out of your account, click the "Sign Out" button below.',
                style: TextStyle(
                    color: Colors.grey, fontSize: 14, letterSpacing: 0.2),
              ),
              SizedBox(height: 20),

              LoginButton(
                title: "Scan Skin",
                onTap: () => Get.to(() => CameraPage()),
                shade: Colors.orangeAccent,
                factor: 0.7,
              ),

              SizedBox(height: 15.0),

              LoginButton(
                title: "Know Your Well-Being",
                onTap: () => Get.to(() => {}),
                shade: Colors.orangeAccent,
                factor: 0.7,
              ),

              SizedBox(height: 15.0),

              _isSigningOut
                  ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),)
                  : LoginButton(
                  title: "Sign Out",
                  onTap: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await Authentication.signOut(context: context);
                    setState(() {
                      _isSigningOut = false;
                    });
                    Navigator.of(context)
                        .pushReplacement(_routeToSignInScreen());
                  },
                  shade: Colors.redAccent,
                  factor: 0.5,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
