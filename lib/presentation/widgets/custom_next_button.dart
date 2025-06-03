import 'package:flutter/material.dart';

class CustomNextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomNextButton({
    super.key,
    required this.onPressed,
   required this.text ,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF78DCB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
