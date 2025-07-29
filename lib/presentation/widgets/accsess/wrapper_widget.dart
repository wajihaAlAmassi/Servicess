import 'package:flutter/material.dart';
import 'package:services_application/core/utils/user_utils.dart';

class ProviderOnly extends StatelessWidget {
  final Widget child;

  const ProviderOnly({required this.child});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isProvider(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return SizedBox(); // أو Loader

        if (snapshot.data == true) {
          return child;
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("This page for provider user")),
            );
          });
          return SizedBox();
        }
      },
    );
  }
}
