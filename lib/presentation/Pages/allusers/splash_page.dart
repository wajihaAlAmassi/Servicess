import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:async';

import '../../../core/utils/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:3), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // خلفية الصورة
          Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.cover,
          ),

          // تغطية وردية شفافة
          Container(
            color:
             AppColors.primaryPink,
          ),

          // الشعار والتحميل
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // مربع الشعار
              SizedBox(
                  width: 145,
                  height: 80,
                  child: Stack(
                    children: [
                      // الشريط البرتقالي
                      Positioned(
                        top: 25,
                        right: 8,
                        child: Container(
                          width: 40,
                          height: 6,
                          color: AppColors.yellowAccent,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'MY',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              'SERVICES',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),

              const SizedBox(height: 30),
              const CircularProgressIndicator(
                color: AppColors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
