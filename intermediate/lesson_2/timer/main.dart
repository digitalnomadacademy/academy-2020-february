import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

//Model for sharing data
class TimerModel {
  Duration duration;
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
        'timer': (context) => TimerPage(
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
      body: Center(
//        Chooses the duration of the timer
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.ms,
          onTimerDurationChanged: (Duration duration) {
//            This functions runs every time we spin the wheel
            model.duration = duration;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.timer),
        onPressed: () {
//          Go to timer page
          Navigator.of(context).pushNamed('timer');
        },
      ),
    );
  }
}

class TimerPage extends StatefulWidget {
//  Model passed on construction
  final TimerModel model;

  TimerPage({this.model});

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage>
    with SingleTickerProviderStateMixin {
//  State variables
  AnimationController timerController;
  DateTime startTime;
  Duration timeLeftDuration = Duration.zero;

//  Init state runs before any build when we open the page
  @override
  void initState() {
    super.initState();

//    start time for countdown
    startTime = DateTime.now();
//    timer controller with duration from the model
    timerController =
        AnimationController(vsync: this, duration: widget.model.duration);

//    start the controller
    timerController.forward();

//    decide what to do on each frame, until the duration finishes
    timerController.addListener(() {
      setState(() {
//        First take the difference from start time to now
        Duration difference = startTime.difference(DateTime.now());
//        Because the difference is negative, add that number to original Duration
        timeLeftDuration = widget.model.duration + difference;
//        If it goes little below zero, set it back to zero
//        Each frame is not specific on time
        if (timeLeftDuration < Duration.zero) {
          timeLeftDuration = Duration.zero;
        }
      });
    });
//    when animation is finished, set the duration to Zero as well, in case
//    it was little bit positive.

//    Try to comment out this code and < Zero code to see the difference
    timerController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        timeLeftDuration = Duration.zero;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
//          We show calculated duration
          timeLeftDuration.toString(),
//          timeLeftDuration.toString().split('.')[0],

//        Predefined styles from theme. There is more!
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:
//            conditional expression with (bool ? ifTrueThis : ifFalseThis)
        Icon(timerController.isAnimating ? Icons.stop : Icons.arrow_back),
        onPressed: () {
//          when button is pressed, reset the controller and go back home
          timerController.reset();
          Navigator.of(context).pushNamed('home');
        },
      ),
    );
  }
}
