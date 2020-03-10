import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

//Model for sharing data
class ClockModel {
  bool is24Format = true;
  Color clockColor = Colors.red;

  Stream<DateTime> timeStream =
  Stream<DateTime>.periodic(Duration(seconds: 1), (index) {
//    if (index == 5) {
//      throw 'error is now';
//    }
    return DateTime.now();
  });
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<ClockModel>.value(
      value: ClockModel(),
      child: MaterialApp(
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
          'home': (context) => Drawer(),
          'clock': (context) => ClockPage()
        },
        initialRoute: 'clock',
      ),
    );
  }
}

class Drawer extends StatefulWidget {
//  final fields that we pass on instantiation

  Drawer();

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    ClockModel model = Provider.of<ClockModel>(context);
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Is 24 hour type'),
                Switch(
                  value: model.is24Format,
                  onChanged: (value) {
                    return model.is24Format = value;
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            DropdownButton<Color>(
              onChanged: (color) {
                setState(() {
                  model.clockColor = color;
                });
              },
              value: model.clockColor,
              items: [
                DropdownMenuItem<Color>(
                  value: Colors.red,
                  child: Text('Red'),
                ),
                DropdownMenuItem<Color>(
                  value: Colors.grey,
                  child: Text('Grey'),
                ),
                DropdownMenuItem<Color>(
                  value: Colors.green,
                  child: Text('Green'),
                ),
                DropdownMenuItem<Color>(
                  value: Colors.blue,
                  child: Text('Blue'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ClockPage extends StatelessWidget {
//  Model passed on construction

  ClockPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Clock'),
      ),
      body: Center(
//          child: Text('$timeNow',style: Theme.of(context).textTheme.display1,)
        child: Consumer<ClockModel>(
          builder: (context, model, child) => StreamBuilder<DateTime>(
              stream: model.timeStream,
              initialData: DateTime.now(),
              builder: (context, AsyncSnapshot<DateTime> snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'There is error ${snapshot.error}',
                    style: Theme.of(context).textTheme.display3,
                  );
                } else if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                var dateTime = snapshot.data;
                var timeString;
                if (model.is24Format) {
                  timeString =
                  '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
                } else {
                  var suffix;
                  if (dateTime.hour > 12) {
                    suffix = 'PM';
                    timeString =
                    '${dateTime.hour - 12}:${dateTime.minute}:${dateTime.second} $suffix';
                  } else {
                    suffix = 'AM';
                    timeString =
                    '${dateTime.hour}:${dateTime.minute}:${dateTime.second} $suffix';
                  }
                }
                return Text(
                  timeString,
                  //Predefined styles from theme. There is more!
                  style: Theme.of(context)
                      .textTheme
                      .display3
                      .copyWith(color: model.clockColor),
                );
              }),
        ),
      ),
    );
  }
}
