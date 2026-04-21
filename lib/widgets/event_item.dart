import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/screens/home/create_event_screen.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.taskModel});
  final TaskModel? taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  fit: BoxFit.fill,
                  "assets/images/${taskModel!.category.toLowerCase()}.png",
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColorLight,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 8.0),
                        child: Text(
                          taskModel!.title,
                          style: AppStyles.bold14,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, CreateEventScreen.routeName,arguments: taskModel,);
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.favorite_border,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10,),
            margin:  EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.backgroundColorLight,
            ),
            child: Column(
              children: [
                Text(
                  formatDateTime(taskModel!.date).split(',')[0].substring(8,10),
                  style: AppStyles.bold20.copyWith(
                      color: AppColors.primaryColorLight,
                  ),
                ),
                Text(
                  formatDateTime(taskModel!.date).split(',')[2],
                  style: AppStyles.bold14.copyWith(
                    color: AppColors.primaryColorLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  String formatDateTime(int date){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    DateFormat dateFormat = DateFormat('yyyy-MM-dd, EE, MMM');
    String formatedDate = dateFormat.format(dateTime);
    return formatedDate;
  }
}
