import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 3, 3, 3),
              Color.fromARGB(255, 10, 17, 54),
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
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 0, bottom: 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: const SizedBox(
                  height: 160.0,
                  width: 160.0,
                  child: Image(
                    image: NetworkImage(
                        'https://images.sadhguru.org/mahashivratri/wp-content/uploads/2020/02/Shiva-Wallpaper-Trishul.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 45, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adiyogi',
                    style: GoogleFonts.workSans(
                      color: const Color.fromARGB(255, 255, 252, 252),
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      //fontStyle: FontStyle.italic,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'The Source of Yoga',
                      style: GoogleFonts.workSans(
                        color: const Color.fromARGB(255, 255, 255, 255),

                        //textStyle:Theme.of(context).textTheme.headline4,
                        fontSize: 15,
                        //fontWeight: FontWeight.w500,
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ChhatriDetails()),
        // );
      },
    );
  }
}
