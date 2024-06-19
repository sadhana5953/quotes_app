import 'package:flutter/material.dart';
import 'package:quotes_app/uttils/list/splashscreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage(screen[ch]['image']),
                        fit: BoxFit.cover)),
              ),
              //Image(image: AssetImage(screen[ch]['image'])),
              Text(
                '${screen[ch]['title']}',
                style: TextStyle(
                    fontSize: height * 0.030, fontWeight: FontWeight.bold,),
              ),
              Text(
                '\n${screen[ch]['detail']}',
                style: TextStyle(
                    fontSize: height * 0.021,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        children: [
          ...List.generate(
            4,
            (index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: (ch == index) ? height * 0.04 : height * 0.03,
                  width: (ch == index) ? width * 0.04 : width * 0.03,
                  margin: EdgeInsets.only(
                      left: (index == 0) ? width * 0.100 : width * 0.020),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        (ch == index) ? Color(0xFF9F3DC4) : Color(0xFF70BCF7),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          FilledButton(
              onPressed: () {
                if (ch == 3) {
                  ch = 0;
                  Navigator.of(context).pushNamed('/splash');
                }
                setState(() {
                  ch++;
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF70BCF7))),
              child: Text(
                '${(ch == 3) ? 'Start' : 'Next'}',
                style: TextStyle(
                    fontSize: height * 0.022, color: Colors.indigo),
              )),
        ],
      ),
    );
  }
}

int ch = 0;
