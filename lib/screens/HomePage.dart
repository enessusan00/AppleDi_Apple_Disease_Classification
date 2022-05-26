import 'package:appledi/screens/CameraScreen.dart';
import 'package:appledi/screens/GalleryScreen.dart';
import 'package:appledi/screens/introductionScreen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../icons/icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CameraDescription>? cameras;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.grey.shade100,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [SizedBox(
                          height: 100
                          ,
                        ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(MyFlutterApp.apple_alt,color: Colors.white,size: 30,),
                              Text("AppleDi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                    onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                    return CameraScreen();
                        },
                      ),
                     );
                    },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 180,
                        alignment: Alignment.center,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Icon(Icons.camera_alt_outlined,color: Colors.red,),
                            Text(
                              'Kamerayı Kullan',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return GalleryScreen();
                        },
                        ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 180,
                        alignment: Alignment.center,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Icon(Icons.image_outlined,color: Colors.red,),
                            Text(
                              'Galeriden Seç',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return IntroPage();
                        },
                        ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 220,
                        alignment: Alignment.center,
                        padding:
                        const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Icon(Icons.question_mark,size: 15,color: Colors.red,),
                            Text(
                              'Uygulama Hakkında',
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
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
