import 'package:flutter/material.dart';

import '../main.dart';

class Settings extends StatefulWidget {
  Settings({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(dictionary["settingstitle"]),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 0,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              color: Theme.of(context).primaryColor,
              child: ListTile(
                title: Text(dictionary["themecard"],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                leading: Icon(Icons.color_lens),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 4,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Column(
                children: [
                  Container(
                    color: light ? Theme.of(context).accentColor : null,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          light = true;
                          AppBuilder.of(context).rebuild();
                        });
                      },
                      title: Text(dictionary["lightcard"],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      leading: Icon(Icons.color_lens),
                    ),
                  ),
                  Container(
                    color: !light ? Theme.of(context).accentColor : null,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          light = false;
                          AppBuilder.of(context).rebuild();
                        });
                      },
                      title: Text(dictionary["darkcard"],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      leading: Icon(Icons.color_lens),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 0,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              color: Theme.of(context).primaryColor,
              child: ListTile(
                title: Text(dictionary["langcard"],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                leading: Icon(Icons.language),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 4,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Column(
                children: [
                  Container(
                      color: chosenLanguage == 'tr'
                          ? Theme.of(context).accentColor
                          : null,
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            chosenLanguage = "tr";
                            AppBuilder.of(context).changeDictionary("tr");
                            AppBuilder.of(context).rebuild();
                          });
                        },
                        title: Text(dictionary["trcard"],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        leading: Icon(
                          Icons.language,
                        ),
                      )),
                  Container(
                    color: chosenLanguage == 'en'
                        ? Theme.of(context).accentColor
                        : null,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          chosenLanguage = "en";
                          AppBuilder.of(context).changeDictionary("en");
                          AppBuilder.of(context).rebuild();
                        });
                      },
                      title: Text(dictionary["encard"],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      leading: Icon(Icons.language),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
