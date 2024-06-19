import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/uttils/list/background/bg.dart';
import 'package:share_extend/share_extend.dart';

QuoteModel? quoteModel;
List<GlobalKey> bgImage =
List.generate(favouriteQuotes.length, (index) => GlobalKey());

class favourite extends StatefulWidget {
  const favourite({super.key});

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
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
          'Favourite',
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
          itemCount: favouriteQuotes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: height * 0.007 / 9),
          itemBuilder: (context, index) => Container(
            height: height * 0.700,
            width: double.infinity,
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
                          '${favouriteQuotes[index].quote}',
                          style: TextStyle(
                              fontSize: height * 0.025,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SelectableText(
                          '~ ${favouriteQuotes[index].author}',
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
                                  '${favouriteQuotes[index].quote.toString()}\n${favouriteQuotes[index].author.toString()}'));
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
                                if (favouriteQuotes[index].bookmark ==
                                    'true') {
                                  favouriteQuotes[index].bookmark =
                                  'false';
                                  for (int i = 0;
                                  i < favouriteQuotes.length;
                                  i++) {
                                    if (favouriteQuotes[i].author ==
                                        favouriteQuotes[index].author &&
                                        favouriteQuotes[i].quote ==
                                            favouriteQuotes[index].quote) {
                                      favouriteQuotes.removeAt(i);
                                    }
                                  }
                                } else {
                                  favouriteQuotes[index].bookmark =
                                  'true';
                                  favouriteQuotes.add(QuoteModel(
                                      author: favouriteQuotes[index].author,
                                      quote: favouriteQuotes[index].quote));
                                }
                              });
                            },
                            icon: Icon(
                              (favouriteQuotes[index].bookmark ==
                                  'false')
                                  ? Icons.star_border
                                  : Icons.star,
                              color: (favouriteQuotes[index].bookmark ==
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