import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../uttils/list/background/bg.dart';
import '../../uttils/list/categories/categories.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D2D2D),
        leading: IconButton(
          onPressed: (){Navigator.of(context).pop();},icon: Icon(Icons.arrow_back,
          color: Colors.white70,),
        ),
        title: Text(
          'Status Messages',
          style: TextStyle(
              letterSpacing: height * 0.001,
              color: Colors.white,
              fontFamily: 'chocolate',
              fontWeight: FontWeight.w600,
              fontSize: height * 0.025),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            itemCount: categoris.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    selected = index;
                    Quote = categoris[index]['name'];
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
                          image: AssetImage(categoris[index]['img']),fit: BoxFit.cover),
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
          )),
    );
  }
}

