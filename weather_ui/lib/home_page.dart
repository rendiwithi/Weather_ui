import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _borderRadius = 24;

  var items = [
    PlaceInfo('Hari Ini', Color(0xff42E695), Color(0xff3BB2B8), '30°C',
        'Mojokerto', 'Gerimis Berpetir', 'images/hujan.png'),
    PlaceInfo('Rabu, 16 Des', Color(0xff3BB2B8), Color(0xff42E695), '29°C',
        'Mojokerto', 'Gerimis Berpetir', 'images/hujan.png'),
    PlaceInfo('Kamis, 17 Des', Color(0xff42E695), Color(0xff3BB2B8), '33°C',
        'Mojokerto', 'Hujan Berpetir', 'images/hujan.png'),
    PlaceInfo("Jum'at, 18 Des", Color(0xff3BB2B8), Color(0xff42E695), '30°C',
        'Mojokerto', 'Hujan Berpetir', 'images/hujan.png'),
    PlaceInfo('Sabtu, 19 Des', Color(0xff42E695), Color(0xff3BB2B8), '32°C',
        'Mojokerto', 'Gerimis Berpetir', 'images/hujan.png'),
    PlaceInfo('Minggu, 20 Des', Color(0xff3BB2B8), Color(0xff42E695), '32°C',
        'Mojokerto', 'Hujan Berpetir', 'images/hujan.png'),
    PlaceInfo('Senin, 21 Des', Color(0xff42E695), Color(0xff3BB2B8), '32°C',
        'Mojokerto', 'Gerimis Berpetir', 'images/hujan.png'),
    PlaceInfo('Selasa, 22 Des', Color(0xff3BB2B8), Color(0xff42E695), '33°C',
        'Mojokerto', 'Hujan Berpetir', 'images/hujan.png'),
    PlaceInfo('Rabu, 23 Des', Color(0xff42E695), Color(0xff3BB2B8), '32°C',
        'Mojokerto', 'Gerimis Berpetir', 'images/hujan.png'),
    PlaceInfo('Kamis, 24 Des', Color(0xff3BB2B8), Color(0xff42E695), '31°C',
        'Mojokerto', 'Hujan Berpetir', 'images/hujan.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      gradient: LinearGradient(colors: [
                        items[index].startColor,
                        items[index].endColor
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: items[index].endColor,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: CustomPaint(
                      size: Size(100, 150),
                      painter: CustomCardShapePainter(_borderRadius,
                          items[index].startColor, items[index].endColor),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            items[index].imagesToday,
                            height: 50,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                items[index].category,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: Text(
                                      items[index].location,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                items[index].rating,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final String category;
  final String location;
  final String rating;
  final String imagesToday;
  final Color startColor;
  final Color endColor;

  PlaceInfo(this.name, this.startColor, this.endColor, this.rating,
      this.location, this.category, this.imagesToday);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
