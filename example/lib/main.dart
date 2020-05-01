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
        titleContainerWidget: customTitleText(),
        contentContainerWidget: customContentText(),
        customButtonOneWidget: customButtonOne(),
        customButtonTwoWidget: customButtonTwo(),
        showButtonOne: true,
        showButtonTwo: true,
        icon: Icons.settings,
        iconHexColor: "5E35B1",
        iconBackgroundHexColor: "EF5350",
        alignmentIcon: mainAlignment.center,
        haveAnimation: true,
        animationsType: mAnimations.slide,
        slideInTypes: SlideInTypes.SlideInBottom,
        animationMilliseconds: 500,
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
    SystemNavigator.pop();
//    Navigator.of(context).pop();
  }

  Widget customTitleText() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        "Custom title",
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  Widget customContentText() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        "Custom Content",
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  Widget customButtonOne() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(
        10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.yellow,
      ),
      child: FlatButton(
        onPressed: () {
          loadData();
          Navigator.of(context).pop(); // To close the dialog
        },
        child: Text(
          "button one",
        ),
      ),
    );
  }

  Widget customButtonTwo() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: FlatButton(
        color: Colors.red,
        onPressed: () {
          loadData();
          Navigator.of(context).pop(); // To close the dialog
        },
        child: Text(
          "button two",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

