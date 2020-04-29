import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vdialog/vdialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: RaisedButton(
            child: Text("show dialog"),
            onPressed: showVDialog,
          ),
        ),
      ),
    );
  }

  void showVDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext ctx) => CustomDialog(
        title: "Error",
        buttonOne: this._buttonOne,
        buttonTwo: this._buttonTwo,
        buttonOneText: "retry",
        buttonTwoText: "close",
        content: "server not found!!",
        showButtonOne: true,
        showButtonTwo: true,
      ),
    );
  }

  void loadData() {
    //this is data function!
  }

  void _buttonOne() {
    loadData();
  }

  void _buttonTwo() {
    //this will close app
    SystemNavigator.pop();
  }
}

