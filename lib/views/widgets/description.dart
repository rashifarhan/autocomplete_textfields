import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home.dart';

int counterValue = 0;

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.5,
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Describe yourself",
              style: GoogleFonts.openSans(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              child: ClayContainer(
                color: white,
                borderRadius: 30,
                depth: -30,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      counterValue = value.length;
                    });
                  },
                  maxLength: 200,
                  style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 40),
                    counterStyle: TextStyle(
                      color: black.withOpacity(0.3),
                      fontSize: 15,
                    ),
                    counterText: "$counterValue/200",
                    prefixIcon: Icon(
                      Icons.description_outlined,
                      color: black.withOpacity(0.2),
                    ),
                    hintText: "Describe yourself(min 50 Characters)",
                    hintStyle:
                        GoogleFonts.openSans(color: black.withOpacity(0.25)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
