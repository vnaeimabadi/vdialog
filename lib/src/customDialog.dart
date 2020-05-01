import 'package:flutter/material.dart';
import 'package:vdialog/src/hexColor.dart';

enum mainAlignment { left, right, center }
enum mAnimations { scale, fade, slide }
enum SlideInTypes {
  SlideInRight,
  SlideInLeft,
  SlideInTop,
  SlideInBottom,
  SlideInBottomRight,
  SlideInTopLeft,
}
enum SlideOutTypes {
  SlideOutRight,
  SlideOutLeft,
  SlideOutTop,
  SlideOutBottom,
  SlideOutBottomRight,
  SlideOutTopLeft,
}
// ignore: must_be_immutable
class CustomDialog extends StatefulWidget {
  //  title and content
  String title;
  Container titleTextWidget;
  String content;
  Container contentTextWidget;

  //  button
  String buttonOneText;
  bool showButtonOne;
  Function buttonOne;
  TextStyle buttonOneTextStyle;
  String buttonOneBackgroundHexColor;
  double buttonOneMarginRight;
  Container customButtonOneWidget;

  String buttonTwoText;
  bool showButtonTwo;
  Function buttonTwo;
  TextStyle buttonTwoTextStyle;
  String buttonTwoBackgroundHexColor;
  double buttonTwoMarginRight;
  Container customButtonTwoWidget;

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

  mAnimations animationsType;
  bool haveAnimation;
  Curve curveAnimationType;
  int animationMilliseconds;

