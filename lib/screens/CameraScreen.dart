import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import '../icons/icons.dart';
import '../main.dart';
class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  @override
  void initState() {
    super.initState();
    loadCamera();
    loadmodel();
  }

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      predictions!.forEach((element) {
        setState(() {
          output = element['label'].toString().substring(2,15);
        });
      });
    }
  }

  loadmodel() async {
    Tflite.close();
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }

  @override
  void dispose() {
    this.cameraController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading : Padding(
          padding: const EdgeInsets.only(left: 145.0),
          child: Icon(MyFlutterApp.apple_alt),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(" AppleDi",style: TextStyle(color: Colors.white,),),
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.only(top: 10.0,bottom: 30.0),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              child: !cameraController!.value.isInitialized
                  ? Container()
                  : AspectRatio(
                aspectRatio: cameraController!.value.aspectRatio,
                child: CameraPreview(cameraController!),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0,right: 4.0),
            child: Container(decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
              width: double.infinity,
              height: 70,
              child: Column(
                children: [SizedBox(height: 10,),
                  Text("Elmanın Hastalık Durumu:",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold  ,color: Colors.white),
                  ),
                  Text(output,
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold ,color: Colors.white),),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}