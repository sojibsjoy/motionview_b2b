import 'package:flutter/material.dart';

class ConRichTxt extends StatelessWidget {
  final String prefixTxt;
  final String suffixTxt;
  const ConRichTxt({
    Key? key,
    required this.prefixTxt,
    required this.suffixTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: prefixTxt,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: suffixTxt,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
