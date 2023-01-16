import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: MaterialButton(
            onPressed: () {
              postPWID();
            },
            child: Container(
              width: 100,
              height: 40,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'get data',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  void postPWID() async {
    const url = 'http://192.168.220.134:8080/api/v1/account/login';

    var dio = Dio();

    final response = await dio.post(
      url,
      data: {
        "userID": "testUser01",
        "userPW": "pwd132456",
        "osType": "IOS",
        "deviceID": "2077ef9a63d2b398840261c8221a0c9b",
      },
      options: Options(
        headers: {
          // "Contents Type": "application/json",
          "Authorization": "4001d45f-b2c3-4139-ab08-1a4b8eb0ef50",
          "TraceId": "asdfsdrw1312314",
        },
      ),
    );
    print(response.data.runtimeType);
  }
}
