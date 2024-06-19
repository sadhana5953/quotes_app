import 'package:flutter/material.dart';
import 'package:quotes_app/uttils/routes/route.dart';
void main()
{
  return runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Quoteroute.routes,
    );
  }
}

