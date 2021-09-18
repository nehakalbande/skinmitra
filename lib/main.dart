import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinmitra/authentication/sign_in_button.dart';
import 'package:skinmitra/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirebaseAuth.instance.currentUser != null ? homeScreen(user: FirebaseAuth.instance.currentUser!) :  Welcome()
  ));
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            Image.asset("assets/logo.png",),

            new Padding(padding: const EdgeInsets.only(top: 40.0)),

            SignInButton(),
          ],
        ),
    );
  }
}

