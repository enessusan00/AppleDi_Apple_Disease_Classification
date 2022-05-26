import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'screens/HomePage.dart';



List<CameraDescription>? cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppleDi',
      home:  Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}