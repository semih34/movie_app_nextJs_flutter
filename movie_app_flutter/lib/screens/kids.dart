import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/files/file_url.dart';

class Kids extends StatefulWidget {
  const Kids({super.key});

  @override
  State<Kids> createState() => _KidsState();
}

class _KidsState extends State<Kids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(LottieUrl.kids),
      ),
    );
  }
}
