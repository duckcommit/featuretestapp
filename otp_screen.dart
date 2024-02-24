import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/routes/app.pages.dart';
import 'package:investment_app/shared/models/navigationType.enum.dart';
import 'package:investment_app/shared/services/navigation.service.dart';

class OTPVerificationPage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  TextEditingController otpController = TextEditingController();
  final navigator = Get.find<NavigationService>();

  void verifyOTP() {
    // Replace this with your actual OTP verification logic
    if (otpController.text == '1234') {
      // OTP is correct, navigate to the home screen
      navigator.navigateWithPath(
            path: AppPages.home, navigationType: NavigationType.off);
    } else {
      // Incorrect OTP, show a pop-up
      Get.snackbar(
        'Error',
        'Wrong OTP. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter OTP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildOTPField(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: verifyOTP,
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOTPField() {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          controller: otpController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 4,
          onChanged: (value) {
            // Handle OTP input
          },
        ),
      ),
    );
  }
}
