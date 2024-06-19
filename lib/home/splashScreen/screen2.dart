import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../uttils/list/background/bg.dart';
import '../../uttils/list/categories/categories.dart';
import '../../uttils/list/splashscreen.dart';
import '../categories/staatus.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

int dropDownSelectedIndex = 0;

class _splashState extends State<splash> {
  String? _selectedItem;
  final List<String> _dropdownItems = ['Proverbs', 'One line Status', 'Random Quotes','Favourite Quotes','Favourite Pictures','Settings'];

  void _selectMenuItem(String value) {
    setState(() {
      _selectedItem = value;
    });
    if(_selectedItem=='Favourite Quotes')
      {
        Navigator.of(context).pushNamed('/favourite');
      }
    else if(_selectedItem=='Settings')
      {
        Navigator.of(context).pushNamed('/setting');
      }
    print('Selected menu item: $value');
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFF2D2D2D),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white70,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Color(0xFF2D2D2D),
          title: Text(
            'Status & Quotes',
            style: TextStyle(
                letterSpacing: height * 0.001,
                color: Colors.white,
                fontFamily: 'chocolate',
                fontWeight: FontWeight.w600,
                fontSize: height * 0.027),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.yellow,
                )),
            PopupMenuButton<String>(
              color: Colors.black,
              icon: Icon(Icons.more_vert,color: Colors.white,),
              onSelected: _selectMenuItem,
              itemBuilder: (BuildContext context) {
                return _dropdownItems.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500,fontFamily: 'chocolate'),),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.270,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: height * 0.020),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: AssetImage(bg[0]['img']), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(height * 0.015),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/categories');
                        },
                        child: Container(
                          height: height * 0.070,
                          width: width * 0.140,
                          margin: EdgeInsets.only(bottom: height * 0.007),
                          decoration: BoxDecoration(
                            color: Color(0xFFA15485),
                            borderRadius: BorderRadius.circular(height * 0.010),
                          ),
                          child: Icon(
                            Icons.grid_view,
                            color: Colors.white,
                            size: height * 0.040,
                          ),
                        ),
                      ),
                      Text(
                        'Categories',
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: height * 0.020,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height * 0.070,
                        width: width * 0.140,
                        margin: EdgeInsets.only(bottom: height * 0.007),
                        decoration: BoxDecoration(
                          color: Color(0xFFB78F42),
                          borderRadius: BorderRadius.circular(height * 0.010),
                        ),
                        child: Icon(
                          Icons.image_outlined,
                          color: Colors.white,
                          size: height * 0.040,
                        ),
                      ),
                      Text(
                        'Quotes',
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: height * 0.020,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height * 0.070,
                        width: width * 0.140,
                        margin: EdgeInsets.only(bottom: height * 0.007),
                        decoration: BoxDecoration(
                          color: Color(0xFF7488C6),
                          borderRadius: BorderRadius.circular(height * 0.010),
                        ),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: height * 0.035,
                        ),
                      ),
                      Text(
                        'Latest',
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: height * 0.020,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height * 0.070,
                        width: width * 0.140,
                        margin: EdgeInsets.only(bottom: height * 0.007),
                        decoration: BoxDecoration(
                          color: Color(0xFF6B9877),
                          borderRadius: BorderRadius.circular(height * 0.010),
                        ),
                        child: Icon(
                          Icons.menu_book_outlined,
                          color: Colors.white,
                          size: height * 0.040,
                        ),
                      ),
                      Text(
                        'Articles',
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: height * 0.020,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                ' Most Popular',
                style: TextStyle(
                    letterSpacing: height * 0.0005,
                    color: Colors.white,
                    fontFamily: 'chocolate',
                    fontSize: height * 0.024,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              Expanded(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 4,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selected=index;
                        Quote = categoris[index]['name'];
                        print(Quote);
                        Navigator.of(context).pushNamed('/quote');
                      },
                      child: Container(
                        height: height * 0.150,
                        width: width * 0.430,
                        margin: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.005),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage(categoris[index]['img']),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(height * 0.015),
                        ),
                      ),
                    ),
                    Text(
                      '${categoris[index]['name']} Status',
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'chocolate',
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.020),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}


