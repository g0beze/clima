import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://samples.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=b6907d289e10d714a6e88b30761fae22'),
    );
    String? data;
    (response.statusCode == 200)
        ? (data = response.body)
        : print(response.statusCode);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
