import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import '../icons/icons.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late File _image;
  late List _results;
  bool imageSelect=false;

  @override
  void initState()
  {
    super.initState();
    loadModel();
  }

  Future loadModel()
  async {
    Tflite.close();
    String res;
    res=(await Tflite.loadModel(model: "assets/model.tflite",labels: "assets/labels.txt"))!;
    print("Model yükleme: $res");
  }

  Future imageClassification(File image)
  async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results=recognitions!;
      _image=image;
      imageSelect=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading : Padding(
          padding: const EdgeInsets.only(left: 140.0),
          child: Icon(MyFlutterApp.apple_alt),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade500,
        title: Text("  AppleDi",style: TextStyle(color: Colors.white,),),
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.only(bottom: 30.0),
        child: ListView(
          children: [
            (imageSelect)?Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom: 30.0),
                child: Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(_image.path)),
                          fit: BoxFit.contain,
                        )
                    )
                ),
              ),
            ):Container(
              margin: const EdgeInsets.only(top:300),
              child: const Opacity(
                opacity: 0.3,
                child: Center(
                  child: Text("Henüz Bir Fotoğraf Seçilmedi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: (imageSelect)?_results.map((result) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 400.0),
                        child: Card(
                          color: Colors.red,
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                ListTile(
                                 title: Center(
                                   child: Text("Elmanızın Hastalık Durumu :",
                                     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold  ,color: Colors.white),),
                                 ),
                                  subtitle: Center(
                                    child: Text(" ${result['label'].toString().substring(2)} ",
                                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold ,color: Colors.white),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList():[],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              primary: Colors.white,
            ),
            onPressed: pickImage,
            child: Text(
              "Fotoğraf Seç",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white ,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future pickImage()
  async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image=File(pickedFile!.path);
    imageClassification(image);
  }
}