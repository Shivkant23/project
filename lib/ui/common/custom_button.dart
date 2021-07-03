import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isSelected;
  final Function onClicked;
  final String buttonText;
  final bool isNoRadius;
  final double height;
  final IconData leadingIcon;
  final EdgeInsetsGeometry padding;

  CustomButton(
      {@required this.buttonText,
      this.isSelected = true,
      this.onClicked,
      this.isNoRadius = false,
      this.height = 45.0,
      this.leadingIcon,
      this.padding = const EdgeInsets.symmetric(horizontal: 16)});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(isNoRadius ? 0 : 6))),
          color: isSelected ? Theme.of(context).accentColor : Colors.white,
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leadingIcon != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Icon(leadingIcon),
                    )
                  : Container(),
              Text(
                buttonText,
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 16),
              ),
            ],
          ),
          onPressed: onClicked),
    );
  }
}

class CustomSegmentedButton extends StatelessWidget {
  final bool isSelected;
  final Function onClicked;
  final String buttonText;
  final bool isNoRadius;
  final double height;
  final double width;
  final IconData leadingIcon;
  final EdgeInsetsGeometry padding;

  CustomSegmentedButton(
      {@required this.buttonText,
      this.isSelected = true,
      this.onClicked,
      this.isNoRadius = false,
      this.height = 45.0,
      this.width,
      this.leadingIcon,
      this.padding = const EdgeInsets.symmetric(horizontal: 10)});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  width: 1,
                  style: BorderStyle.solid),
              borderRadius:
                  BorderRadius.all(Radius.circular(isNoRadius ? 0 : 6))),
          color: Colors.white,
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              leadingIcon != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(
                        leadingIcon,
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                    )
                  : Container(),
              Text(
                buttonText,
                style: TextStyle(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                    fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 2,
              )
            ],
          ),
          onPressed: onClicked),
    );
  }
}

class CustomRoundedButton extends StatelessWidget {
  final bool isSelected;
  final Function onClicked;
  final String buttonText;
  final bool isNoRadius;
  final double height;
  CustomRoundedButton(
      {@required this.buttonText,
      this.isSelected = true,
      this.onClicked,
      this.isNoRadius = false,
      this.height = 32.0});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)),
          color: isSelected ? Colors.green : Colors.grey.shade200,
          child: Text(
            buttonText,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
          padding: EdgeInsets.symmetric(horizontal: 0),
          onPressed: onClicked),
    );
  }
}

class CustomNewButton extends StatelessWidget {
  final bool isSelected;
  final Function onClicked;
  final String buttonText;
  final bool isNoRadius;
  final double height;
  CustomNewButton(
      {@required this.buttonText,
      this.isSelected = true,
      this.onClicked,
      this.isNoRadius = false,
      this.height = 32.0});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)),
          color: isSelected ? Colors.green : Colors.grey.shade200,
          child: Text(
            buttonText,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
          padding: EdgeInsets.symmetric(horizontal: 0),
          onPressed: onClicked),
    );
  }
}
