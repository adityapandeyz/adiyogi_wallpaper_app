import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 57, 14, 177),
            Color.fromARGB(255, 214, 9, 9),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
          )
        ],
      ),
      height: 160,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 30, right: 16),
        child: Column(
          children: [
            Text(
              'brought to you by',
              style: GoogleFonts.josefinSans(
                color: const Color.fromARGB(255, 255, 252, 252),
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 28,
                fontWeight: FontWeight.w500,
                //fontStyle: FontStyle.italic,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Color.fromARGB(255, 0, 0, 0),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'dotResolution Studio',
                      style: GoogleFonts.workSans(
                        color: const Color.fromARGB(255, 255, 255, 255),

                        //textStyle:Theme.of(context).textTheme.headline4,
                        fontSize: 15,
                        //fontWeight: FontWeight.w500,
                        //fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: _launchURL,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    final url = Uri.encodeFull('https://dresolution.tech/');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
