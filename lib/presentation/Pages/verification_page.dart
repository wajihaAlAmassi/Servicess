import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../widgets/custom_next_button.dart';
import '../widgets/otp_input.dart';


class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _submitCode() {
    final otpCode = _controllers.map((c) => c.text).join();
    print('Entered OTP: $otpCode');
    // TODO: Implement backend verification here
  }

  void _resendCode() {
    // TODO: Trigger resend logic
    print('Code resent');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.darkText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFF78DCB),
              child: Icon(Icons.person, size: 48, color: Colors.white),
            ),
            const SizedBox(height: 24),
            const Text(
              'Verify it’s you',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.darkText,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'We send a code to ( *****@mail.com ). Enter it here to verify your identity',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.lightText,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => OtpInputField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 5) {
                      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _resendCode,
              child: const Text(
                'Resend Code',
                style: TextStyle(color: AppColors.yellowAccent),
              ),
            ),
            const SizedBox(height: 24),
            CustomNextButton(
              text: 'Confirm',
              onPressed: _submitCode,
            )
          ],
        ),
      ),
    );
  }
}
