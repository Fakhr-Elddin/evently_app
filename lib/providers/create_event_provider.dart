import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier{
  final List<String> eventsName = const[
    "Sport",
    "Birthday",
    "Meeting",
    "Gaming",
    "WorkShop",
    "Book Club",
    "Exhibitions",
    "Holiday",
    "Eating",
  ];
  final List<String> eventImages = const[
    AssetsManager.sport,
    AssetsManager.birthday,
    AssetsManager.meeting,
    AssetsManager.gaming,
    AssetsManager.workShop,
    AssetsManager.bookClub,
    AssetsManager.exhibition,
    AssetsManager.holiday,
    AssetsManager.eating,
  ];
  final List<IconData> eventIcons = const[
    Icons.directions_run_rounded,
    Icons.cake_rounded,
    Icons.groups_rounded,
    Icons.sports_esports_rounded,
    Icons.build_circle_rounded,
    Icons.menu_book_rounded,
    Icons.palette_rounded,
    Icons.beach_access_rounded,
    Icons.restaurant_rounded,
  ];
  int selectedIndex = 0;
  DateTime? selectedDate;
  bool isLoading = false;
  void setLoading(bool loading){
    isLoading = loading;
    notifyListeners();
  }
  void initCategory(TaskModel? taskModel){
    int index = eventsName.indexOf(taskModel?.category ?? "");
    if(index != -1){
      selectedIndex = index;
    }
    notifyListeners();
  }

  void changeSelectedIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }
  void changeSelectedDate(DateTime date){
    selectedDate = date;
    notifyListeners();
  }
}