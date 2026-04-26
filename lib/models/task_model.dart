class TaskModel {
   String id;
   String title;
   String description;
   String category;
   String location;
   String userId;
   int date;
   bool isDone;

  TaskModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.category,
    this.location = '',
    required this.userId,
    required this.date,
    this.isDone = false,
  });

// لما اجيب داتا من الفاير ستور محتاج احولها من ماب ل ابجكت
  TaskModel.fromJson(Map<String, dynamic> json) : this(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    category: json['category'],
    location: json['location'],
    userId: json['userId'],
    date: json['date'],
    isDone: json['isDone'],
  );

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'title' : title,
      'description' : description,
      'category' : category,
      'location' : location,
      'userId' : userId,
      'date' : date,
      'isDone' : isDone,
    };
  }
}
