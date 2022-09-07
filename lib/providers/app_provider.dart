import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/firebase_firestore.dart';

class AppProvider extends ChangeNotifier{
     var tasks;
  String AppLanguage ='en';
  bool isDone=true;
  ThemeMode themeMode =ThemeMode.light;
  var selectedDate=DateTime.now().microsecondsSinceEpoch;


void ChangeAppLanguage(String languageCode){
  AppLanguage=languageCode;
  notifyListeners();

}
  void ChangeAppTheme(ThemeMode thememode){
    themeMode=thememode;
    notifyListeners();

  }
  void resresh(){
    dataBase.getDataFromFirebase().where('selectedDate',isEqualTo:selectedDate)
    .get().then((value){
      tasks=value.docs.map((e) {
        return e.data();
      }).toList();
    });
    notifyListeners();
  }



}