import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: ContainerExample(),
    );
  }
}

class ContainerExample extends StatefulWidget {
  @override
  _ContainerExampleState createState() => _ContainerExampleState();
}

class _ContainerExampleState extends State<ContainerExample> {
  Color color = Colors.yellow;
  var random = math.Random();
  double height = 150;
  double width = 150;
  double left = 0;
  double top = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Home'),
      ),
      body: Stack(
        children: [
          Center(
            child: Text('I am in the center'),
          ),

          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: left,
            top: top,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              color: color,
              height: height,
              width: width,
              child: Align(
                child: Container(
                  color: Colors.black,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            color = Colors.primaries[random.nextInt(Colors.primaries.length)];
            width = height = random.nextInt(200).floorToDouble() + 50;
            left = random.nextInt(200).floorToDouble();
            top = random.nextInt(500).floorToDouble();
            print('color changed to $color');
          });
        },
      ),
    );
  }
}
