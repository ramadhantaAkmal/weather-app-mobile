import 'package:flutter/material.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Colors.blueGrey,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Text("7-Day Forecast"),
            Text("."),
            Text("."),
          ],
        ),
      ),
    );
  }
}
