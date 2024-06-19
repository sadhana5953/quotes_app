import 'package:flutter/material.dart';
import 'package:quotes_app/home/background/theme.dart';
import 'package:quotes_app/home/categories/edit.dart';
import 'package:quotes_app/home/categories/quotes.dart';
import 'package:quotes_app/home/categories/staatus.dart';
import 'package:quotes_app/home/favourite/favourite.dart';
import 'package:quotes_app/home/settings/setting.dart';
import 'package:quotes_app/home/splashScreen/screen1.dart';
import 'package:quotes_app/home/splashScreen/screen2.dart';
import 'package:quotes_app/home/splashScreen/splashScreen.dart';
class Quoteroute
{
  static Map<String,Widget Function(BuildContext)>routes={
    '/':(context) => SplashScreen1(),
    '/quote':(context) => quote(),
    '/categories':(context) => categories(),
    '/favourite':(context) => favourite(),
    '/setting':(context) => setting(),
    '/edit':(context) => edit(),
    '/theme':(context) => theme(),
    '/homescreen':(context) => splash(),
    '/screen1':(context) => SplashScreen1(),
    '/splashscreen':(context) => splashScreen(),
    '/splash':(context) => splash(),
  };
}