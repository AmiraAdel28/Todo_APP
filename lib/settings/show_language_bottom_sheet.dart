import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';
import 'package:todo/providers/app_provider.dart';

class ShowLanguageBottomSheet extends StatefulWidget {


  @override
  State<ShowLanguageBottomSheet> createState() => _ShowLanguageBottomSheetState();
}

class _ShowLanguageBottomSheetState extends State<ShowLanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(onTap: (){
            provider.ChangeAppLanguage('en')  ;
            Navigator.pop(context);

          },
              child: selectedLanguage(AppLocalizations.of(context)!.english,provider.AppLanguage=='en'?true:false)),
          SizedBox(height: 8,),
          InkWell(onTap: (){
            provider.ChangeAppLanguage('ar');
            Navigator.pop(context);

          },
              child: selectedLanguage(AppLocalizations.of(context)!.arabic,provider.AppLanguage=='ar'?true:false))
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
            style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 25,color: Theme.of(context).primaryColor),),
          Icon(Icons.check,size: 25,
            color: Theme.of(context).primaryColor,),
        ],
      );
    }
    else{
       return    Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(text,
             style: TextStyle(
               fontSize: 25
             ),),
           Icon(Icons.check,size: 25,),
         ],
       );

    }

}
}
