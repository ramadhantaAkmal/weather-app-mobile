import 'package:flutter/material.dart';
import 'package:weather_app/features/homescreen/data/remote/weather_service.dart';
import 'package:weather_app/features/homescreen/view/widgets/forecast.dart';
import 'package:weather_app/features/homescreen/view/widgets/forecast_shimmer.dart';
import 'package:weather_app/features/homescreen/view/widgets/search_text_field.dart';
import 'package:weather_app/features/homescreen/view/widgets/weather_card.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/homescreen/view/widgets/weather_card_shimmer.dart';
import 'package:weather_app/features/homescreen/viewmodel/homescreen_bloc.dart';
import 'package:weather_app/features/homescreen/viewmodel/homescreen_event.dart';

import '../viewmodel/homescreen_state.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  WeatherService weatherService = WeatherService();

  @override
  void initState() {
    _getWeatherForecast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
      floatingActionButton: _buildFAB(),
    );
  }

  void _getWeatherForecast() {
    BlocProvider.of<HomescreenBloc>(context).add(const Dispose());
    _determinePosition().then((pos) {
      BlocProvider.of<HomescreenBloc>(context)
          .add(GetWeatherForecast(pos.latitude, pos.longitude));
    });
  }

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        _getWeatherForecast();
      },
      mini: true,
      child: const Icon(Icons.gps_fixed_rounded),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: RefreshIndicator(
        onRefresh: () async {
          _getWeatherForecast();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //search text field
            const SearchTextField(),

            //body
            Expanded(
              flex: 8,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: BlocBuilder<HomescreenBloc, HomescreenState>(
                  builder: (context, state) {
                    if (state is HomescreenLoad) {
                      return const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //weather card
                          WeatherCardShimmer(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "7-Day Forecast",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ),
                          ForecastShimmer(),
                        ],
                      );
                    }

                    if (state is HomescreenError) {
                      return const Column(
                        children: [
                          //weather card
                          Center(
                            child: Icon(Icons.warning),
                          ),

                          //weather forecast
                          Center(
                            child: Icon(Icons.warning),
                          ),
                        ],
                      );
                    }

                    if (state is HomescreenSuccess) {
                      return Column(
                        children: [
                          //weather card
                          WeatherCard(weather: state.weather!),

                          //weather forecast
                          ForecastWidget(forecast: state.forecast!),
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
