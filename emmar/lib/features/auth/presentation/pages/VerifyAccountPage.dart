import 'package:emmar/features/auth/presentation/widget/otp_input_widget.dart';
import 'package:emmar/features/auth/presentation/widget/resend_text_widget.dart';
import 'package:flutter/material.dart';


class VerifyAccountPage extends StatelessWidget {
  const VerifyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.arrow_forward_ios, size: 20),
              ),
              const SizedBox(height: 16),
              const LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Color(0xFFF2F2F2),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF8A00)),
              ),
              const SizedBox(height: 32),
              const Text(
                'إثبات ملكية الحساب',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'سوف تتلقى رمز التحقق الذي سيظهر في صندوق الوارد الخاص ببريدك الإلكتروني أو في قائمة البريد المزعج',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 32),
              const OTPInputWidget(),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  // call WhatsApp verification use case
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', width: 20),
                    const SizedBox(width: 8),
                    const Text(
                      'وثق عن طريق واتس اب',
                      style: TextStyle(
                        color: Color(0xFFFF00C965),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const ResendTextWidget(),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Call verify logic from BLoC
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF1E3A8A),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('تأكيد', style: TextStyle(fontSize: 16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
