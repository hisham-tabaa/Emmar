import 'package:flutter/material.dart';
import 'package:emmar/core/utils/width-height/length.dart';
//import 'package:emmar/core/constants/constants.dart';
class FirstScreen extends StatelessWidget {

  static const _gradientColors = [Color(0xFF444F80), Color(0xFF1E2566)];
  static const _buttonHorizontalPadding = 129.0;
  static const _buttonHorizontalPadding2 = 122.0;
  static const _buttonVerticalPadding = 18.0;
  static const _logoHeight = 150.0;
  static const _logoWidth = 118.0;
  static const _topSpacing = 300.0;
  static const _middleSpacing = 160.0;
  static const _buttonSpacing = 20.0;
  static const _buttonRadius = 30.0;
  static const _buttonFontSize = 16.0;

  const FirstScreen({super.key});

  TextStyle _getButtonTextStyle(BuildContext context) => TextStyle(
        fontFamily: 'LamaSans',
        fontSize: _buttonFontSize * getScreenFonttrate(context),
        fontWeight: FontWeight.normal,
        color: Colors.white,
      );

  Future<void> _navigateTo(BuildContext context, String route) async {
    try {
      await Navigator.pushNamed(context, route);
    } catch (e) {
      debugPrint('Navigation error: $e');
// errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _gradientColors,
          end: Alignment.bottomRight,
        ),
      ), 
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: _topSpacing * getScreenHeightrate(context)),
              
             
              Image.asset(
                'assets/images/logo.png',
                height: _logoHeight * getScreenHeightrate(context),
                width: _logoWidth * getScreenWidthrate(context),
              ),
              
              SizedBox(height: _middleSpacing * getScreenHeightrate(context)),


              SizedBox(width: 327 * getScreenWidthrate(context),height: 48 *getScreenHeightrate(context),
                child: ElevatedButton(
                  onPressed: () => _navigateTo(context, '/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8F49),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_buttonRadius),
                    ),
                  ),
                  child: Text(
                    'تسجيل الدخول',
                    style: _getButtonTextStyle(context),

                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              
              SizedBox(height: _buttonSpacing * getScreenHeightrate(context)),


              SizedBox(width: 327 * getScreenWidthrate(context),height: 48 *getScreenHeightrate(context),
                child: ElevatedButton(
                  onPressed: () => _navigateTo(context, '/register'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(52, 143, 73, 26),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_buttonRadius),
                    ),
                  ),
                  child: Text(
                    'انشاء حساب جديد',
                    style: _getButtonTextStyle(context),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}