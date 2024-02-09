import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherCardShimmer extends StatelessWidget {
  const WeatherCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      child: Shimmer.fromColors(
        baseColor: const Color(0XFF87888A),
        highlightColor: const Color(0XFFB9C0C5),
        child: const Card(),
      ),
    );
  }
}
