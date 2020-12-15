import 'package:flutter/material.dart';
import 'package:weather_ui/module.dart/detailToday.dart';
import 'package:weather_ui/module.dart/todayModule.dart';

class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue[100], Colors.blue[50]])),
          height: MediaQuery.of(context).size.height - 120,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                  Container(
                    child: Text(
                      "Selasa, 15 Desember",
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
                              "30°C",
                              style: TextStyle(
                                fontSize: 75,
                                color: Colors.white60,
                              ),
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
                        children: todayWeather.map((place) {
                          return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(place.temp),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      place.imageWeather,
                                      height:
                                          MediaQuery.of(context).size.height / 15,
                                    ),
                                  ),
                                  Text(place.time)
                                ],
                              ));
                        }).toList()),
                  ),
            ],
          ),
        ),
        Container(child: DetailToday(),)
      ],
    );
  }
}
