import 'package:databas_ft/Home.dart';
import 'package:databas_ft/editdata.dart';
import 'package:databas_ft/personne.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  List list;
  int index;
  Details({required this.list, required this.index});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void delete() {
    var url = "http://192.168.43.96/apk_bd/delete.php";
    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UNE PERSONNE"),
        backgroundColor: Colors.blue,
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: [
            new Text(
              "INFORMATIONS PERSONNELLES",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "times new roman",
              ),
            ),
            new SizedBox(
              height: 30,
            ),
            new Text(
              "Nom : " + widget.list[widget.index]['nom'] + "",
              style: TextStyle(fontSize: 20, fontFamily: "times new roman"),
            ),
            new SizedBox(
              height: 10,
            ),
            new Text(
              "Adresse : " + widget.list[widget.index]['adresse'] + "",
              style: TextStyle(fontSize: 20, fontFamily: "times new roman"),
            ),
            new SizedBox(
              height: 10,
            ),
            new Text(
              "Telephone : " + widget.list[widget.index]['telephone'] + "",
              style: TextStyle(fontSize: 20, fontFamily: "times new roman"),
            ),
            new SizedBox(
              height: 10,
            ),
            new Row(
              children: [
                new RaisedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => editdata(
                            list: widget.list,
                            index: widget.index,
                          ))),
                  child: Text("Edit"),
                  color: Colors.blue,
                ),
                new SizedBox(
                  width: 20,
                ),
                new RaisedButton(
                  onPressed: () {
                    delete();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Home()),
                    );
                  },
                  child: Text("Delete"),
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
