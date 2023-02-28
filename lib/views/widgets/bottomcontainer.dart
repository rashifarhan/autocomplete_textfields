import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/views/widgets/description.dart';

import '../home.dart';

class BottomContainer extends StatefulWidget {
  BottomContainer({super.key});

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          child: ClayContainer(
            height: size.height * 0.3,
            color: white,
            depth: 60,
            spread: 20,
            customBorderRadius: const BorderRadius.only(
              topRight: Radius.elliptical(350, 250),
              topLeft: Radius.elliptical(250, 250),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPressed = true;
                    });

                    if (counterValue < 15) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Enter all details")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("Success")));
                    }
                  },
                  onDoubleTap: () {
                    setState(() {
                      isPressed = false;
                    });
                  },
                  child: ClayContainer(
                    color: white,
                    depth: 20,
                    borderRadius: 30,
                    curveType: isPressed == false
                        ? CurveType.convex
                        : CurveType.concave,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
