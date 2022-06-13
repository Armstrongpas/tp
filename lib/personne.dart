//import 'dart:html';

import 'dart:convert';

import 'package:databas_ft/Home.dart';
import 'package:databas_ft/editdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Personne extends StatefulWidget {
  final list;
  final index;
  Personne({this.list, this.index});

  @override
  State<Personne> createState() => _PersonneState();
}

class _PersonneState extends State<Personne> {
  TextEditingController txtnombre1 = new TextEditingController();
  TextEditingController txtnombre2 = new TextEditingController();
  TextEditingController txtReponse = new TextEditingController();
  var url = "";

  Future<void> addData() async {
    url = "http://192.168.43.96/apk_bd/postdata.php";
    final reponse = await http.post(Uri.parse(url), body: {
      "nom": txtnombre1.text,
      "adresse": txtnombre2.text,
      "telephone": txtReponse.text
    });
  }

  Future<void> delete(int id) async {
    url = "http://192.168.43.96/apk_bd/delete.php";
    final reponse = await http.post(Uri.parse(url), body: {
      "id": id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IDENTIFICATION"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: 300,
          child: ListView(
            children: [
              new TextField(
                controller: txtnombre1,
                decoration: InputDecoration(
                  labelText: "nom",
                  hintText: "votre nom",
                ),
              ),
              new SizedBox(
                height: 20,
              ),
              new TextField(
                controller: txtnombre2,
                decoration: InputDecoration(
                  labelText: "adresse",
                  hintText: "votre adresse",
                ),
              ),
              new SizedBox(
                height: 20,
              ),
              new TextField(
                controller: txtReponse,
                decoration: InputDecoration(
                  labelText: "telephone",
                  hintText: "votre numero",
                ),
              ),
              new SizedBox(
                height: 20,
              ),
              new RaisedButton(
                onPressed: () {
                  addData();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()),
                  );
                },
                child: Text("Save"),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
