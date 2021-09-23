import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../pallete.dart';
import '../activities.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: close_sinks
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Activity Wheel', style: kBodyText),
          centerTitle: false,
          actions: [
            IconButton(
                icon: Icon(Icons.list),
                onPressed: () {
                  Navigator.pushNamed(context, 'ActivityScreen');
                }),
          ],
        ),
        body: Container(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selected.add(Fortune.randomInt(0, 5));
              });
            },
            child: Column(
              children: [
                Expanded(
                    child: FortuneWheel(
                  animateFirst: false,
                  selected: selected.stream,
                  items: [
                    for (var activity in activities)
                      FortuneItem(child: Text('${activity['id']}'))
                  ],
                )),
                Text('Tap on the wheel to spin.'),
                SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ),
        ));
  }
}
