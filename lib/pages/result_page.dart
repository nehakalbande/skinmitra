import 'package:flutter/material.dart';
import 'package:skinmitra/widgets/nav_draw.dart';

class ResultPage extends StatefulWidget {
  final String disease, symptoms;

  const ResultPage(
      {Key? key,
      required this.disease,
      required this.symptoms})
      : super(key: key);


  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var isLoading = false;

  String disease = "Basal Cell Carcinoma";

  String symptoms = "- A pearly white, skin-colored or pink bump,\n- A brown, black or blue lesion,\n- A flat, scaly, reddish patch,\n- A white, waxy, scar-like lesion";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      drawer: NavigationDrawerWidget(),

      appBar: AppBar(
          title: Text("Your Skin Analysis Report"),
          centerTitle: true,
          backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width*0.25,
            ),
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
                    "${disease} Detected",
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    "Symptoms",
                    style: TextStyle(fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    "${symptoms}",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Please Contact Doctor",
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            isLoading
                ? Expanded(
                    flex: 1, child: Center(child: CircularProgressIndicator()))
                : Spacer(
                    flex: 1,
                  )
          ],
        ),
      ),
    );
  }
}
