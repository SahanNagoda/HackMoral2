import 'dart:async';

import 'package:flutter_web/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Duration difference;
  @override
  Widget build(BuildContext context) {
    var event = new DateTime(2019, 06, 29, 09, 00);
    difference = event.difference(new DateTime.now());
    Timer _timer;

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
            () {
              difference = event.difference(new DateTime.now());
            },
          ),
    );

    return Scaffold(
      // appBar: AppBar(
      //   //backgroundColor: Colors.transparent,
      //   elevation: 1.0,
      //   bottomOpacity: 0.0,
      //   toolbarOpacity: 1.0,
      //   title: Text("Hack Moral V2"),
      //   centerTitle: true,
      // ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: ListView(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              child: Card(
                elevation: 100.0,
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("1.jpg"),
                    fit: BoxFit.cover,
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        //width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.width*0.2,
                        child: Image.asset("logo.png",fit: BoxFit.fitHeight,),
                      ),
                      SizedBox(height: 30.0,),
                      Container(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 30.0,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 200,
                              width: 200,
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    difference.inDays.toString(),
                                    style: TextStyle(
                                        fontSize: 80, color: Colors.white),
                                  ),
                                  Text(
                                    "Days",
                                    style: TextStyle(
                                        fontSize: 50, color: Colors.white),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 5.0, color: Colors.grey)),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    getHours(difference).toString(),
                                    style: TextStyle(
                                        fontSize: 80, color: Colors.white),
                                  ),
                                  Text(
                                    "Hours",
                                    style: TextStyle(
                                        fontSize: 50, color: Colors.white),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 5.0, color: Colors.grey)),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    getMinutes(difference).toString(),
                                    style: TextStyle(
                                        fontSize: 80, color: Colors.white),
                                  ),
                                  Text(
                                    "Minutes",
                                    style: TextStyle(
                                        fontSize: 50, color: Colors.white),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 5.0, color: Colors.grey)),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    getSeconds(difference).toString(),
                                    style: TextStyle(
                                        fontSize: 80, color: Colors.white),
                                  ),
                                  Text(
                                    "Seconds",
                                    style: TextStyle(
                                        fontSize: 50, color: Colors.white),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 5.0, color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              height: 90.0,
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Text("© 2019 , made with "),
                  Icon(Icons.favorite),
                  Text(" for be a better Programmer."),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  int getHours(Duration difference) {
    return difference.inHours - (difference.inDays * 24);
  }

  int getMinutes(Duration difference) {
    return difference.inMinutes -
        ((difference.inDays * 24 * 60) + getHours(difference) * 60);
  }

  int getSeconds(Duration difference) {
    return difference.inSeconds -
        ((difference.inDays * 24 * 60 * 60) +
            getHours(difference) * 60 * 60 +
            getMinutes(difference) * 60);
  }
}
