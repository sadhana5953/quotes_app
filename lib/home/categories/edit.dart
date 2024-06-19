import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/home/splashScreen/splashScreen.dart';
import 'package:quotes_app/uttils/list/background/bg.dart';
import 'dart:ui' as ui;
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import '../../uttils/list/categories/categories.dart';


List<GlobalKey> bgImage =
List.generate(categorie[quoteIndex].length, (index) => GlobalKey());
class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      body: RepaintBoundary(
        key: bgImage[quoteIndex],
        child: GestureDetector(
          onVerticalDragStart: (details) {
            setState(() {
              if(categorie.length==9)
                {
                  authorIndex=0;
                }
              authorIndex++;
            });
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: width * 0.015),
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: align,
              children: [
                Spacer(),
                SelectableText(
                  '${categorie[quoteIndex][authorIndex]['quote']}',
                  style: TextStyle(
                    decoration: (line==true)?TextDecoration.underline:null,
                      decorationColor: (line==true)?chooseColor:null,
                      fontSize: size.toDouble(),
                      fontWeight: FontWeight.w500,
                      fontFamily: textFont,
                      color: chooseColor),
                  textAlign: alignText,
                ),
                SelectableText(
                  '~ ${categorie[quoteIndex][authorIndex]['author']}',
                  style: TextStyle(
                      decoration: (line==true)?TextDecoration.underline:null,
                      decorationColor: (line==true)?chooseColor:null,
                      fontSize: size.toDouble(),
                      fontWeight: FontWeight.w500,
                      fontFamily: textFont,
                      color: chooseColor),
                ),
                Spacer(),
                Stack(
                  children: [
                    (fontStyle==false)?Container(
                      height: height * 0.075,
                      width: width * 0.900,
                      margin: EdgeInsets.only(bottom: height * 0.020,left: width*0.035,right: width*0.035),
                      padding: EdgeInsets.symmetric(horizontal: width*0.020),
                      decoration: BoxDecoration(
                        color: Color(0xFF2D2D2D),
                        borderRadius: BorderRadius.circular(height*0.050),
                      ),
                      child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                image = bg[no]['img'];
                                no++;
                                if (no >= 15) {
                                  no = 0;
                                }
                              });
                            },
                            icon: Icon(
                              Icons.image_outlined,
                              color: Colors.green,
                              size: height * 0.030,
                            )),
                        IconButton(onPressed: (){
                          setState(() {
                            fontStyle=true;
                          });
                        }, icon: Icon(Icons.text_fields,color: Colors.greenAccent,size: height * 0.030,)),
                        IconButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                  '${categorie[quoteIndex][authorIndex]['quote'].toString()}\n${categorie[quoteIndex][authorIndex]['author'].toString()}'));
                            },
                            icon: Icon(
                              Icons.copy,
                              color: Colors.blue,
                              size: height * 0.030,
                            )),
                        IconButton(
                            onPressed: () async {
                              RenderRepaintBoundary boundary = bgImage[quoteIndex].currentContext!
                                  .findRenderObject() as RenderRepaintBoundary;
                              ui.Image imageUi = await boundary.toImage();
                              ByteData? byteData =
                              await imageUi.toByteData(format: ui.ImageByteFormat.png);
                              Uint8List img = byteData!.buffer.asUint8List();
                              final path = await getApplicationCacheDirectory();
                              File file = File("${path.path}/img.png");
                              file.writeAsBytes(img);
                              int location= WallpaperManager.HOME_SCREEN;
                              bool result=await WallpaperManager.clearWallpaper();
                              result=await WallpaperManager.setWallpaperFromFile(file.path, location);
                            },
                            icon: Icon(
                              Icons.wallpaper,
                              color: Colors.green,
                              size: height * 0.030,
                            )),
                        IconButton(onPressed: (){Navigator.of(context).pushNamed('/theme');}, icon: Icon(Icons.photo_camera_back,color: Colors.greenAccent,size: height * 0.030,)),
                        IconButton(onPressed: (){
                          setState(() {
                            if (categorie[quoteIndex][authorIndex]['bookmark'] ==
                                'true') {
                              categorie[quoteIndex][authorIndex]['bookmark'] =
                              'false';
                              for (int i = 0;
                              i < favouriteQuotes.length;
                              i++) {
                                if (favouriteQuotes[i].author ==
                                    categorie[quoteIndex][authorIndex]
                                    ['author'] &&
                                    favouriteQuotes[i].quote ==
                                        categorie[quoteIndex][authorIndex]
                                        ['quote']) {
                                  favouriteQuotes.removeAt(i);
                                }
                              }
                            } else {
                              categorie[quoteIndex][authorIndex]['bookmark'] =
                              'true';
                              favouriteQuotes.add(QuoteModel(
                                  author: categorie[quoteIndex][authorIndex]
                                  ['author'],
                                  quote: categorie[quoteIndex][authorIndex]
                                  ['quote']));
                            }
                          });
                        }, icon: Icon((categorie[quoteIndex][authorIndex]['bookmark'] ==
                            'false')
                            ? Icons.star_border
                            : Icons.star,
                          color: (categorie[quoteIndex][authorIndex]['bookmark'] ==
                              'false')
                              ? Colors.blue
                              : Colors.yellow,
                          size: height * 0.030,)),
                      ],),
                    ):
                    Container(
                      height: height * 0.130,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: height * 0.020,),
                      padding: EdgeInsets.symmetric(horizontal: width*0.020),
                      color: Color(0xFF2D2D2D),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(onPressed: (){
                                setState(() {
                                  choose=1;
                                });
                              }, child: Text('Size',
                                style: TextStyle(
                                    color: (choose == 1)
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: (choose == 1)
                                        ? height * 0.022
                                        : height * 0.020),)),
                              TextButton(onPressed: (){
                                setState(() {
                                  choose=2;
                                });
                              }, child: Text('Color',
                                style: TextStyle(
                                    color: (choose == 2)
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: (choose == 2)
                                        ? height * 0.021
                                        : height * 0.020),)),
                              TextButton(onPressed: (){
                                setState(() {
                                  choose=3;
                                });
                              }, child: Text('Font',
                                style: TextStyle(
                                    color: (choose == 3)
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: (choose == 3)
                                        ? height * 0.022
                                        : height * 0.020),)),
                              TextButton(onPressed: (){
                                setState(() {
                                  choose=4;
                                });
                              }, child: Text('Alignment',
                                style: TextStyle(
                                    color: (choose == 4)
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: (choose == 4)
                                        ? height * 0.020
                                        : height * 0.020),)),
                              IconButton(onPressed: (){setState(() {
                                fontStyle=false;
                              });}, icon: Icon(Icons.cancel,color: Colors.grey,size: height*0.025,)),
                            ],
                          ),
                          (choose == 1)
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Text size',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: height * 0.022),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (size < 35) {
                                              size++;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.text_increase_outlined,
                                          color: Colors.grey,
                                          size: height*0.027,
                                        )),
                                    Text(
                                      '$size',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: height * 0.022),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (size > 15) {
                                              size--;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.text_decrease_outlined,
                                          color: Colors.grey,
                                          size: height*0.027,
                                        )),
                                  ],
                                )
                              : (choose == 2)
                                  ? SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Text\ncolor',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.022),
                                          ),
                                          SizedBox(
                                            width: width * 0.010,
                                          ),
                                          ...List.generate(
                                            color.length,
                                            (index) => GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  chooseColor = color[index];
                                                });
                                              },
                                              child: Container(
                                                height: height * 0.045,
                                                width: width * 0.090,
                                                margin: EdgeInsets.all(
                                                    height * 0.007),
                                                color: color[index],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : (choose==3)?SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: [
                                          Text(
                                            'Font\nstyle',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.022),
                                          ),
                                          ...List.generate(fonts.length, (index) => TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  textFont=fonts[index];
                                                });
                                              },
                                              child: Text(
                                                'Sample',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: fonts[index],
                                                    fontSize: height * 0.023),
                                              )),)
                                        ],
                                      ),
                                  ):Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                            Text('Alignment',style: TextStyle(color: Colors.white,fontSize: height*0.020),),
                            IconButton(onPressed: (){
                              setState(() {
                                align=CrossAxisAlignment.start;
                                alignText=TextAlign.left;
                              });
                            }, icon: Icon(Icons.align_horizontal_left,color: Colors.grey,)),
                            IconButton(onPressed: (){
                              setState(() {
                                align=CrossAxisAlignment.center;
                                alignText=TextAlign.center;
                              });
                            }, icon: Icon(Icons.align_horizontal_center,color: Colors.grey,)),
                            IconButton(onPressed: (){
                              setState(() {
                                align=CrossAxisAlignment.end;
                                alignText=TextAlign.right;
                              });
                            }, icon: Icon(Icons.align_horizontal_right,color: Colors.grey,)),
                            IconButton(onPressed: (){
                              setState(() {
                                line=!line;
                              });
                            }, icon: Icon(Icons.text_format,color: Colors.grey,size: height*0.035,))
                          ],),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

