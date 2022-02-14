// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:weather_app/page/dashboard/dashboard_page.dart';
import 'package:weather_app/service/get_location_data.dart';
import 'package:weather_app/service/get_weather_data.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? cityName;
    final _cityNameController = TextEditingController();
    _cityNameController.text =
        Provider.of<GetLocation>(context, listen: true).getcity!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(88, 150, 253, 1),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ======================================== City Name
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
                child: TextFormField(
                  controller: _cityNameController,
                  autovalidateMode: AutovalidateMode.disabled,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  cursorRadius: Radius.circular(3),
                  cursorColor: Colors.green,
                  cursorHeight: 20,
                  autocorrect: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'City Name is Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cityName = value!;
                  },
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue[900],
                  ),
                  decoration: InputDecoration(
                      fillColor:
                          Color.fromRGBO(119, 103, 230, 0.15000000596046448),
                      filled: true,
                      contentPadding: EdgeInsets.all(19),
                      focusColor: Color.fromRGBO(120, 104, 230, 1),
                      hintText: "Kolkata",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(120, 104, 230, 0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      labelText: "Enter City Name ",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(120, 104, 230, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink,
                          width: 2,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(120, 104, 230, 1),
                          width: 2,
                        ),
                      )),
                ),
              ),
              // ======================================== City Name
              // =================================================Sumbit Buttom
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(128, 110, 248, 1),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Provider.of<GetLocation>(context, listen: false)
                        .UpdateLocation(cityName)
                        .whenComplete(() => {
                              Provider.of<GetWeatherData>(context,
                                      listen: false)
                                  .getData(cityName)
                            })
                        .whenComplete(() => {
                              Navigator.of(context).push(SwipeablePageRoute(
                                  transitionDuration:
                                      Duration(milliseconds: 870),
                                  canOnlySwipeFromEdge: false,
                                  canSwipe: false,
                                  builder: (BuildContext context) =>
                                      DashBoardPage()))
                            });
                  }
                },
                child: Container(
                  color: Color.fromRGBO(128, 110, 248, 1),
                  width: 220,
                  height: 40,
                  child: Center(child: Text("Wearher at your location ")),
                ),
              ),
              // =================================================Sumbit Buttom
            ],
          ),
        ),
      ),
    );
  }
}
