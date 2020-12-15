import 'package:flutter/material.dart';
import 'package:weather_ui/home_page.dart';
import 'package:weather_ui/today.dart';
import 'package:weather_ui/tomorrow.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color PrimaryColor = Colors.blue[300];
Color SecondaryColor = Colors.blue[100];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: PrimaryColor),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: AppBar(
                elevation: 0,
                backgroundColor: PrimaryColor,
                bottom: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: SecondaryColor),
                  onTap: (index) {
                    setState(() {
                      switch (index) {
                        case 0:
                          PrimaryColor = Colors.blue[300];
                          SecondaryColor = Colors.blue[100];
                          break;
                        case 1:
                          PrimaryColor = Colors.purple[300];
                          SecondaryColor = Colors.purple[100];
                          break;
                        case 2:
                          PrimaryColor = Colors.green[300];
                          SecondaryColor = Colors.green[100];
                          break;
                        default:
                      }
                    });
                  },
                  tabs: [
                    new Container(
                      height: 30,
                      width: 100,
                      alignment: Alignment.center,
                      child: Text("Hari Ini"),
                    ),
                    new Container(
                      alignment: Alignment.center,
                      child: Text("Besok"),
                    ),
                    new Container(
                      alignment: Alignment.center,
                      child: Text("10 Hari"),
                    ),
                  ],
                ),
                title: Container(
                  child: Center(
                    child: Text(
                      "Weather App",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            body:
                TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              Today(),
              Tomorrow(),
              HomePage()
            ]),
          )),
    );
  }
}
