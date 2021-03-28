import 'package:demo_moor/moor_database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String tName;
  String newTName;
  final dao = TaskDao(AppDatabase());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Moor Demo'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                onChanged: (value) {
                  tName = value;
                },
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () async {
                  final task = Task(name: tName);
                  await dao.insertTask(task);
                  print('Added');
                },
                child: Text('Insert'),
              ),
              TextField(
                onChanged: (value) {
                  newTName = value;
                },
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () async {
                  final task = Task(id: 4, name: newTName, completed: true);
                  await dao.updateTask(task);
                  print('updated');
                },
                child: Text('Update'),
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () async {
                  var data = await dao.getAllTasks();
                  print(data);
                },
                child: Text('Show'),
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () async {
                  final task = Task(id: 4, name: 'nisarg', completed: true);
                  await dao.deleteTask(task);
                  print('deleted');
                },
                child: Text('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
