import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skinmitra/widgets/Cared_info.dart';
import 'package:skinmitra/widgets/nav_draw.dart';


class homeScreen extends StatefulWidget {
  const homeScreen({Key? key, required User user}) : _user = user, super(key: key);

  final User _user;
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late User _user;

  late List mydata;
  late int mydatalength = -1;

  var dio = Dio();

  Future<String> loadJsonData() async {

      print("sending req");
      final response = await dio.get("https://skinmitra.mybluemix.net/data");
      print("res");
      print(response);
      setState(() => mydata = response.data);

      mydatalength = mydata.length;

      print(mydatalength);

    return 'success';
  }


  @override
  void initState() {
    _user = widget._user;
    super.initState();
    this.loadJsonData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      drawer: NavigationDrawerWidget(),

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Welcome ${_user.displayName}"),
      ),

      body: (mydatalength == -1)
          ? Center(child: const CircularProgressIndicator())
          : FutureBuilder(
        builder: (context, snapshot) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return CardItem(
                id: mydata[index]["id"].toString(),
                title: mydata[index]["title"],
                image1: mydata[index]["image1"],
                image2: mydata[index]["image2"],
                article: mydata[index]["article"],
                youtube: mydata[index]["youtube"],
                description: mydata[index]["description"],
              );
            },
            itemCount: (mydatalength == null) ? 0 : mydata.length,
          );
        },
      ),

    );
  }
}
