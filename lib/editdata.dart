import 'package:databas_ft/Home.dart';
import 'package:databas_ft/personne.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class editdata extends StatefulWidget {
  final list;
  final index;
  editdata({this.list, this.index});

  @override
  State<editdata> createState() => _editdataState();
}

class _editdataState extends State<editdata> {
  TextEditingController txtnombre1 = new TextEditingController();
  TextEditingController txtnombre2 = new TextEditingController();
  TextEditingController txtReponse = new TextEditingController();
  TextEditingController txtid = new TextEditingController();
  var url = "";

  Future<void> editdate() async {
    url = "http://192.168.43.96/apk_bd/updata.php";
    http.post(Uri.parse(url), body: {
      "id": int.parse(txtid.text),
      "nom": txtnombre1.text,
      "adresse": txtnombre2.text,
      "telephone": txtReponse.text
    });
  }

  void initState() {
    txtid = new TextEditingController(text: widget.list[widget.index]['id']);
    txtnombre1 =
        new TextEditingController(text: widget.list[widget.index]['nom']);
    txtnombre2 =
        new TextEditingController(text: widget.list[widget.index]['adresse']);
    txtReponse =
        new TextEditingController(text: widget.list[widget.index]['telephone']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 300,
          child: ListView(
            children: [
              new TextField(
                controller: txtid,
                decoration: InputDecoration(
                  labelText: "id",
                  hintText: "Identifiant",
                ),
              ),
              new SizedBox(
                height: 20,
              ),
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
                  editdate();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()),
                  );
                },
                child: Text("Edit"),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
