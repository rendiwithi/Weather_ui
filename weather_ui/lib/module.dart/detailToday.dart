import 'package:flutter/material.dart';
class DetailToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height /4,
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.blue[50],
                Colors.white,
              ])),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detail saat ini",
                      style: TextStyle(fontSize: 24),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  "Kelembapan",
                                  style: TextStyle(fontSize: 14,color: Colors.black54),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Text(
                                  "87%",
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  "Titik Embun",
                                  style: TextStyle(fontSize: 14,color: Colors.black54),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Text(
                                  "24°C",
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  "Visibilitas",
                                  style: TextStyle(fontSize: 14,color: Colors.black54),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Text(
                                  "14 Km",
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}