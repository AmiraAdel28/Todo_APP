import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo/modules/tasks/tasks.dart';
import 'package:todo/settings/settings.dart';



class HomeLayout extends StatefulWidget {
static const String routename ='HomeLayout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}
class _HomeLayoutState extends State<HomeLayout> {
int currentindex=0;
List<Widget> tabs =[TaskScreen(),SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('ToDo Route',
        style: Theme.of(context).textTheme.headline1,),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
        onPressed: (){
          openBotttomSheetToAddTask();
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (index){
            currentindex=index;
            setState(() {

            });

          },
          currentIndex: currentindex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: ""),
          ],
        ),
      ),
      body: tabs[currentindex],
    );
  }
openBotttomSheetToAddTask(){
    showModalBottomSheet(context: context, builder: (context){
      return Container(child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        child: AddTaskBottomSheet(),
      ));
    },
    isScrollControlled: true
    );
}
}
