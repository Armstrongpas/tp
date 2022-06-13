import 'dart:convert';

import 'package:databas_ft/detail.dart';
import 'package:databas_ft/personne.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getdata() async {
    final reponse =
        await http.get(Uri.parse("http://192.168.43.96/apk_bd/getdata.php"));
    return json.decode(reponse.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LISTE DES PERSONNES"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Personne()))),
      body: FutureBuilder<List>(
          future: getdata(),
          builder: (ctx, ss) {
            if (ss.hasError) {
              print("error");
            }
            if (ss.hasData) {
              return Items(list: ss.requireData);
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

class Items extends StatelessWidget {
  List list;
  Items({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (ctx, i) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(list[i]["nom"]),
              subtitle: Text(list[i]["telephone"]),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Details(list: list, index: i))),
            ),
          );
        });
  }
}
