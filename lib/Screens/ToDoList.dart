import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../main.dart';

final databaseReference = FirebaseDatabase.instance.reference();

List<String> tdListKey = [];

List<String> tdListvalue = [];

Map<String, String> keywithvalue = Map.fromIterables(tdListKey, tdListvalue);

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  TextEditingController _c;
  @override
  void initState() {
    _c = new TextEditingController();
    getData();
    super.initState();
  }

  void updateData(String id, String desc) {
    databaseReference.child('todolist').update({id: desc});
  }

  void createRecord(String desc) {
    databaseReference.child("todolist").push().set(desc);
    //print('tapped - not caused errors.');
  }

  void deleteData(String id) {
    databaseReference.child("todolist").child(id).remove();
  }

  void getData() {
    databaseReference.child("todolist").once().then((DataSnapshot snapshot) {
      List<String> keys = [];
      List<String> values = [];
      String keypvalue = snapshot.value
          .toString()
          .substring(1, (snapshot.value.toString().length) - 1);

      List temp = keypvalue.split(",");
      List elems;
      String a1, a2;
      for (String element in temp) {
        element = element.trim();
        elems = element.split(":");
        a1 = elems[0].trim();
        a2 = elems[1].trim();
        keys.add(a1);
        values.add(a2);
      }
      //print(keys);
      //print(values);
      setState(() {
        tdListKey = keys;
        tdListvalue = values;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dictionary["todolistcard"].toString()),
      ),
      body: ReorderableListView(
        onReorder: onReorder,
        children: getListItems(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration:
                              InputDecoration(hintText: dictionary["entry"]),
                          controller: _c,
                        ),
                        TextButton(
                          child: Text(dictionary["savebutton"]),
                          onPressed: () {
                            setState(() {
                              if (_c.text == "") {
                                _c.clear();
                                return;
                              }
                              createRecord(_c.text);
                              _c.clear();
                              getData();
                            });

                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add)),
    );
  }

  List<ListTile> getListItems() => tdListvalue
      .asMap()
      .map((i, item) => MapEntry(i, buildtdListTile(item, i)))
      .values
      .toList();

  ListTile buildtdListTile(String item, int index) {
    return ListTile(
      key: ValueKey(item),
      title: InkWell(
        child: Text(item),
        onTap: () {
          showDialog(
              // ignore: deprecated_member_use
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration:
                            InputDecoration(hintText: tdListvalue[index]),
                        controller: _c,
                      ),
                      TextButton(
                        child: Text(dictionary["savebutton"]),
                        onPressed: () {
                          if (_c.text == "") {
                            Navigator.pop(context);
                            _c.clear();
                            return;
                          } else if (_c.text == tdListvalue[index]) {
                            Navigator.pop(context);
                            _c.clear();
                            return;
                          }
                          setState(() {
                            updateData(tdListKey[index], _c.text);
                            _c.clear();
                            getData();
                          });

                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                );
              });
        },
      ),
      leading: Text("#${index + 1}"),
      trailing: InkWell(
        onTap: () {
          setState(() {
            tdListvalue.removeAt(index);
            deleteData(tdListKey[index]);
          });
        },
        child: Icon(Icons.delete),
      ),
    );
  }

  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    setState(() {
      String listitem = tdListvalue[oldIndex];
      String listitem2 = tdListKey[oldIndex];
      tdListKey.removeAt(oldIndex);
      tdListKey.insert(newIndex, listitem2);
      tdListvalue.removeAt(oldIndex);
      tdListvalue.insert(newIndex, listitem);
    });
  }
}
