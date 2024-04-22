import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;
  final double width;
  final double height;
  final Color? backgroundColor;
  const CustomIconButton(
      {super.key,
      required this.iconData,
      this.onPressed,
      required this.width,
      required this.height,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02, vertical: 0),
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(iconData),
        style: IconButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.white),
      ),
    );
  }
}
