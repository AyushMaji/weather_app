// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomLocation extends StatelessWidget {
  final String? city;
  final String? country;
  final String? date;
  const CustomLocation(
      {Key? key, required this.city, required this.country, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city!,
                textScaleFactor: 0.85,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(68, 59, 167, 1)),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                country!,
                textScaleFactor: 0.85,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(68, 59, 167, 1)),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                date!,
                textScaleFactor: 0.85,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 0.49)),
              ),
            ],
          ),
        ),
        Image.asset(
          "assets/image/locationPic.png",
          height: 94,
        )
      ],
    );
  }
}
