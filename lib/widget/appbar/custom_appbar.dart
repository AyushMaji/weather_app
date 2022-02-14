import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final GestureTapCallback searchbtn;
  final GestureTapCallback locationbtn;

  const CustomAppbar(
      {Key? key, required this.searchbtn, required this.locationbtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: locationbtn,
          child: Image.asset("assets/image/leadingicon.png"),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: InkWell(
            radius: 70,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: searchbtn,
            child: Image.asset("assets/image/search.png"),
          ),
        )
      ],
    );
  }
}
