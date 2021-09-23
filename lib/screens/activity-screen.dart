import 'package:flutter/material.dart';
import '../activities.dart';

class ActivityScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          for (var activity in activities)
            Column(
              children: [
                ListTile(
                  title: Text(
                    '${activity['name']}',
                    style: TextStyle(fontSize: 22),
                  ),
                  leading: Text(
                    '${activity['id']}',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Divider()
              ],
            )
        ],
      ),
    );
  }
}
