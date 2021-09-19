import 'package:flutter/material.dart';

import 'nav_draw.dart';

class PdfView extends StatelessWidget {
  const PdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      drawer: NavigationDrawerWidget(),

      appBar: AppBar(
          title: Text("Your Skin Analysis Report"),
          centerTitle: true,
          backgroundColor: Colors.green),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,

                child: Column(
                  children: <Widget>[
                    Text(
                      "",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      "Welcome to the SkinMitra App",
                      style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Wanna know about SkinMitra. Have a look!",
                      style: TextStyle(fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "SkinMitra(मित्र) About SkinMitra SkinMitra where ‘mitra’ in Sanskrit translates to friend, is a skincare application which will help physicians, radiologists and patients in preliminary assessments of skin related diseases along with providing a daily feed of skin care routines.",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.left,
                    ),

                    Text(
                      "How to operate :",
                      style: TextStyle(fontSize: 25.0),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.left,
                    ),

                    Text(
                      "If you want to know about Skin Disease. Do the following Procedure:",
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "1. Click a photo With just a picture of the affected area\n2. get a skin analysis report that will be generated using ML and will detect your skin concerns.",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.left,
                    ),

                    Text(
                      "If you want to know the feed of Know your Well Being:",
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "1. Get access to daily skincare routines and tips\n2. Have a look over the start and allTutorials page.\n3. Start will display the tutorials. AllTutorials will show you the update of all the Tutorials being seen on Start section and other Tutorials as well.\n4. Get your skincare in place!",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
