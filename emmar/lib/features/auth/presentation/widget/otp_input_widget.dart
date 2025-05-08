import 'package:flutter/material.dart';

class OTPInputWidget extends StatelessWidget {
  const OTPInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return Container(
          width: 50,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              '_',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      }),
    );
  }
}
