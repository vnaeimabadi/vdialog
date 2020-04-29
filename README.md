# vDialog

A new Flutter package project for simple and semantic way to fill the content inside the dialog.

## 🎖 Installing

To use this package, add vDialog as a dependency in your pubspec.yaml file.

1. install

```
    dependencies:
      vdialog: ^0.2.1+3
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
    bool showButtonTwo = true,
    Function buttonTwo,
    String buttonTwoText = "buttonTwo",
    TextStyle buttonTwoTextStyle,
    String buttonTwoBackgroundHexColor = "00000000",
    double buttonTwoMarginRight = 0,
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


