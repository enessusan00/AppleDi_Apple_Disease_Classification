import 'package:appledi/screens/HomePage.dart';
import 'package:appledi/screens/IntroductionPage1.dart';
import 'package:flutter/material.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  PageController _controller = PageController();
  bool onLastPage=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged:(index){
              setState(() {
                onLastPage=(index==2);
              });
          },
            controller: _controller,
            children: [
              IntroPage1()
            ],
          ),
          Container(alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: TextButton(
                    style: TextButton.styleFrom(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                    ),
                    backgroundColor: Colors.red,
                    primary: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                    child: const Text(
                      "Uygulamaya Devam Et",
                      style: TextStyle(
                      fontSize: 18,
                      color: Colors.white ,
                      ),
                    ),
                   ),
                  ),
                ),
              ],
            )
          )
        ],
      )
    );
  }
}


