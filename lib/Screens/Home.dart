import 'package:flutter/material.dart';
import "../main.dart";

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Settings',
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 4,
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                color: Theme.of(context).primaryColor,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/calculator');
                  },
                  title: Text(dictionary["calculatorcard"],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                  leading: Icon(Icons.calculate),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 4,
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                color: Theme.of(context).primaryColor,
                child: ListTile(
                  onTap: () {},
                  title: Text(dictionary["idkcard"],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                  leading: Icon(Icons.repeat),
                ),
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 4,
                  margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  color: Theme.of(context).primaryColor,
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/todolist');
                    },
                    title: Text(dictionary["todolistcard"],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                    leading: Icon(Icons.stop),
                  )),
            ],
          ),
        ));
  }
}
