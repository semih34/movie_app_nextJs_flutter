import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/files/file_url.dart';

class Series extends StatefulWidget {
  const Series({super.key});

  @override
  State<Series> createState() => _SeriesState();
}

class _SeriesState extends State<Series> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(LottieUrl.tvSeries),
      ),
    );
  }
}
