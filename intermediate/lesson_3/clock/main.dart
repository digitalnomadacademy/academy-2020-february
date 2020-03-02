import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

//Model for sharing data
class TimerModel {
  Stream<DateTime> timeStream = Stream<DateTime>.periodic(
      Duration(seconds: 1), (index) => DateTime.now());
}

class _MyAppState extends State<MyApp> {
  TimerModel model = TimerModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => HomePage(
          model: model,
        ),
        'clock': (context) => ClockPage(
          model: model,
        )
      },
      initialRoute: 'home',
    );
  }
}

class HomePage extends StatelessWidget {
//  final fields that we pass on instantiation
  final TimerModel model;

  HomePage({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.timer),
        onPressed: () {
//          Go to timer page
          Navigator.of(context).pushNamed('clock');
        },
      ),
    );
  }
}

class ClockPage extends StatelessWidget {
//  Model passed on construction
  final TimerModel model;

  ClockPage({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<DateTime>(
            stream: model.timeStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('There is error');
              }
              return Text(
                snapshot.data.toString(),

//        Predefined styles from theme. There is more!
                style: Theme.of(context).textTheme.display3,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child:
//            conditional expression with (bool ? ifTrueThis : ifFalseThis)
        Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pushNamed('home');
        },
      ),
    );
  }
}
