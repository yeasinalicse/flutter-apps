import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'MapPage.dart';
import 'NetworkInfo.dart';
import 'package:http/http.dart' as http;

import 'WebViewPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Network Info'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 NetworkInfo? networkInfo;
String? ip = "";
String? isp = "";
String? location = "";
  void getNetworkInfo() async {
    final response = await http.get(Uri.parse('https://ifconfig.co/json'));
    if (response.statusCode == 200) {
      networkInfo = NetworkInfo.fromJson(jsonDecode(response.body));
      setState(() {
        ip = networkInfo?.ip;
        isp = networkInfo?.asnOrg;
        location = "${networkInfo?.regionName},${networkInfo?.country}";
      });
    }
    throw Exception('Failed to load info');
  }
  @override
  void initState()  {
    super.initState();
    getNetworkInfo();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Text(
                "Current Ip",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "$ip",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "ISP",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "$isp",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "$location",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage(networkInfo: networkInfo,)),
                  );
                },
                icon: Icon(
                  // <-- Icon
                  Icons.share_location_outlined,
                  size: 24.0,
                ),
                label: Text('Show on Map'), // <-- Text
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
