import 'package:flutter/material.dart';

import 'Screens/Home.dart';
import 'Screens/Settings.dart';
import 'Screens/ToDoList.dart';

List<String> hkey = [
  "hometitle",
  "calculatorcard",
  "todolistcard",
  "settingstooltip",
  "settingstitle",
  "themecard",
  "lightcard",
  "darkcard",
  "langcard",
  "trcard",
  "encard",
  "calculatortitle",
  "todolisttitle",
  "idkcard",
  "savebutton",
  "entry"
];
List<String> value = [
  "Araç Çantası",
  "Boş tuş",
  "Yapılacaklar Listesi",
  "Ayarlar",
  "Ayarlar",
  "Tema",
  "Aydınlık Mod",
  "Karanlık Mod",
  "Dil",
  "Türkçe",
  "Ingilizce",
  "Boş Sayfa",
  "Yapılacaklar Listesi",
  "idk",
  "kaydet",
  "giriş yap"
];

Map<String, String> dictionary = Map.fromIterables(hkey, value);

String chosenLanguage = "tr";
bool light = true;

//tema kaynak https://youtu.be/aFei1SwczS4
//firebase kaynak https://medium.com/47billion/how-to-use-firebase-with-flutter-e4a47a7470ce
//pop up dialog kaynak https://medium.com/@dltruong.c/how-to-pop-up-flutter-dialog-on-any-screen-d82ccaac48af
//listenin reorderable olayı kaynak https://medium.com/@adp4infotech4/flutter-building-a-reorderable-listview-735013719cf3

void main() {
  runApp(MyApp());
}

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  cardColor: Colors.blue[100],
  accentColor: Colors.blue[300],
);

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  cardColor: Colors.grey[700],
  accentColor: Colors.black,
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AppBuilder(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: light ? _lightTheme : _darkTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(title: dictionary["hometitle"].toString()),
          '/settings': (context) => Settings(),
          '/todolist': (context) => ToDoList(),
        },
      );
    });
  }
}

class AppBuilder extends StatefulWidget {
  final Function(BuildContext) builder;

  const AppBuilder({Key key, this.builder}) : super(key: key);

  @override
  AppBuilderState createState() => new AppBuilderState();

  static AppBuilderState of(BuildContext context) {
    return context.findAncestorStateOfType();
  }
}

//findancestorstateoftype
class AppBuilderState extends State<AppBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild() {
    setState(() {});
  }

  void changeDictionary(String chosen) {
    if (chosen == 'tr') {
      setState(() {
        List<String> value = [
          "Araç Çantası",
          "Boş tuş",
          "Yapılacaklar Listesi",
          "Ayarlar",
          "Ayarlar",
          "Tema",
          "Aydınlık Mod",
          "Karanlık Mod",
          "Dil",
          "Türkçe",
          "Ingilizce",
          "Empty",
          "Boş Sayfa",
          "idk",
          "kaydet",
          "giriş yap"
        ];
        dictionary = Map.fromIterables(hkey, value);
      });
    } else {
      setState(() {
        List<String> value = [
          "Tool Bag",
          "Empty",
          "To Do List",
          "Settings",
          "Settings",
          "Theme",
          "Light Mode",
          "Dark Mode",
          "Language",
          "Turkish",
          "English",
          "Empty",
          "To do List",
          "Idk",
          "save",
          "entry"
        ];
        dictionary = Map.fromIterables(hkey, value);
      });
    }
  }
}
