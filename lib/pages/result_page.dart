import 'package:flutter/material.dart';
import 'package:skinmitra/widgets/nav_draw.dart';

class ResultPage extends StatefulWidget {
  final String disease, plant, remedy;

  const ResultPage(
      {Key? key,
      required this.disease,
      required this.plant,
      required this.remedy})
      : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),

      appBar: AppBar(
          title: Text("Your Skin Analysis Report"),
          centerTitle: true,
          backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text("Plant Name: " + widget.plant,
                      style: TextStyle(fontSize: 18)),
                  Spacer(
                    flex: 1,
                  ),
                  widget.disease == "healthy"
                      ? Text("Your Plant is Healthy!!",
                          style: TextStyle(fontSize: 18))
                      : Text("Disease detected: " + widget.disease,
                          style: TextStyle(fontSize: 18)),
                  Spacer(flex: 1),
                  widget.disease == "healthy"
                      ? Container()
                      : Text("Possible remedy: ",
                          style: TextStyle(fontSize: 18)),
                  SizedBox(height: 2),
                  widget.disease == "healthy"
                      ? Container()
                      : Text(widget.remedy,
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic)),
                  Spacer(
                    flex: 2,
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
