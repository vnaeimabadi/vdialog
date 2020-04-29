# vDialog

A new Flutter package project for simple and semantic way to fill the content inside the dialog.

## 🎖 Installing

To use this package, add vDialog as a dependency in your pubspec.yaml file.

1. install

```
    dependencies:
      vdialog: ^0.2.2
```

2. import
   
```
    import 'package:vdialog/vdialog.dart';
```

## Dialog Parameters

```
CustomDialog({
    String title,
    Container titleContainerWidget,
    String content,
    Container contentContainerWidget,
    bool showButtonOne = true,
    Function buttonOne,
    String buttonOneText = "buttonOne",
    TextStyle buttonOneTextStyle,
    String buttonOneBackgroundHexColor = "00000000",
    double buttonOneMarginRight = 0,
    Container customButtonOneWidget,
    bool showButtonTwo = true,
    Function buttonTwo,
    String buttonTwoText = "buttonTwo",
    TextStyle buttonTwoTextStyle,
    String buttonTwoBackgroundHexColor = "00000000",
    double buttonTwoMarginRight = 0,
    Container customButtonTwoWidget,
    MainAxisAlignment buttonAlignment = MainAxisAlignment.end,
    bool showIcon = true,
    mainAlignment alignmentIcon = mainAlignment.right,
    double iconPositionTop = 20,
    double iconPositionLeft = 20,
    double iconPositionRight = 20,
    double iconBackgroundWidth = 80,
    double iconBackgroundHeight = 80,
    String iconBackgroundHexColor = "2979FF",
    IconData icon = Icons.lightbulb_outline,
    double iconSize = 50,
    String iconHexColor = "D32F2F",
  })
```

## Example .1

```
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
```

<img src="https://raw.githubusercontent.com/vnaeimabadi/vdialog/master/sample.PNG"/>


## Example .2

```
    showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext ctx) => CustomDialog(
              title: "Errorssusd",
              titleContainerWidget: customTitleText(),
              contentContainerWidget: customContentText(),
              buttonOne: this._buttonOne,
              buttonTwo: this._buttonTwo,
              buttonOneText: "retry",
              buttonTwoText: "close",
              content: "server not found!!",
              showButtonOne: true,
              showButtonTwo: true,
              icon: Icons.public,
              iconBackgroundHexColor: "EF5350",
            ),
          );


  Widget customTitleText()
  {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        "Custom title",
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: 24,),
      ),
    );
  }


  Widget customContentText()
  {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        "Custom Content",
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: 24,),
      ),
    );
  }
```

<img src="https://raw.githubusercontent.com/vnaeimabadi/vdialog/master/sample2.PNG"/>

## Example .3

```
    showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext ctx) => CustomDialog(
              title: "Errorssusd",
              titleContainerWidget: customTitleText(),
              contentContainerWidget: customContentText(),
              buttonOne: this._buttonOne,
              buttonTwo: this._buttonTwo,
              buttonOneText: "retry",
              buttonTwoText: "close",
              content: "server not found!!",
              showButtonOne: true,
              showButtonTwo: true,
              icon: Icons.public,
              iconBackgroundHexColor: "EF5350",
              buttonOneBackgroundHexColor: "EF5350",
              buttonOneTextStyle: TextStyle(color: Colors.white),
              buttonTwoBackgroundHexColor: "0daa0a",
              buttonTwoMarginRight: 10,
              buttonTwoTextStyle: TextStyle(color: Colors.yellow,fontSize: 20),
            ),
          );


  Widget customTitleText()
  {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        "Custom title",
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: 24,),
      ),
    );
  }


  Widget customContentText()
  {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        "Custom Content",
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: 24,),
      ),
    );
  }
```

<img src="https://raw.githubusercontent.com/vnaeimabadi/vdialog/master/sample3.PNG"/>

## Example .4

```
    showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext ctx) => Cdialog(
              titleContainerWidget: customTitleText(),
              contentContainerWidget: customContentText(),
              customButtonOneWidget: customButtonOne(),
              customButtonTwoWidget: customButtonTwo(),
              showButtonOne: true,
              showButtonTwo: false,
              icon: Icons.settings,
              iconHexColor: "5E35B1",
              iconBackgroundHexColor: "EF5350",
              alignmentIcon: mAlignment.center,
            ),
          );


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
```

<img src="https://raw.githubusercontent.com/vnaeimabadi/vdialog/master/sample4.PNG"/>


