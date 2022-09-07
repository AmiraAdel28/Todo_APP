class TaskModel{
  String id ;
  String? title;
  String? description;
  int? selectedDate;
  bool isDone;

  TaskModel({
    this.id='',
    this.title,
     this.description,
    this.selectedDate,
    this.isDone=false,
});

  TaskModel.fromJason(Map<String ,dynamic>jason):this(
  id: jason['id'],
    title: jason['title'],
    description: jason['description'],
    selectedDate: jason['selectedDate'],
    isDone: jason['isDone'],


  );

  Map<String ,dynamic>toJason(){
    return {
      'id':id,
      'title':title,
      'description':description,
      'selectedDate':selectedDate,
      'isDone':isDone

    };
  }

}