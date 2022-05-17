import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class RouteTwo extends StatelessWidget {
  final String image;
  final String name;
  const RouteTwo({Key? key, required this.image, required this.name})
      : super(key: key);

  //final PhotoList imageObject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255) //change your color here
            ),
        centerTitle: false,
        // title: const Text(
        //   "Adiyogi: Wallpapers",
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontSize: 18,
        //   ),
        // ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: image,
              height: 400,
              width: 400,
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                child: pleaseWait(),
                // decoration: const BoxDecoration(
                //     // gradient: LinearGradient(
                //     //     colors: [
                //     //   Color(0xFFFFFF22),
                //     //   Color(0xFFF2F2FF),
                //     //   Color(0xFF22FFFF)
                //     // ],
                //     //     begin: FractionalOffset.topLeft,
                //     //     end: FractionalOffset.bottomRight)
                //     ),
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _save(context, image);

                    //Navigator.pop(context);
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff1C1B1B).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      //save1
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // border:
                            //     Border.all(color: Colors.white24, width: 1),
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 57, 14, 177),
                                Color.fromARGB(255, 214, 9, 9),
                              ],
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "Save in Gallary",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    _set(context, image);

                    //Navigator.pop(context);
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff1C1B1B).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      //save1
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //     color: Color.fromARGB(48, 255, 255, 255),
                            //     width: 1),
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 57, 14, 177),
                                Color.fromARGB(255, 214, 9, 9),
                              ],
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "Set as wallpaper",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _set(BuildContext context, image) async {
    await _askPermission();
    int location = WallpaperManager.BOTH_SCREEN;
    var response = await Dio().get(image,
        options: Options(responseType: ResponseType.bytes),
        onReceiveProgress: showDownloadProgress);
    var file = await DefaultCacheManager().getSingleFile(image);

    final bool result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    const snackBar = SnackBar(
      content: Text('Image set as Wallpaper!'),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //print(result);
    // Navigator.pop(context);
  }

  _askPermission() async {
    /*await PermissionHandler()
        .checkPermissionStatus(Permission.storage);*/
    Permission.storage;
  }

  _save(BuildContext context, image) async {
    //await _askPermission();

    var response = await Dio()
        .get(image, options: Options(responseType: ResponseType.bytes));
    //final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));

    const snackBar = SnackBar(
      content: Text('Image Saved In Gallery!'),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //print(result);
    // Navigator.pop(context);
  }

  // _askPermission() async {
  //   /*await PermissionHandler()
  //       .checkPermissionStatus(Permission.storage);*/
  //   Permission.storage;
  //}
}

Widget pleaseWait() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const <Widget>[
      CircularProgressIndicator(
        color: Colors.white,
      )
    ],
  );
}

void showDownloadProgress(received, total) {
  if (total != -1) {
    print((received / total * 100).toStringAsFixed(0) + "%");
  }
}
