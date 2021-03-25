import 'package:flutter/material.dart';

import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4E5E),
    );
  }
}

class BottomButton extends StatelessWidget {
  
  BottomButton({@required this.buttonTitle, @required this.onTap});
  
  final String buttonTitle;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.all(10.0),
          height: kBottomContainerHeight,
          width: double.infinity,
          color: kBottomContainerColor,
          child: Center(
            child: Text(buttonTitle,
                style: kLargeButtonTextSyle),
          )),
    );
  }
}