  SlideInTypes slideInTypes;
  SlideOutTypes slideOutTypes;
  Offset startOffset;
  Offset endOffset;

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
    mAnimations animationsType,
    bool haveAnimation = false,
    Curve curveAnimationType = Curves.easeIn,
    int animationMilliseconds = 450,
    SlideInTypes slideInTypes,
    SlideOutTypes slideOutTypes,
  }) {
    this.title = title;
    this.titleTextWidget = titleContainerWidget;
    this.content = content;
    this.contentTextWidget = contentContainerWidget;

    this.buttonOne = buttonOne;
    this.buttonOneText = buttonOneText;
    this.showButtonOne = showButtonOne;
    this.buttonOneTextStyle = buttonOneTextStyle;
    this.buttonOneBackgroundHexColor = buttonOneBackgroundHexColor;
    this.buttonOneMarginRight = buttonOneMarginRight;
    this.customButtonOneWidget = customButtonOneWidget;

    this.buttonTwo = buttonTwo;
    this.buttonTwoText = buttonTwoText;
    this.showButtonTwo = showButtonTwo;
    this.buttonTwoTextStyle = buttonTwoTextStyle;
    this.buttonTwoBackgroundHexColor = buttonTwoBackgroundHexColor;
    this.buttonTwoMarginRight = buttonTwoMarginRight;
    this.customButtonTwoWidget = customButtonTwoWidget;

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

    this.animationsType = animationsType;
    this.haveAnimation = haveAnimation;
    this.curveAnimationType = curveAnimationType;
    this.animationMilliseconds = animationMilliseconds;

    this.slideInTypes = slideInTypes;
    this.slideOutTypes = slideOutTypes;
  }

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> customAnimation;
  Animation<Offset> offset;
  var scaleAnimation;

  void setoffsets() {
//    Offset(-1.0, 0.0), end: Offset.zero
    if (this.widget.slideOutTypes != null) {
      switch (this.widget.slideOutTypes) {
        case SlideOutTypes.SlideOutBottom:
          {
            this.widget.startOffset = Offset.zero;
            this.widget.endOffset = Offset(0.0, 1.0);
          }
          break;
        case SlideOutTypes.SlideOutTop:
          {
            this.widget.startOffset = Offset.zero;
            this.widget.endOffset = Offset(0.0, -1.0);
          }
          break;

        case SlideOutTypes.SlideOutRight:
          {
            this.widget.startOffset = Offset.zero;
            this.widget.endOffset = Offset(1.0, 0.0);
          }
          break;
        case SlideOutTypes.SlideOutLeft:
          {
            this.widget.startOffset = Offset.zero;
            this.widget.endOffset = Offset(-1.0, 0.0);
          }
          break;

        case SlideOutTypes.SlideOutBottomRight:
          {
            this.widget.startOffset = Offset.zero;
            this.widget.endOffset = Offset(1.0, 1.0);
          }
          break;
        case SlideOutTypes.SlideOutTopLeft:
          {
            this.widget.startOffset = Offset.zero;
            this.widget.endOffset = Offset(-1.0, -1.0);
          }
          break;
      }
    }
    if (this.widget.slideInTypes != null) {
      switch (this.widget.slideInTypes) {
        case SlideInTypes.SlideInBottom:
          {
            this.widget.startOffset = Offset(0.0, 1.0);
            this.widget.endOffset =  Offset.zero;
          }
          break;
        case SlideInTypes.SlideInTop:
          {
            this.widget.startOffset =Offset(0.0, -1.0);
            this.widget.endOffset =  Offset.zero;
          }
          break;

        case SlideInTypes.SlideInRight:
          {
            this.widget.startOffset = Offset(1.0, 0.0);
            this.widget.endOffset = Offset.zero;
          }
          break;
        case SlideInTypes.SlideInLeft:
          {
            this.widget.startOffset =  Offset(-1.0, 0.0);
            this.widget.endOffset =Offset.zero;
          }
          break;

        case SlideInTypes.SlideInBottomRight:
          {
            this.widget.startOffset = Offset(1.0, 1.0);
            this.widget.endOffset = Offset.zero;
          }
          break;
        case SlideInTypes.SlideInTopLeft:
          {
            this.widget.startOffset = Offset(-1.0, -1.0);
            this.widget.endOffset = Offset.zero;
          }
          break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setoffsets();
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: this.widget.animationMilliseconds));
    customAnimation = CurvedAnimation(
        parent: controller, curve: this.widget.curveAnimationType);
    if(this.widget.animationsType==mAnimations.slide)
    {
      if(this.widget.slideOutTypes==null && this.widget.slideInTypes==null)
      {
        this.widget.animationsType=mAnimations.scale;
      }
      else{
        offset = Tween<Offset>(
            begin: this.widget.startOffset, end: this.widget.endOffset)
            .animate(controller);
      }
    }


    scaleAnimation = new Tween(
      begin: 0.5,
      end: 1.0,
    ).animate(customAnimation);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return this.widget.haveAnimation
        ? mAnimations.scale == this.widget.animationsType
        ? ScaleTransition(
      scale: scaleAnimation,
      child: mainDialog(),
    )
        : mAnimations.fade == this.widget.animationsType
        ? FadeTransition(
      opacity: customAnimation,
      child: mainDialog(),
    )
        : mAnimations.slide == this.widget.animationsType
        ? SlideTransition(
      position: offset,
      child: mainDialog(),
    )
        : mainDialog()
        : mainDialog();
  }

  Widget mainDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomDialog.padding)),
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
        top: this.widget.iconSize / 2 > this.widget.iconBackgroundHeight / 2
            ? this.widget.iconSize / 1.5 + CustomDialog.padding
            : this.widget.iconBackgroundHeight / 1.5 + CustomDialog.padding,
        bottom: CustomDialog.padding,
        left: CustomDialog.padding,
        right: CustomDialog.padding,
      ),
      margin: EdgeInsets.only(top: CustomDialog.avatarRadius),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(CustomDialog.padding),
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
            this.widget.title,
            24.0,
            FontWeight.w700,
            this.widget.titleTextWidget,
          ),
          SizedBox(height: 16.0),
          titleAndContent(
            this.widget.content,
            16.0,
            null,
            this.widget.contentTextWidget,
          ),
          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: this.widget.buttonAlignment,
            children: <Widget>[
              this.widget.showButtonTwo
                  ? this.widget.customButtonTwoWidget == null
                  ? customButton(
                context,
                this.widget.buttonTwo,
                this.widget.buttonTwoText,
                this.widget.buttonTwoBackgroundHexColor,
                this.widget.buttonTwoTextStyle,
                this.widget.buttonTwoMarginRight,
              )
                  : this.widget.customButtonTwoWidget
                  : Container(),
              this.widget.showButtonOne
                  ? this.widget.customButtonOneWidget == null
                  ? customButton(
                context,
                this.widget.buttonOne,
                this.widget.buttonOneText,
                this.widget.buttonOneBackgroundHexColor,
                this.widget.buttonOneTextStyle,
                this.widget.buttonOneMarginRight,
              )
                  : this.widget.customButtonOneWidget
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  Widget titleAndContent(String text, double fontSite, FontWeight fontWeight,
      Container textWidget) {
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
      left: this.widget.alignment == mainAlignment.center
          ? MediaQuery.of(context).size.width / 2 -
          this.widget.iconBackgroundHeight
          : this.widget.alignment == mainAlignment.left
          ? this.widget.iconPositionLeft
          : this.widget.alignment == mainAlignment.right ? null : null,
      right: this.widget.alignment == mainAlignment.center
          ? null
          : this.widget.alignment == mainAlignment.left
          ? null
          : this.widget.alignment == mainAlignment.right
          ? this.widget.iconPositionRight
          : null,
      top: this.widget.iconPositionTop,
      width: this.widget.iconBackgroundWidth,
      height: this.widget.iconBackgroundHeight,
      child: CircleAvatar(
        backgroundColor: this.widget.showIcon
            ? HexColor(this.widget.iconBackgroundHexColor)
            : Colors.transparent,
        radius: CustomDialog.avatarRadius,
        child: Icon(
          this.widget.icon,
          size: 50,
          color: this.widget.showIcon
              ? HexColor(this.widget.iconHexColor)
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

