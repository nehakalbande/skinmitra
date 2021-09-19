import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skinmitra/authentication/auth_class.dart';
import 'package:skinmitra/camera/camera_page.dart';
import 'package:skinmitra/pages/home_page.dart';
import 'package:skinmitra/widgets/pdlload.dart';

import '../main.dart';


class NavigationDrawerWidget extends StatelessWidget {

  final User = FirebaseAuth.instance.currentUser;


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
  Widget build(BuildContext context) {
    final name = User!.displayName.toString();
    final email = User!.email.toString();
    final photo = User!.photoURL.toString();

    
    return Drawer(
      child: Material(
        color: Colors.green,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            buildHeader(
              urlImage: photo,
              name: name,
              email: email,
              space: MediaQuery.of(context).size.height
            ),

            buildMenuItem(
              text: "Skin Scan",
              icon: Icons.search,
              onClicked: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CameraPage(),
                  )),
            ),

            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.05,),
            buildMenuItem(
                text: "Know Your Well-Being",
                icon: Icons.nightlife,

                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => homeScreen(user: User!,),
                )),
            ),

            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.05,),
            buildMenuItem(
                text: "Help",
                icon: Icons.help,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PdfView(),
              )),

            ),

            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.03,),

            Divider(color: Colors.white,),

            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.03,),
            buildMenuItem(
                text: "Sign Out",
                icon: Icons.logout,
                onClicked: () async {
                  await Authentication.signOut(context: context);

                  Navigator.of(context)
                      .pushReplacement(_routeToSignInScreen());
                }
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required var space,

  }) =>
      InkWell(

        child: Container(
          padding: EdgeInsets.symmetric(vertical: space*0.05),

          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
