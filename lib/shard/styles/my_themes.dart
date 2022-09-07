import 'package:flutter/material.dart';
import 'package:todo/shard/styles/colors.dart';

class MyThemeData{

 static final ThemeData lightTheme =ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: mainbackgroundcolor,
    colorScheme:ColorScheme(
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: GreenColor,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      onSurface: Colors.grey,
      surface: Colors.white,
      onBackground: Colors.white,
      background: mainbackgroundcolor,
      brightness: Brightness.light,

    ) ,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w700
      ),
      headline2: TextStyle(
          fontSize: 18,
          color: primaryColor,
          fontWeight: FontWeight.w400
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white
      )
    ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor: primaryColor,
   unselectedItemColor: Colors.grey
   ),
   bottomSheetTheme: BottomSheetThemeData(
     backgroundColor: Colors.white
   ),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
   backgroundColor: primaryColor,
 ),
  );

 static final ThemeData darkTheme =ThemeData(
   primaryColor: primaryColor,
   scaffoldBackgroundColor: DarkColor,
   colorScheme:ColorScheme(
     primary: primaryColor,
     onPrimary: Colors.white,
     secondary: GreenColor,
     onSecondary: Colors.white,
     error: Colors.red,
     onError: Colors.white,
     onSurface: Colors.grey,
     surface: Colors.white,
     onBackground: Colors.white,
     background: mainbackgroundcolor,
     brightness: Brightness.light,

   ) ,
   textTheme: TextTheme(
     headline1: TextStyle(
         fontSize: 22,
         color: Colors.white,
         fontWeight: FontWeight.w700
     ),
     headline2: TextStyle(
         fontSize: 18,
         color: primaryColor,
         fontWeight: FontWeight.w400
     ),
   ),
   appBarTheme: AppBarTheme(
       backgroundColor: primaryColor,
       elevation: 0,
       iconTheme: IconThemeData(
           color: Colors.white
       )
   ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
       selectedItemColor: primaryColor,
       unselectedItemColor: Colors.grey
   ),
   bottomSheetTheme: BottomSheetThemeData(
       backgroundColor: Colors.white
   ),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
     backgroundColor: primaryColor,
   ),
 );

}