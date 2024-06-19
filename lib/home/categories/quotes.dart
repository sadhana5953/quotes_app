import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:share_extend/share_extend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/home/categories/staatus.dart';
import 'package:quotes_app/uttils/list/categories/categories.dart';
import 'package:share_extend/share_extend.dart';
import '../../uttils/list/background/bg.dart';

QuoteModel? quoteModel;
List<GlobalKey> bgImage =
    List.generate(categorie[selected].length, (index) => GlobalKey());

class quote extends StatefulWidget {
  const quote({super.key});

  @override
  State<quote> createState() => _quoteState();
}

class _quoteState extends State<quote> {
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
          '${Quote!} Status',
          style: TextStyle(
              color: Colors.white,
              letterSpacing: height * 0.0007,
              fontWeight: FontWeight.bold,
              fontFamily: 'chocolate'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          itemCount: categorie[selected].length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 8/12),
          itemBuilder: (context, index) => Container(
            // height: height * 0.700,
            // width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: height * 0.015),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      spreadRadius: height * 0.001,
                      blurRadius: height * 0.007)
                ],
                borderRadius: BorderRadius.circular(height * 0.010),
                color: Color(0xFF3B3B3D)),
            child: Column(
              children: [
                RepaintBoundary(
                  key: bgImage[index],
                  child: GestureDetector(
                    onTap: () {
                      image = bg[index]['img'];
                      quoteIndex = selected;
                      authorIndex = index;
                      size=20;
                      chooseColor=Colors.white;
                      textFont='chocolate';
                      fontStyle=false;
                      line=false;
                      align=CrossAxisAlignment.center;
                      alignText=TextAlign.center;
                      Navigator.of(context).pushNamed('/edit');
                    },
                    child: Container(
                      height: height * 0.500,
                      width: double.infinity,
                      padding: EdgeInsets.all(width * 0.035),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                bg[index]['img'],
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(height * 0.010),
                              topLeft: Radius.circular(height * 0.010)),
                          color: Colors.grey),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SelectableText(
                            '${categorie[selected][index]['quote']}',
                            style: TextStyle(
                                fontSize: height * 0.025,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SelectableText(
                            '~ ${categorie[selected][index]['author']}',
                            style: TextStyle(
                                fontFamily: 'chocolate',
                                fontSize: height * 0.024,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                bg[index]['img'] = bg[no]['img'];
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
                        Text(
                          'Bg',
                          style: TextStyle(
                              fontSize: height * 0.020, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                      '${categorie[selected][index]['quote'].toString()}\n${categorie[selected][index]['author'].toString()}'));
                            },
                            icon: Icon(
                              Icons.copy,
                              color: Colors.blue,
                              size: height * 0.030,
                            )),
                        Text(
                          'Copy',
                          style: TextStyle(
                              fontSize: height * 0.020, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                              RenderRepaintBoundary boundary = bgImage[index]
                                  .currentContext!
                                  .findRenderObject() as RenderRepaintBoundary;
                              ui.Image imageUi = await boundary.toImage();
                              ByteData? byteData = await imageUi.toByteData(
                                  format: ui.ImageByteFormat.png);
                              Uint8List img = byteData!.buffer.asUint8List();
                              final path = await getApplicationCacheDirectory();
                              File file = File("${path.path}/img.png");
                              file.writeAsBytes(img);
                              ShareExtend.share(file.path, "image");
                            },
                            icon: Icon(
                              Icons.share,
                              color: Colors.red,
                              size: height * 0.030,
                            )),
                        Text(
                          'Share',
                          style: TextStyle(
                              fontSize: height * 0.020, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                              RenderRepaintBoundary boundary = bgImage[index]
                                  .currentContext!
                                  .findRenderObject() as RenderRepaintBoundary;
                              ui.Image image = await boundary.toImage();
                              ByteData? byteData = await image.toByteData(
                                  format: ui.ImageByteFormat.png);
                              Uint8List img = byteData!.buffer.asUint8List();

                              ImageGallerySaver.saveImage(img);
                            },
                            icon: Icon(
                              Icons.save_alt,
                              color: Colors.green,
                              size: height * 0.030,
                            )),
                        Text(
                          'Save',
                          style: TextStyle(
                              fontSize: height * 0.020, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (categorie[selected][index]['bookmark'] ==
                                    'true') {
                                  categorie[selected][index]['bookmark'] =
                                      'false';
                                  for (int i = 0;
                                      i < favouriteQuotes.length;
                                      i++) {
                                    if (favouriteQuotes[i].author ==
                                            categorie[selected][index]
                                                ['author'] &&
                                        favouriteQuotes[i].quote ==
                                            categorie[selected][index]
                                                ['quote']) {
                                      favouriteQuotes.removeAt(i);
                                    }
                                  }
                                } else {
                                  categorie[selected][index]['bookmark'] =
                                      'true';
                                  favouriteQuotes.add(QuoteModel(
                                      author: categorie[selected][index]
                                          ['author'],
                                      quote: categorie[selected][index]
                                          ['quote'],bookmark: categorie[selected][index]['bookmark']));
                                }
                              });
                            },
                            icon: Icon(
                              (categorie[selected][index]['bookmark'] ==
                                      'false')
                                  ? Icons.star_border
                                  : Icons.star,
                              color: (categorie[selected][index]['bookmark'] ==
                                      'false')
                                  ? Colors.blue
                                  : Colors.yellow,
                              size: height * 0.030,
                            )),
                        Text(
                          'Bookmark',
                          style: TextStyle(
                              fontSize: height * 0.020, color: Colors.white),
                        ),
                      ],
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

int no = 0;
bool book = false;
