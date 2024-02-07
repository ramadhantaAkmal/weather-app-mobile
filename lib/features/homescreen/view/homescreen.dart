import 'package:flutter/material.dart';
import 'package:weather_app/features/homescreen/view/widgets/search_text_field.dart';
import 'package:weather_app/features/homescreen/view/widgets/weather_card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //search text field
            const SearchTextField(),

            //body
            Expanded(
              flex: 7,
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.red,
                child: Column(
                  children: [
                    //weather card
                    const WeatherCard(),

                    //weather forecast
                    Flexible(
                        child: Container(
                      color: Colors.blueGrey,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Text("7-Day Forecast"),
                          Text("."),
                          Text("."),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
