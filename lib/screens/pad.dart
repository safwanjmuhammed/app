import 'package:app/model/homwifi_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiDemo extends StatefulWidget {
  const ApiDemo({super.key});

  @override
  State<ApiDemo> createState() => _ApiDemoState();
}

class _ApiDemoState extends State<ApiDemo> {
  List<HomeWifi> rawData = [];
  //Apicall
  Future<List<HomeWifi>> apiCall() async {
    final dio = Dio();
    final response =
        await dio.get('https://api.opensensemap.org/boxes?model=homeWifi');
    print(response.data);
    List<HomeWifi> returningList = [];
    for (var element in response.data) {
      returningList.add(HomeWifi.fromJson(element));
    }
    if (response.statusCode == 200) {
      return returningList;
    } else {
      throw Exception('FAILED');
    }
  }

  @override
  void initState() {
    super.initState();
    apiCall().then((value) {
      setState(() {
        rawData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text(rawData[index].name),
            );
          }))
        ],
      ),
    );
  }
}
