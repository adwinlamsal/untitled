import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/model.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Welcome> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: FutureBuilder(
                future: getdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext,index){

                        return Container(child: Text("${list[index].address.city}"),);
                      }),
                    );
                  }
                  return CircularProgressIndicator();
                }),
          ),
        ),
      ),
    );
  }

  // Future<List<Welcome>> getdata() async {
  //   final response =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //
  //   var data = jsonDecode(response.body.toString());
  //    list.clear();
  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> index in data) {
  //       list.add(Welcome.fromJson(index));
  //     }
  //     return list;
  //   }
  //   return list;
  // }














Future<List<Welcome>> getdata() async{
    
    final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());
    list.clear();

    if (response.statusCode==200) {

      for(Map<String,dynamic>map in data){

        list.add(Welcome.fromJson(map));

      }

      return list;



    }
    return list;
    
}














}
