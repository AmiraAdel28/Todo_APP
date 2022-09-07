
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/providers/app_provider.dart';
import 'package:todo/shard/components/components.dart';
import 'package:todo/shard/styles/colors.dart';
import 'package:todo/utils/firebase_firestore.dart';
import '../../utils/firebase_firestore.dart';
import 'edit_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskItem extends StatefulWidget {

    TaskModel taskModel;
    TaskItem(this.taskModel);


  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {


  @override
  Widget build(BuildContext context) {

    var provider =Provider.of<AppProvider>(context);


    var size =MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        showDialog(
            context: context, builder: (c){
          return EditTask(widget.taskModel);
        });
      },
      child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.25,
            motion: StretchMotion(),
             children: [
               SlidableAction(
                 onPressed: (c) async {
                 await dataBase.deleteFromFireBase(widget.taskModel);
                 },
                 borderRadius:BorderRadius.circular(12),
                 // autoClose: true,

                 icon: Icons.delete,
                 backgroundColor: Theme.of(context).colorScheme.error,
                 label: 'Delete',
               )
             ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: provider.themeMode==ThemeMode.light?
            Container(
              height: size.height*.10,
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  widget.taskModel.isDone?Container(
                    width: 3,
                    height: 50,
                    color: GreenColor,
                  ):Container(
                    width: 3,
                    height: 50,
                    color: primaryColor,
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         widget.taskModel.isDone?Text('${widget.taskModel.title}',style:
                         Theme.of(context).textTheme.headline2!.copyWith(color: GreenColor),):Text('${widget.taskModel.title}',style:
                         Theme.of(context).textTheme.headline2,),
                        Text('${widget.taskModel.description}',style:
                        Theme.of(context).textTheme.subtitle1,),
                      ],
                    ),
                  ),

                  InkWell(onTap: (){

                 setState(() {
                   widget.taskModel.isDone=true;
                 });
                  },
                    child:widget.taskModel.isDone? Text(AppLocalizations.of(context)!.done,style:
                      TextStyle(fontWeight: FontWeight.bold,
                      color: GreenColor,
                        fontSize: 25
                      )
                      ,):Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12)
                        ),

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                          child: Icon(Icons.check,color: Colors.white,size: 30,),
                        ))
                  ),
                ],
              ),
            ):
            Container(
          height: size.height*.10,
              margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0XFF707070),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
          widget.taskModel.isDone?  Container(
              width: 3,
              height: 50,
              color: GreenColor,
            ): Container(
            width: 3,
            height: 50,
            color: primaryColor,
          ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                widget.taskModel.isDone? Text('${widget.taskModel.title}',style:
                  Theme.of(context).textTheme.headline2!.copyWith(color:GreenColor),)
                    :Text('${widget.taskModel.title}',style:
                Theme.of(context).textTheme.headline2,),

                  Text('${widget.taskModel.description}',style:
                      provider.themeMode==ThemeMode.light?
                  Theme.of(context).textTheme.subtitle1:TextStyle(
                        color: Colors.white,
                      )
                  ),
                ],
              ),
            ),
            InkWell(onTap: (){
              setState(() {
                widget.taskModel.isDone=true;
              });
            },
              child: widget.taskModel.isDone? Text(AppLocalizations.of(context)!.done,style:
              TextStyle(fontWeight: FontWeight.bold,
                  color: GreenColor,
                  fontSize: 25
              ) ):Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12)
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                    child: Icon(Icons.check,color: Colors.white,size: 30,),
                  )),
            )
          ],
        ),
      ),
          ),
      ),
    );
  }

}
