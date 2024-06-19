import 'package:flutter/material.dart';

import '../../uttils/list/background/bg.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: (appTheme=='Dark')?Color(0xFF2D2D2D):Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: (appTheme=='Dark')?Colors.white70:Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: (appTheme=='Dark')?Color(0xFF2D2D2D):Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.white,
              letterSpacing: height * 0.0007,
              fontWeight: FontWeight.bold,
              fontFamily: 'chocolate'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General\n',
              style: TextStyle(
                  color: Colors.deepOrangeAccent.shade100,
                  fontSize: height * 0.020,
                  fontFamily: 'chocolate'),
            ),
            ListTile(
              title: Text(
                'Vibrate',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.022,
                ),
              ),
              subtitle: Text(
                'Vibrate on key press',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: height * 0.020,
                ),
              ),
              trailing: Switch(
                  value: vibrate,
                  onChanged: (value) {
                    setState(() {
                      vibrate = value;
                    });
                  }),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: Container(
                              height: height * 0.260,
                              width: width * 0.300,
                              decoration: BoxDecoration(
                                color: Color(0xFF2D2D2D),
                                borderRadius:
                                    BorderRadius.circular(height * 0.010),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '  App Theme',
                                    style: TextStyle(
                                        fontSize: height * 0.028,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                                  ),
                                  RadioListTile(
                                      value: 'Light',
                                      title: Text(
                                        'Light theme',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      activeColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      groupValue: appTheme,
                                      onChanged: (value) {
                                        setState(() {
                                          appTheme = value!;
                                          Navigator.of(context).pop();
                                        });
                                      }),
                                  RadioListTile(
                                      value: 'Dark',
                                      title: Text(
                                        'Dark theme',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      activeColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      groupValue: appTheme,
                                      onChanged: (value) {
                                        setState(() {
                                          appTheme = value!;
                                          Navigator.of(context).pop();
                                        });
                                      }),
                                ],
                              ),
                            ),
                          ));
                });
              },
              child: ListTile(
                title: Text(
                  'App Theme',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.022,
                  ),
                ),
                subtitle: Text(
                  '$appTheme Theme',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: height * 0.020,
                  ),
                ),
              ),
            ),
            Divider(thickness: 1,color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}

bool vibrate = true;

