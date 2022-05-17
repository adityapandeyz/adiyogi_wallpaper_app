import 'package:adiyogi_wallpaper_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Screens/about_us.dart';
import 'Screens/category_route.dart';
import 'Screens/contact_us.dart';
import 'widgets/footer.dart';

void main() async {
  runApp(
    const MyApp(),
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromARGB(255, 0, 0, 0),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          duration: 2000,
          splash: ClipRRect(
            child: Image.asset(
              'assets/icons/adiyogi_Icon.png',
              //height: iconHeight,
              //width: iconWidth,
            ),
          ),
          nextScreen: RouteOne(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
      routes: {
        '/detail': (context) => const RouteTwo(image: '', name: ''),
      },
    );
  }
}

class PhotoItem {
  final String image;
  final String name;
  PhotoItem(this.image, this.name);
}

class RouteOne extends StatelessWidget {
  final List<PhotoItem> _items = [
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-Moon-on-his-head.jpg",
        "isha.sadhguru.com"),
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-Trishul.jpg",
        "isha.sadhguru.com"),
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-Golden-Morning.jpg",
        "isha.sadhguru.com"),
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-adiyogi-112ft.jpg",
        "isha.sadhguru.com"),
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-adiyogi-112ft-v2.jpg",
        "isha.sadhguru.com"),
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-adiyogi-112ft-v3.jpg",
        "isha.sadhguru.com"),
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-full-moon-night.jpg",
        "isha.sadhguru.com"),
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-blue-purple-sky.jpg",
        "isha.sadhguru.com"),
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-adiyogi-112ft-v4.jpg",
        "isha.sadhguru.com"),
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-Moon-cloudy-sky.jpg",
        "isha.sadhguru.com"),
    PhotoItem(
        "https://cdn.isha.ws/public/wallpapers/wallpaper/Shiva-Wallpaper-metallic.jpg",
        "isha.sadhguru.com"),
  ];

  RouteOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            color: Colors.black,
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "About Us",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    "Contact Us",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // const PopupMenuItem<int>(
                //   value: 2,
                //   child: Text(
                //     "Technology Used",
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUs(),
                  ),
                );
              } else if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactUs(),
                  ),
                );
              } else if (value == 2) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ContactUs(),
                //   ),
                // );
              }
            },
          ),
        ],
        iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255) //change your color here
            ),
        centerTitle: false,
        title: const Text(
          "Adiyogi HD Wallpapers",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color.fromARGB(30, 30, 30, 30),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Header(),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  mainAxisExtent: 150,
                ),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RouteTwo(
                              image: _items[index].image,
                              name: _items[index].name),
                        ),
                      );
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                            imageUrl: _items[index].image,
                            placeholder: (context, url) => Container(
                                  color: const Color(0xfff5f8fd),
                                ),
                            fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
