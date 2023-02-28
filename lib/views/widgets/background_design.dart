import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


import '../home.dart';

class BackgroundDesign extends StatelessWidget {
  const BackgroundDesign({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: white,
          height: size.height * 0.4,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: -size.height * 0.03,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClayContainer(
                      color: white,
                      width: 220,
                      height: 220,
                      borderRadius: 200,
                      depth: -50,
                      curveType: CurveType.convex,
                    ),
                    ClayContainer(
                      color: white,
                      width: 180,
                      height: 180,
                      borderRadius: 200,
                      depth: 50,
                    ),
                    ClayContainer(
                      color: white,
                      width: 140,
                      height: 140,
                      borderRadius: 200,
                      depth: 50,
                      curveType: CurveType.convex,
                    ),
                    ClayContainer(
                      color: white,
                      width: 100,
                      height: 100,
                      borderRadius: 200,
                      depth: 50,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: size.height * 0.4,
          child: Stack(children: [
            Positioned(
              left: -size.width * 0.05,
              bottom: size.height * 0.1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClayContainer(
                    color: white,
                    width: 160,
                    height: 160,
                    borderRadius: 200,
                    depth: 50,
                    curveType: CurveType.convex,
                  ),
                  ClayContainer(
                    color: white,
                    width: 140,
                    height: 140,
                    borderRadius: 200,
                    depth: -50,
                    curveType: CurveType.convex,
                  ),
                  ClayContainer(
                    color: white,
                    width: 70,
                    height: 70,
                    borderRadius: 200,
                    depth: 50,
                  ),
                ],
              ),
            )
          ]),
        ),
        Container(
          height: size.height * 0.4,
          child: Stack(
            children: [
              Positioned(
                left: size.width * 0.6,
                bottom: 10,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClayContainer(
                      color: white,
                      height: 100,
                      width: 100,
                      borderRadius: 200,
                      depth: 50,
                      curveType: CurveType.convex,
                    ),
                    ClayContainer(
                      color: white,
                      height: 80,
                      width: 80,
                      borderRadius: 200,
                      depth: -50,
                      curveType: CurveType.convex,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
