import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.buttonHeight,
    required this.buttonWidth,
    this.color,
  });
  final String buttonText;
  final void Function()? onPressed;
  final num buttonWidth;
  final num buttonHeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * buttonWidth,
      height: MediaQuery.of(context).size.height * buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.amber,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        child: AutoSizeText(
          buttonText,
          maxLines: 1,
          style: const TextStyle(
              color: Colors.white, fontSize: 25.0, fontFamily: 'Kod'),
        ),
      ),
    );
  }
}
