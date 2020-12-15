import 'package:flutter/material.dart';
import 'package:weather_ui/module.dart/todayModule.dart';
import 'package:weather_ui/module.dart/tomorrowModule.dart';

class Tomorrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple[100], Colors.white])),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple[100], Colors.white])),
        height: MediaQuery.of(context).size.height - 120,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Rabu, 16 Desember",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Malam Hari 23°",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "29°C",
                                style: TextStyle(
                                    fontSize: 75, color: Colors.white60),
                              ),
                              Text(
                                "Mojokerto",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Image.asset(
                                  "images/mendung_cerah.png",
                                  width: MediaQuery.of(context).size.width / 4,
                                ),
                              ),
                              Text(
                                "Berawan",
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 110,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: tomorrowWeather.map((place) {
                    return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(place.temp),
                            Image.asset(
                              place.imageWeather,
                              height: MediaQuery.of(context).size.height / 15,
                            ),
                            Text(place.time)
                          ],
                        ));
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
