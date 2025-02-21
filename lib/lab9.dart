import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_web/geolocator_web.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String country = "";
  String temp= '';

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        country = "Dịch vụ vị trí không bật!";
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        setState(() {
          country = "Quyền vị trí bị từ chối vĩnh viễn!";
        });
        return;
      }
    }

    Position position = await GeolocatorPlatform.instance.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );

    final BASE_URL ='https://api.openweathermap.org/data/2.5/weather?'
        'lat=${position.latitude}&lon=${position.longitude}&appid=6386284878ca74d4b6f4bdf98d1f5ea3';
    final response = await http.get(Uri.parse(BASE_URL));
    if (response.statusCode == 200) {
      double temp_f = jsonDecode(response.body)['main']['temp'];
      setState(() {
        temp = ((temp_f-273.15)).toStringAsFixed(1)+' độ C';
        country = jsonDecode(response.body)['sys']['country'];
      });
    } else {
      print("Lỗi khi lấy địa chỉ IP");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/weather.png"), // Ảnh từ thư mục assets
            fit: BoxFit.cover, // Căn chỉnh ảnh phủ toàn bộ màn hình
          ),
        ),
        child: Row(
          children: [
            Flexible(child: Container(), flex: 2,),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Text(
                      'Country: $country',
                      style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 60)
                  ),
                  Text(
                      'Temp: $temp',
                      style: TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold, fontSize: 60)
                  ),
                  ElevatedButton(
                    onPressed: getCurrentLocation,
                    child: Text("Kiểm tra", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
