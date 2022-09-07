import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';
import 'package:todo/providers/app_provider.dart';
import 'package:todo/shard/styles/my_themes.dart';

class ShowThemeBottomSheet extends StatefulWidget {


  @override
  State<ShowThemeBottomSheet> createState() => _ShowThemeBottomSheetState();
}

class _ShowThemeBottomSheetState extends State<ShowThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(onTap: (){
            provider.ChangeAppTheme(ThemeMode.light);
            Navigator.pop(context);

          },
              child: selectedLanguage(AppLocalizations.of(context)!.light,provider.themeMode==ThemeMode.light?true:false)),
          SizedBox(height: 8,),
          InkWell(onTap: (){
            provider.ChangeAppTheme(ThemeMode.dark);
            Navigator.pop(context);

          },
              child: selectedLanguage(AppLocalizations.of(context)!.dark,provider.themeMode==ThemeMode.dark?true:false))
        ],
      ),
    );
  }

  Widget selectedLanguage (String text ,bool select){
    if(select){
       return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(text,
            style: TextStyle(fontSize: 25,color: MyThemeData.lightTheme.primaryColor)),
          Icon(Icons.check,size: 30,
            color: MyThemeData.lightTheme.primaryColor),
        ],
      );
    }
    else{
       return    Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(text,
             style: TextStyle(fontSize: 25,),),
           Icon(Icons.check,size: 25,),
         ],
       );

    }

}
}
