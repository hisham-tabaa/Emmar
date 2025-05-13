import 'package:emmar/core/utils/width-height/length.dart';
import 'package:emmar/features/auth/presentation/pages/VerifyAccountPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.3,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFF2E3A8C), // blue gradient background
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 118,
                  height: 150,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'انشاء حساب جديد',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'مرحبا بك في إعمار دليلك الذكي لكافة خدمات التجار والبيع والشراء.',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField(hint: 'الاسم الأول'),
                            ),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTextField(hint: 'النسبة')),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildPhoneField(context),
                        const SizedBox(height: 16),
                        _buildTextField(hint: 'البريد الالكتروني'),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF2E3A8C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                             VerifyAccountPage(), // Your OTP screen here
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'تأكيد',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: RichText(
                            text: const TextSpan(
                              text: 'لديك حساب سابق، ',
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: 'تسجيل الدخول',
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint}) {
    return TextFormField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.right,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 8.0 * getScreenWidthrate(context)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 4 * getScreenWidthrate(context)),
              Image.asset(
                'assets/images/flag.ico',
                width: 24 * getScreenWidthrate(context),
                height: 24,
              ),
              SizedBox(width: 4 * getScreenWidthrate(context)),
              const Text('+963'),
            ],
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'رقم الهاتف',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16 * getScreenWidthrate(context),
          vertical: 12 * getScreenHeightrate(context),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
