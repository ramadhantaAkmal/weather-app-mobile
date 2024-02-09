import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:weather_app/features/homescreen/data/remote/weather_service.dart';

import '../../model/search_model.dart';
import '../../viewmodel/homescreen_bloc.dart';
import '../../viewmodel/homescreen_event.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchController = TextEditingController();
  WeatherService weatherService = WeatherService();
  List<SearchModel> searchResult = [];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // searchController.addListener(() {});
  }

  Future<List<SearchModel>> _searchCity() async {
    return await weatherService.searchCity(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFieldSearch(
        controller: searchController,
        future: _searchCity,
        decoration: const InputDecoration(
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search_rounded),
          hintText: "Enter location",
          hintStyle: TextStyle(
              fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
        ),
        getSelectedValue: (value) {
          SearchModel query = value as SearchModel;
          BlocProvider.of<HomescreenBloc>(context).add(const Dispose());
          BlocProvider.of<HomescreenBloc>(context)
              .add(GetWeatherForecast(query.lat!, query.lon!));
        },
        label: '',
      ),
    ));
  }
}
