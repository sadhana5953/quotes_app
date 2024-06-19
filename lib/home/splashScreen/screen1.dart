import 'package:flutter/material.dart';
class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pushNamed('/homescreen');
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      body: Center(child: Image(image: AssetImage('assets/images/splashscreen/screen.jpeg'),height: height*0.215,),),
    );
  }
}
