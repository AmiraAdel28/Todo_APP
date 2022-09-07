import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/providers/app_provider.dart';
import 'package:todo/shard/components/components.dart';
import 'package:todo/utils/firebase_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate=DateTime.now();
  var formKey =GlobalKey<FormState>();
  String title ='';
  String description ='';
  bool isdone=true;

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);

    return SingleChildScrollView(
      child: provider.themeMode==ThemeMode.light?Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.addtask,style:
            provider.themeMode==ThemeMode.light?
            Theme.of(context).textTheme.headline1!.copyWith(
              color: Colors.black,
            ):Theme.of(context).textTheme.headline1,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.title,
                        labelStyle: provider.themeMode==ThemeMode.light?TextStyle(
                            color: Colors.black
                        ):TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      onChanged: (text){
                        title=text;
                      },
                      validator: (text){
                        if (text==null || text.isEmpty){
                          return 'please Enter task title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.description
                        ,
                        labelStyle: provider.themeMode==ThemeMode.light?TextStyle(
                            color: Colors.black
                        ):TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      onChanged: (text){
                        description=text;
                      },
                      validator: (text){
                        if (text==null || text.isEmpty){
                          return 'please Enter task Description';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            SizedBox(height: 12,),
            Text(AppLocalizations.of(context)!.selectedtime,style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.bold,fontSize: 18
            ),),
            SizedBox(height: 8,),
            InkWell(
              onTap: (){
                openDatePicker();
                setState(() {

                });
              },
              child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 18
              ),
                textAlign: TextAlign.center,),
            ),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: (){
              if(formKey.currentState!.validate()){
                TaskModel task =TaskModel(title: title,
                    description: description,
                    isDone: false,
                    selectedDate:
                    DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                   dataBase.AddTaskToFirestore(task).then((value) {
                  showloading(context, 'Loading');
                  hideBottomSheet(context);
                  showMessage(context, AppLocalizations.of(context)!.successfully, AppLocalizations.of(context)!.ok, (){
                    hideBottomSheet(context);
                    hideBottomSheet(context);
                  }
                  );
                }).catchError((error){
                  print(error);
                });
              }
            }, child: Text(AppLocalizations.of(context)!.addtask))

          ],
        ),
      ):Container(
        decoration: BoxDecoration(
            color: Color(0XFF707070)
            ,

            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.of(context)!.addtask,style:
              provider.themeMode==ThemeMode.light?
              Theme.of(context).textTheme.headline1!.copyWith(
                color: Colors.black,
              ):Theme.of(context).textTheme.headline1,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.title,
                          labelStyle: provider.themeMode==ThemeMode.light?TextStyle(
                              color: Colors.black
                          ):TextStyle(
                              color: Color(0XFFCDCACA)
                              ,fontSize: 20
                          ),
                        ),
                        onChanged: (text){
                          title=text;
                        },
                        validator: (text){
                          if (text==null || text.isEmpty){
                            return 'please Enter task title';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.description
                          ,
                          labelStyle: provider.themeMode==ThemeMode.light?TextStyle(
                              color: Colors.black
                          ):TextStyle(
                              color: Color(0XFFCDCACA)
                                  ,fontSize: 20
                          ),
                        ),
                        onChanged: (text){
                          description=text;
                        },
                        validator: (text){
                          if (text==null || text.isEmpty){
                            return 'please Enter task Description';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              SizedBox(height: 12,),
              Text(AppLocalizations.of(context)!.selectedtime,style:
              provider.themeMode==ThemeMode.light?TextStyle(
                  color: Colors.black
              ):TextStyle(
                  color: Color(0XFFCDCACA)
                  ,fontWeight: FontWeight.bold
                  ,fontSize: 20
              ),
              // Theme.of(context).textTheme.subtitle1!.copyWith(
              //     fontWeight: FontWeight.bold,fontSize: 18
              // ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  openDatePicker();
                },
                child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',style:
                provider.themeMode==ThemeMode.light?TextStyle(
                    color: Colors.black
                ):TextStyle(
                    color: Colors.white
                    ,fontWeight: FontWeight.bold
                    ,fontSize: 18
                ),
                // Theme.of(context).textTheme.subtitle1!.copyWith(
                //     fontSize: 18
                // ),
                  textAlign: TextAlign.center,),
              ),
              SizedBox(height: 12,),
              ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate()){
                  TaskModel task =TaskModel(title: title,
                      description: description,

                      selectedDate:
                      DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                  dataBase.AddTaskToFirestore(task).then((value) {
                    showloading(context, 'Loading');
                    hideBottomSheet(context);
                    showMessage(context, AppLocalizations.of(context)!.successfully, AppLocalizations.of(context)!.ok, (){
                      hideBottomSheet(context);
                      hideBottomSheet(context);
                    }
                    );
                  }).catchError((error){
                    print(error);
                  });
                }
              }, child: Text(AppLocalizations.of(context)!.addtask,style: TextStyle(fontSize: 18),),

              )

            ],
          ),
        ),
      ),
    );
  }

  openDatePicker()async{
   var choosenDate=await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))

   );

   if(choosenDate!=null){
     selectedDate=choosenDate;
     setState(() {

     });
   }

  }
}
