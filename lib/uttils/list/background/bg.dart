 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/home/categories/quotes.dart';
String image='';
int quoteIndex=0;
int authorIndex=0;
List bg=
     [
           {'img':'assets/images/background/bg.jpg'},
           {'img':'assets/images/background/bg1.jpeg'},
           {'img':'assets/images/background/bg3.jpeg'},
           {'img': 'assets/images/background/bg4.webp'},
           {'img': 'assets/images/background/bg5.jpeg'},
           {'img': 'assets/images/background/bg6.jpeg'},
           {'img': 'assets/images/background/bg7.jpeg'},
           {'img': 'assets/images/background/bg8.jpeg'},
           {'img': 'assets/images/background/bg9.jpeg'},
           {'img': 'assets/images/background/bg10.jpeg'},
           {'img': 'assets/images/background/bg11.jpg'},
           {'img': 'assets/images/background/bg15.jpeg'},
           {'img': 'assets/images/background/bg16.jpeg'},
           {'img': 'assets/images/background/bg17.jpeg'},
           {'img': 'assets/images/background/bg19.jpeg'},
     ];

 class QuoteModel
 {
       String? quote;
       String? author;
       String? bookmark;

       QuoteModel({this.quote,this.author,this.bookmark});
 }

 List<QuoteModel> favouriteQuotes=[];

 bool line=false;
 CrossAxisAlignment align=CrossAxisAlignment.center;
 TextAlign alignText=TextAlign.center;
 bool fontStyle=false;
 int no = 0;
 int size = 20;
 int choose = 1;
 String textFont = 'chocolate';
 Color chooseColor = Colors.white;
 List<Color> color = [
   Colors.pink,
   Colors.red,
   Colors.pinkAccent,
   Colors.yellow,
   Colors.black,
   Colors.white,
   Colors.cyan,
   Colors.green,
   Colors.deepPurpleAccent,
   Colors.indigoAccent
 ];
 List fonts = [
   'bold','chocolate','crackWord','dance','diff','italic','normal','playWrite','shadow',
 ];

 String? Quote;
 int selected=0;
 String appTheme = 'Dark';