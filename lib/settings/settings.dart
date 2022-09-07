import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/app_provider.dart';
import 'package:todo/settings/show_Theme_bottom_sheet.dart';
import 'package:todo/settings/show_language_bottom_sheet.dart';
import 'package:todo/shard/styles/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
          child: Text(AppLocalizations.of(context)!.language,
          style:provider.themeMode==ThemeMode.light?
          Theme.of(context).textTheme.headline2!.copyWith(
              fontWeight: FontWeight.bold
          ):TextStyle(
            color: Colors.white
                ,fontWeight: FontWeight.bold,
            fontSize: 18,
          )),),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: (){
              showLanguageBottomShet();
            },
            child:provider.themeMode==ThemeMode.light? Container(padding: EdgeInsets.all(12),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,

                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Text(provider.AppLanguage=='en'?AppLocalizations.of(context)!.english
                    :AppLocalizations.of(context)!.arabic,
                  style: provider.themeMode==ThemeMode.light?
                  Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.bold,

                  ):
                  TextStyle(
                      color: Colors.white, fontSize: 18,
                      fontWeight: FontWeight.bold,
                  ),
                )): Container(padding: EdgeInsets.all(12),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                 color: Color(0XFF141922),

                  border: Border.all(color: standardColorDark),
                ),
                child: Text(provider.AppLanguage=='en'?AppLocalizations.of(context)!.english
                    :AppLocalizations.of(context)!.arabic,
                  style: provider.themeMode==ThemeMode.light?
                  Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.bold
                  ):
                  TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Text(AppLocalizations.of(context)!.theme,
            style:  provider.themeMode==ThemeMode.light?
            Theme.of(context).textTheme.headline2!.copyWith(
              fontWeight: FontWeight.bold
            ):
            TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
        ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child:provider.themeMode==ThemeMode.light? Container(padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Text(provider.themeMode==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,
                  style:  provider.themeMode==ThemeMode.light?
                  Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.bold
                  ):
                  TextStyle(
                      color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),)): Container(padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0XFF141922),
                  border: Border.all(color: standardColorDark),
                ),
                child: Text(provider.themeMode==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,
                  style:  provider.themeMode==ThemeMode.light?
                  Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.bold
                  ):
                  TextStyle(
                      color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),)),
          ),
        ),
      ],
    );
  }

  void showLanguageBottomShet(){

    showModalBottomSheet(
      backgroundColor: Colors.white,
        context: context, builder: (context){
      return ShowLanguageBottomSheet();
    });
  }
  void showThemeBottomSheet(){
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context, builder: (context){
      return ShowThemeBottomSheet();
    });
  }
}
