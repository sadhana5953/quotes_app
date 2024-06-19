import 'package:flutter/material.dart';
import 'package:quotes_app/home/categories/quotes.dart';

import '../../uttils/list/background/bg.dart';

class theme extends StatefulWidget {
  const theme({super.key});

  @override
  State<theme> createState() => _themeState();
}

class _themeState extends State<theme> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFF2D2D2D),
        appBar: AppBar(
          backgroundColor: Color(0xFF2D2D2D),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Choose Theme',
            style: TextStyle(
                letterSpacing: height * 0.001,
                color: Colors.white,
                fontFamily: 'chocolate',
                fontWeight: FontWeight.w600,
                fontSize: height * 0.027),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 11 / 18),
            itemCount: bg.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                image=bg[index]['img'];
                Navigator.of(context).pop();
              },
              child: Container(
                height: height * 0.3,
                width: width * 0.300,
                margin: EdgeInsets.all(width * 0.010),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(height * 0.015),
                  image: DecorationImage(
                      image: AssetImage(bg[index]['img']), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ));
  }
}
