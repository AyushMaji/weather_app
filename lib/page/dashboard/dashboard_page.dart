// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:weather_app/page/dashboard/details_page.dart';
import 'package:weather_app/page/dashboard/search_page.dart';
import 'package:weather_app/service/get_location_data.dart';
import 'package:weather_app/service/get_weather_data.dart';
import 'package:weather_app/widget/appbar/custom_appbar.dart';
import 'package:weather_app/widget/card/dashboard_weather_card.dart';
import 'package:weather_app/widget/location/location_card.dart';
import 'package:weather_app/page/dashboard/location_map.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: CustomAppbar(
              locationbtn: () {
                Navigator.of(context).push(SwipeablePageRoute(
                    transitionDuration: Duration(milliseconds: 870),
                    canOnlySwipeFromEdge: false,
                    canSwipe: false,
                    builder: (BuildContext context) => LocationDialog()));
              },
              searchbtn: () {
                Navigator.of(context).push(SwipeablePageRoute(
                    transitionDuration: Duration(milliseconds: 870),
                    canOnlySwipeFromEdge: false,
                    canSwipe: false,
                    builder: (BuildContext context) => SearchPage()));
              },
            )),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomLocation(
                city: Provider.of<GetLocation>(context, listen: true).getcity,
                country: Provider.of<GetWeatherData>(context, listen: true)
                    .getcountry,
                date:
                    Provider.of<GetWeatherData>(context, listen: true).gettime,
              ),
              SizedBox(height: 50),
              DashWeatherCard(
                description: Provider.of<GetWeatherData>(context, listen: true)
                    .getdescription,
                icon:
                    Provider.of<GetWeatherData>(context, listen: true).geticon,
                temp:
                    Provider.of<GetWeatherData>(context, listen: true).gettemp,
                feeltemp: Provider.of<GetWeatherData>(context, listen: true)
                    .getfeeltemp,
              ),
              SizedBox(height: 30),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
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
                            color: Color.fromRGBO(248, 248, 248, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Image.asset(
                              "assets/image/rain.png",
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${Provider.of<GetWeatherData>(context, listen: true).gethumidity}%',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.8299999833106995),
                              fontFamily: 'Hind',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1),
                        )
                      ],
                    ),
                    Column(
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
                            color: Color.fromRGBO(248, 248, 248, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Image.asset(
                              "assets/image/windicon.png",
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${Provider.of<GetWeatherData>(context, listen: true).getpressure} hPa',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.8299999833106995),
                              fontFamily: 'Hind',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1),
                        )
                      ],
                    ),
                    Column(
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
                            color: Color.fromRGBO(248, 248, 248, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/image/himudity.png",
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${Provider.of<GetWeatherData>(context, listen: true).getwindSpeed} m/s',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.8299999833106995),
                              fontFamily: 'Hind',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1),
                        )
                      ],
                    )
                  ]),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(68, 59, 167, 1),
                            fontFamily: 'Nunito Sans',
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            height: 1),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(SwipeablePageRoute(
                              transitionDuration: Duration(milliseconds: 870),
                              canOnlySwipeFromEdge: false,
                              canSwipe: false,
                              builder: (BuildContext context) =>
                                  DetailsPage()));
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Shimmer.fromColors(
                          period: const Duration(seconds: 3),
                          baseColor: Color.fromRGBO(83, 65, 210, 0.86),
                          highlightColor: Color.fromRGBO(83, 65, 210, 0.16),
                          child: Text(
                            'All details > >>',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(88, 151, 249, 1),
                                fontFamily: 'Hind',
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      )
                    ]),
              ),
              SizedBox(height: 7),
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
                              fontSize: 14,
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
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
