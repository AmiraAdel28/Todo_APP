import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/modules/tasks/task_item.dart';
import 'package:todo/providers/app_provider.dart';
import 'package:todo/shard/styles/colors.dart';
import 'package:todo/utils/firebase_firestore.dart';

import '../../utils/firebase_firestore.dart';

class TaskScreen extends StatefulWidget {
  static const String routename ='TaskScreen';
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  var selectedDate =DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);
    return Container(
      child: Column(
        children: [
       provider.themeMode==ThemeMode.light?   CalendarTimeline(
         initialDate:selectedDate,
         firstDate: DateTime.now().subtract(Duration(days: 365)),
         lastDate: DateTime.now().add(Duration(days: 365)),
         onDateSelected: (date){
           selectedDate= date!;
           setState(() {

           });
         },
         leftMargin: 20,
         monthColor: Colors.black,
         dayColor: Colors.black,
         activeDayColor: primaryColor,
         activeBackgroundDayColor: Colors.white,
         dotsColor: primaryColor,
         selectableDayPredicate: (date) => true,
       ):   CalendarTimeline(
         initialDate:selectedDate,
         firstDate: DateTime.now().subtract(Duration(days: 365)),
         lastDate: DateTime.now().add(Duration(days: 365)),
         onDateSelected: (date){
           selectedDate= date!;
           setState(() {

           });
         },
         leftMargin: 20,
         monthColor: Colors.white,
         dayColor: Colors.white,
         activeDayColor: primaryColor,
         activeBackgroundDayColor: Colors.grey,
         dotsColor: primaryColor,
         selectableDayPredicate: (date) => true,
         locale: 'en',
       ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<TaskModel>>(
              stream:dataBase.GetTasksFromFireStoreusingStream(selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                if(snapshot.hasError){
                  return Text('something went wrong');
                }

                List<TaskModel> tasks =
                    snapshot.data!.docs.map((e) => e.data()).toList();
                return ListView.builder(
                  itemBuilder: (_, index) {
                    return TaskItem(tasks[index]);
                  },
                  itemCount: tasks.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
