import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResendTextWidget extends StatelessWidget {
  const ResendTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'لم تستلم على الكود بعد؟ ',
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: 'إعادة الإرسال',
            style: const TextStyle(color: Color(0xFFFF8A00)),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
        
              },
          ),
        ],
      ),
    );
  }
}
