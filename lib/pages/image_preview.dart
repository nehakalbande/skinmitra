import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinmitra/pages/result_page.dart';
import 'package:skinmitra/services/http.dart';
import 'package:skinmitra/widgets/login_button.dart';

class ImagePreview extends StatefulWidget {
  final String imagePath;

  const ImagePreview({Key? key, required this.imagePath}) : super(key: key);

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview your image"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                Image.file(File(widget.imagePath),
                    height: MediaQuery.of(context).size.height*0.6, fit: BoxFit.cover),
                Spacer(
                  flex: 1,
                ),
                LoginButton(
                  title: "Send",
                  shade: Colors.orangeAccent,
                  factor: 0.5,
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    var result = await sendToPredictor(widget.imagePath);
                    final String plant = result['plant'];
                    final String disease = result['disease'];
                    final String remedy = result['remedy'];
                    print(result);
                    setState(() {
                      isLoading = false;
                    });
                    Get.to(() => ResultPage(
                          disease: disease,
                          plant: plant,
                          remedy: remedy,
                        ));
                  },

                ),
                isLoading
                    ? Expanded(
                        flex: 2,
                        child: Center(child: CircularProgressIndicator()))
                    : Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
