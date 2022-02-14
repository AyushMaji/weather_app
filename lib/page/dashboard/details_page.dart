// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/service/get_location_data.dart';
import 'package:weather_app/service/get_weather_data.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sunrise = DateTime.fromMillisecondsSinceEpoch(int.parse(
            Provider.of<GetWeatherData>(context, listen: true).getsunrise!))
        .toString();
    var sunset = DateTime.fromMillisecondsSinceEpoch(int.parse(
            Provider.of<GetWeatherData>(context, listen: true).getsunset!))
        .toString();
    return Scaffold(
      body: Container(
        height: 900,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(127, 175, 255, 1),
          Color.fromRGBO(169, 202, 255, 1),
        ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.07999999821186066),
                                offset: Offset(0, 4),
                                blurRadius: 25)
                          ],
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        Provider.of<GetLocation>(context, listen: true)
                            .getcity!
                            .toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Nunito Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 1),
                      ),
                    )
                  ]),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 68,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(49),
                        topRight: Radius.circular(49),
                        bottomLeft: Radius.circular(49),
                        bottomRight: Radius.circular(49),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(75, 135, 226, 0.25),
                            offset: Offset(2, 4),
                            blurRadius: 15)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Max',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Color.fromRGBO(2, 31, 77, 0.5899999737739563),
                              fontFamily: 'Hind',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Image.asset("assets/image/maxtemp.png"),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${Provider.of<GetWeatherData>(context, listen: true).getmaxtemp} \u2103',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Color.fromRGBO(2, 31, 77, 0.5899999737739563),
                              fontFamily: 'Hind',
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 68,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(49),
                        topRight: Radius.circular(49),
                        bottomLeft: Radius.circular(49),
                        bottomRight: Radius.circular(49),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment(
                              -0.4579692482948303, 0.5420307517051697),
                          end: Alignment(
                              -0.5420307517051697, -0.7420307517051697),
                          colors: [
                            Color.fromRGBO(128, 110, 248, 1),
                            Color.fromRGBO(181, 151, 255, 1)
                          ]),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Min',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hind',
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              height: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Image.asset("assets/image/mintemp.png"),
                        ),
                        SizedBox(height: 9),
                        Text(
                          '${Provider.of<GetWeatherData>(context, listen: true).getmintemp} \u2103',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hind',
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              height: 1),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 68,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(49),
                        topRight: Radius.circular(49),
                        bottomLeft: Radius.circular(49),
                        bottomRight: Radius.circular(49),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(75, 135, 226, 0.25),
                            offset: Offset(2, 4),
                            blurRadius: 15)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Avg',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Color.fromRGBO(2, 31, 77, 0.5899999737739563),
                              fontFamily: 'Hind',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Image.asset("assets/image/avgtemp.png"),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${Provider.of<GetWeatherData>(context, listen: true).gettemp} \u2103',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Color.fromRGBO(2, 31, 77, 0.5899999737739563),
                              fontFamily: 'Hind',
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 68,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(49),
                        topRight: Radius.circular(49),
                        bottomLeft: Radius.circular(49),
                        bottomRight: Radius.circular(49),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(75, 135, 226, 0.25),
                            offset: Offset(2, 4),
                            blurRadius: 15)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Feel',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Color.fromRGBO(2, 31, 77, 0.5899999737739563),
                              fontFamily: 'Hind',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset("assets/image/feeltemp.png"),
                        ),
                        SizedBox(height: 0),
                        Text(
                          '${Provider.of<GetWeatherData>(context, listen: true).getfeeltemp} \u2103',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Color.fromRGBO(2, 31, 77, 0.5899999737739563),
                              fontFamily: 'Hind',
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 145),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 790,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      top: -80,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 312,
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
                              begin: Alignment(
                                  -0.4579692482948303, 0.5420307517051697),
                              end: Alignment(
                                  -0.5420307517051697, -0.7420307517051697),
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
                                "assets/image/${Provider.of<GetWeatherData>(context, listen: true).geticon}.png",
                                height: 160,
                              ),
                            ),
                            Positioned(
                                left: 22,
                                top: 137,
                                child: Text(
                                  Provider.of<GetWeatherData>(context,
                                          listen: true)
                                      .getdescription!,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      height: 1),
                                )),
                            Positioned(
                              right: 22,
                              top: 110,
                              child: Image.asset(
                                "assets/image/wind.png",
                                height: 50,
                              ),
                            ),
                            Positioned(
                                right: 35,
                                top: 85,
                                child: Text(
                                  'Feel like ${Provider.of<GetWeatherData>(context, listen: true).getfeeltemp!} \u2103',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                )),
                            Positioned(
                                right: 32,
                                top: 14,
                                child: ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) => LinearGradient(
                                      begin: Alignment(-0.4579692482948303,
                                          0.7420307517051697),
                                      end: Alignment(-0.4420307517051697,
                                          -0.2420307517051697),
                                      colors: [
                                        Color.fromRGBO(242, 248, 255, 0),
                                        Color.fromRGBO(242, 248, 255, 20),
                                      ]).createShader(
                                    Rect.fromLTWH(
                                        0, 0, bounds.width, bounds.height),
                                  ),
                                  child: Text(
                                    Provider.of<GetWeatherData>(context,
                                            listen: true)
                                        .gettemp!,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 50,
                                        fontWeight: FontWeight.w600,
                                        height: 1),
                                  ),
                                )),
                            Positioned(
                              right: 25,
                              bottom: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(19),
                                        topRight: Radius.circular(19),
                                        bottomLeft: Radius.circular(19),
                                        bottomRight: Radius.circular(19),
                                      ),
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.25),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: Image.asset(
                                        "assets/image/rain.png",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${Provider.of<GetWeatherData>(context, listen: true).gethumidity}%',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Hind',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 1),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              left: 20,
                              right: 20,
                              bottom: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(19),
                                        topRight: Radius.circular(19),
                                        bottomLeft: Radius.circular(19),
                                        bottomRight: Radius.circular(19),
                                      ),
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.25),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Image.asset(
                                        "assets/image/windicon.png",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${Provider.of<GetWeatherData>(context, listen: true).getpressure} hPa',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Hind',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 1),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              left: 25,
                              bottom: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(19),
                                        topRight: Radius.circular(19),
                                        bottomLeft: Radius.circular(19),
                                        bottomRight: Radius.circular(19),
                                      ),
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.25),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/image/himudity.png",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    '${Provider.of<GetWeatherData>(context, listen: true).getwindSpeed} m/s',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Hind',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 1),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 270,
                      child: Container(
                        height: 95,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.07999999821186066),
                                offset: Offset(0, 4),
                                blurRadius: 25)
                          ],
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Image.asset(
                                  "assets/image/sunrise.png",
                                  height: 57,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Sunrise      ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(88, 150, 253, 1),
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        height: 1),
                                  ),
                                ),
                              ]),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  sunrise,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.33000001311302185),
                                      fontFamily: 'Hind',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 390,
                      child: Container(
                        height: 85,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.07999999821186066),
                                offset: Offset(0, 4),
                                blurRadius: 25)
                          ],
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Image.asset(
                                  "assets/image/sunset.png",
                                  height: 55,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 13.0),
                                  child: Text(
                                    'Sunset      ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(88, 150, 253, 1),
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        height: 1),
                                  ),
                                ),
                              ]),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  sunset,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.33000001311302185),
                                      fontFamily: 'Hind',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 510,
                      child: Container(
                        height: 85,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.07999999821186066),
                                offset: Offset(0, 4),
                                blurRadius: 25)
                          ],
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Image.asset(
                                  "assets/image/windicon.png",
                                  height: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    'Wind (Speed)',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(88, 150, 253, 1),
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        height: 1),
                                  ),
                                ),
                              ]),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  "${Provider.of<GetWeatherData>(context, listen: true).getwindSpeed!} m/s",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.33000001311302185),
                                      fontFamily: 'Hind',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 630,
                      child: Container(
                        height: 85,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.07999999821186066),
                                offset: Offset(0, 4),
                                blurRadius: 25)
                          ],
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 38),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Image.asset(
                                  "assets/image/winddeg.png",
                                  height: 55,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    'Wind (Deg)',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(88, 150, 253, 1),
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        height: 1),
                                  ),
                                ),
                              ]),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  "${Provider.of<GetWeatherData>(context, listen: true).getwinddeg!}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.33000001311302185),
                                      fontFamily: 'Hind',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
