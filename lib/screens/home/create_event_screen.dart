import 'package:evently_app/firebase/firebase_manager.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/create_event_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:evently_app/widgets/category_event_item_selected_and_unselected.dart';
import 'package:evently_app/widgets/custom_text_from_field.dart';
import 'package:evently_app/widgets/primary_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});
  static const String routeName = "createEventScreen";

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TaskModel? taskModel;
  bool isFirst = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(isFirst){
      taskModel = ModalRoute.of(context)?.settings.arguments as TaskModel?;
      if(taskModel != null){
        titleController.text = taskModel!.title;
        descriptionController.text = taskModel!.description;
      }
      isFirst = false;
    }
  }
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider()..initCategory(taskModel),
      builder: (context, child){
        var createEventProvider = Provider.of<CreateEventProvider>(context);
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
                color: AppColors.primaryColorLight
            ),
            centerTitle: true,
            title: Text(
              taskModel == null ? 'Create Event' : 'Update Event',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      fit: BoxFit.fill,
                      createEventProvider.eventImages[createEventProvider.selectedIndex],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      height: 50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: (){
                            createEventProvider.changeSelectedIndex(index);
                          },
                          child: createEventProvider.selectedIndex == index ? CategoryEventItemSelected(
                            icon: createEventProvider.eventIcons[index],
                            text: createEventProvider.eventsName[index],
                          )
                              : CategoryEventItemUnselected(
                            icon: createEventProvider.eventIcons[index],
                            text: createEventProvider.eventsName[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(width: 10,),
                        itemCount: createEventProvider.eventsName.length,
                      ),
                    ),
                  ),
                  Text(
                    'Title',
                    style: AppStyles.medium16,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFromField(
                    hintText: 'Event Title',
                    prefixIcon: ImageIcon(
                      color: themeProvider.appTheme == ThemeMode.light
                          ? AppColors.greyColor
                          : AppColors.offWhiteColor,
                      AssetImage(AssetsManager.titleIcon),
                    ),
                    controller: titleController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Description',
                    style: AppStyles.medium16,
                  ),
                  SizedBox(
                    height: 8,
                    ),
                  CustomTextFromField(
                    hintText: 'Event Description',
                    controller: descriptionController,
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: AppColors.blackColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Event Date',
                        style: AppStyles.medium16.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () async{
                          DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now().subtract(Duration(days: 365)),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                          );
                            if(date != null){
                              createEventProvider.changeSelectedDate(date);
                            }
                        },
                        child: Text(
                          taskModel == null ?
                          createEventProvider.selectedDate != null
                              ? createEventProvider.selectedDate.toString().substring(0,10)
                              : 'Choose Date' : DateTime.fromMillisecondsSinceEpoch(taskModel!.date).toString().substring(0,10),
                          style: AppStyles.medium16.copyWith(
                            color: AppColors.primaryColorLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  createEventProvider.isLoading
                      ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColorLight,
                      backgroundColor: AppColors.greyColor,
                    ),
                  )
                      : PrimaryTextButton(
                    text: taskModel == null ? 'Add Event' : 'Update Event',
                    onPressed: (){
                      if(taskModel == null){
                        TaskModel taskModel = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          category: createEventProvider.eventsName[createEventProvider.selectedIndex],
                          date: createEventProvider.selectedDate!.millisecondsSinceEpoch,
                        );
                        createEventProvider.setLoading(true);
                        FirebaseManager.addEvent(taskModel).then((value) {
                          createEventProvider.setLoading(false);
                          Navigator.pop(context);
                        },
                        );
                      } else{
                        TaskModel newTaskModel = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          category: createEventProvider.eventsName[createEventProvider.selectedIndex],
                          date: createEventProvider.selectedDate?.millisecondsSinceEpoch ?? taskModel!.date,
                          id: taskModel!.id,
                        );
                        createEventProvider.setLoading(true);
                        FirebaseManager.updateTask(newTaskModel).then((value) {
                          createEventProvider.setLoading(false);
                          Navigator.pop(context);
                        },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
