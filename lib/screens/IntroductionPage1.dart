import 'package:flutter/material.dart';

import '../icons/icons.dart';
class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.only(top: 40,bottom: 100,left:40,right: 40),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MyFlutterApp.apple_alt,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text("AppleDi ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),
                    ),
                  ],
                ),
              ),
              Text("\n\n AppleDi'ye Hoş Geldin!\n"
                  "\n Uygulamayı kullanmak için öncelikle Elmanı nasıl taratacağına karar vermen gerekiyor.\n"
                  "\n Eğer Kameranı kullanmak istiyorsan 'Kamerayı Kullan' tuşuna basman ve Elmanı kameranın görüş açısı içerisine getirmen yeterli.\n"
                  "\n Eğer hazır bir resim kullanmak istersen de'Galeriden Seç' tuşuna basman ve ardından 'Fotoğraf Seç' tuşuna basığ Elmanı seçmen yeterli.\n"
                  ,style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade100
                ),
              ),
            ],
          ),
        )
    );
  }
}
