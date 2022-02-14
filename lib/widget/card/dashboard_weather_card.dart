// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DashWeatherCard extends StatelessWidget {
  final String? icon;
  final String? temp;
  final String? feeltemp;
  final String? description;
  const DashWeatherCard(
      {Key? key,
      required this.icon,
      required this.temp,
      required this.feeltemp,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: 185,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(194, 217, 253, 1),
              offset: Offset(0, 9),
              blurRadius: 15)
        ],
        gradient: LinearGradient(
            begin: Alignment(-0.4579692482948303, 0.5420307517051697),
            end: Alignment(-0.5420307517051697, -0.7420307517051697),
            colors: [
              Color.fromRGBO(88, 150, 253, 1),
              Color.fromRGBO(174, 205, 255, 1)
            ]),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            left: 2,
            top: -50,
            child: Image.asset(
              "assets/image/$icon.png",
              height: 160,
            ),
          ),
          Positioned(
              left: 22,
              bottom: 25,
              child: Text(
                description!,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Nunito Sans',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    height: 1),
              )),
          Positioned(
            right: 22,
            bottom: 25,
            child: Image.asset(
              "assets/image/wind.png",
              height: 50,
            ),
          ),
          Positioned(
              right: 35,
              bottom: 85,
              child: Text(
                'Feel like $feeltemp \u2103',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Nunito Sans',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    height: 1),
              )),
          Positioned(
              right: 32,
              top: 16,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => LinearGradient(
                    begin: Alignment(-0.4579692482948303, 0.7420307517051697),
                    end: Alignment(-0.4420307517051697, -0.2420307517051697),
                    colors: [
                      Color.fromRGBO(242, 248, 255, 0),
                      Color.fromRGBO(242, 248, 255, 1),
                    ]).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Text(
                  temp!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Nunito Sans',
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
              )),
        ],
      ),
    );
  }
}
