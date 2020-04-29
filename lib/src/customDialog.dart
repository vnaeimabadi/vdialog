import 'package:flutter/material.dart';
import 'package:vdialog/src/hexColor.dart';


enum mainAlignment { left, right, center }


// ignore: must_be_immutable
class CustomDialog extends StatelessWidget {
  //  title and content
  String title;
  Text titleTextWidget;
  String content;
  Text contentTextWidget;

  //  button
  String buttonOneText;
  bool showButtonOne;
  Function buttonOne;
  TextStyle buttonOneTextStyle;
  String buttonOneBackgroundHexColor;
  double buttonOneMarginRight;

  String buttonTwoText;
  bool showButtonTwo;
  Function buttonTwo;
  TextStyle buttonTwoTextStyle;
  String buttonTwoBackgroundHexColor;
  double buttonTwoMarginRight;

  MainAxisAlignment buttonAlignment;



//  icon info
  bool showIcon;
  mainAlignment alignment;
  double iconPositionTop;
  double iconPositionLeft;
  double iconPositionRight;
  double iconBackgroundWidth;
  double iconBackgroundHeight;
  String iconBackgroundHexColor;
  IconData icon;
  double iconSize;
  String iconHexColor;

  CustomDialog({
    String title,
    Text titleTextWidget,
    String content,
    Text contentTextWidget,
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
  }) {
    this.title = title;
    this.titleTextWidget = titleTextWidget;
    this.content = content;
    this.contentTextWidget = contentTextWidget;

    this.buttonOne = buttonOne;
    this.buttonOneText = buttonOneText;
    this.showButtonOne = showButtonOne;
    this.buttonOneTextStyle = buttonOneTextStyle;
    this.buttonOneBackgroundHexColor = buttonOneBackgroundHexColor;
    this.buttonOneMarginRight = buttonOneMarginRight;

    this.buttonTwo = buttonTwo;
    this.buttonTwoText = buttonTwoText;
    this.showButtonTwo = showButtonTwo;
    this.buttonTwoTextStyle = buttonTwoTextStyle;
    this.buttonTwoBackgroundHexColor = buttonTwoBackgroundHexColor;
    this.buttonTwoMarginRight = buttonTwoMarginRight;

    this.buttonAlignment = buttonAlignment;

    this.showIcon = showIcon;
    this.alignment = alignmentIcon;
    this.iconPositionTop = iconPositionTop;
    this.iconPositionLeft = iconPositionLeft;
    this.iconPositionRight = iconPositionRight;
    this.iconBackgroundWidth = iconBackgroundWidth;
    this.iconBackgroundHeight = iconBackgroundHeight;
    this.iconBackgroundHexColor = iconBackgroundHexColor;
    this.icon = icon;
    this.iconSize = iconSize;
    this.iconHexColor = iconHexColor;
  }

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(padding)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        mainPart(context),
        circleIcon(context),
      ],
    );
  }

  Widget mainPart(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: this.iconSize / 2 > this.iconBackgroundHeight / 2
            ? this.iconSize / 1.5 + padding
            : this.iconBackgroundHeight / 1.5 + padding,
        bottom: padding,
        left: padding,
        right: padding,
      ),
      margin: EdgeInsets.only(top: avatarRadius),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(padding),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          titleAndContent(
            this.title,
            24.0,
            FontWeight.w700,
            this.titleTextWidget,
          ),
          SizedBox(height: 16.0),
          titleAndContent(
            this.content,
            16.0,
            null,
            this.contentTextWidget,
          ),
          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: this.buttonAlignment,
            children: <Widget>[
              this.showButtonTwo
                  ? customButton(
                context,
                this.buttonTwo,
                this.buttonTwoText,
                this.buttonTwoBackgroundHexColor,
                this.buttonTwoTextStyle,
                this.buttonTwoMarginRight,
              )
                  : Container(),
              this.showButtonOne
                  ? customButton(
                context,
                this.buttonOne,
                this.buttonOneText,
                this.buttonOneBackgroundHexColor,
                this.buttonOneTextStyle,
                this.buttonOneMarginRight,
              )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  Widget titleAndContent(
      String text, double fontSite, FontWeight fontWeight, Text textWidget) {
    return textWidget != null
        ? textWidget
        : Container(
      width: double.infinity,
      alignment: Alignment.topRight,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSite,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  Widget circleIcon(BuildContext context) {
    return Positioned(
      left: this.alignment == mainAlignment.center
          ? MediaQuery.of(context).size.width / 2 - this.iconBackgroundHeight
          : this.alignment == mainAlignment.left
          ? this.iconPositionLeft
          : this.alignment == mainAlignment.right ? null : null,
      right: this.alignment == mainAlignment.center
          ? null
          : this.alignment == mainAlignment.left
          ? null
          : this.alignment == mainAlignment.right
          ? this.iconPositionRight
          : null,
      top: this.iconPositionTop,
      width: this.iconBackgroundWidth,
      height: this.iconBackgroundHeight,
      child: CircleAvatar(
        backgroundColor: this.showIcon
            ? HexColor(this.iconBackgroundHexColor)
            : Colors.transparent,
        radius: avatarRadius,
        child: Icon(
          this.icon,
          size: 50,
          color: this.showIcon
              ? HexColor(this.iconHexColor)
              : Colors.transparent,
        ),
      ),
    );
  }

  Widget customButton(
      BuildContext context,
      Function function,
      String buttonText,
      String buttonBackgroundColor,
      TextStyle textStyle,
      double marginRight,
      ) {
    return Container(
      margin: EdgeInsets.only(right: marginRight),
      child: FlatButton(
        color: HexColor(buttonBackgroundColor),
        onPressed: () {
          function();
          Navigator.of(context).pop(); // To close the dialog
        },
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}