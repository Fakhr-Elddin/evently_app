import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/firebase/firebase_manager.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:evently_app/widgets/event_item.dart';
import 'package:evently_app/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> eventsName = [
    "All",
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
  List<IconData> eventIcons = [
    Icons.grid_view_rounded,
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
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.23,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.primaryColorLight,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Welcome Back ✨',
                          style: themeProvider.appTheme == ThemeMode.light
                              ? AppStyles.regular14
                              : AppStyles.regular14.copyWith(
                                  color: AppColors.offWhiteColor,
                                ),
                        ),
                        Text(
                          'John Safwat',
                          style: themeProvider.appTheme == ThemeMode.light
                              ? AppStyles.bold24
                              : AppStyles.bold24.copyWith(
                                  color: AppColors.offWhiteColor,
                                ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.wb_sunny_outlined,
                        color: themeProvider.appTheme == ThemeMode.light
                            ? AppColors.backgroundColorLight
                            : AppColors.offWhiteColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: themeProvider.appTheme == ThemeMode.light
                            ? AppColors.backgroundColorLight
                            : AppColors.offWhiteColor,
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      child: Text(
                        'EN',
                        style: themeProvider.appTheme == ThemeMode.light
                            ? AppStyles.bold14.copyWith(
                                color: AppColors.primaryColorLight,
                              )
                            : AppStyles.bold14.copyWith(
                                color: AppColors.backgroundColorDark,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 11),
              Row(
                children: [
                  ImageIcon(
                    color: AppColors.backgroundColorLight,
                    AssetImage(AssetsManager.mapIcon),
                  ),
                  Text(
                    'Cairo , Egypt',
                    style: themeProvider.appTheme == ThemeMode.light
                        ? AppStyles.medium14.copyWith(
                            color: AppColors.offWhiteColor,
                          )
                        : AppStyles.medium14.copyWith(
                            color: AppColors.offWhiteColor,
                          ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              DefaultTabController(
                length: eventsName.length,
                child: TabBar(
                  isScrollable: true,
                  physics: BouncingScrollPhysics(),
                  tabAlignment: TabAlignment.start,
                  indicatorColor: AppColors.transparentColor,
                  indicator: BoxDecoration(),
                  dividerColor: AppColors.transparentColor,
                  labelPadding: EdgeInsetsDirectional.only(end: 10),
                  tabs: eventsName.map((event) {
                    int index = eventsName.indexOf(event);
                    return TabWidget(
                      isSelected: selectedIndex == index ? true : false,
                      icon: eventIcons[index],
                      text: event,
                    );
                  }).toList(),
                  onTap: (index) {
                    if(index != selectedIndex){
                      selectedIndex = index;
                      setState(() {});
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: FirebaseManager.getEvents(),
          builder: (context, snapshot) {
            return Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                itemBuilder: (context, index) => Slidable(
                  key: UniqueKey(),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {
                      FirebaseManager.deleteTask(snapshot.data!.docs[index].id);
                    }),
                    children:  [
                      SlidableAction(
                        onPressed: (context){
                          FirebaseManager.deleteTask(snapshot.data!.docs[index].id);
                        },
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: EventItem(
                    taskModel: snapshot.data?.docs[index].data(),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 16,),
                itemCount: snapshot.data?.docs.length ?? 0,
              ),
            );
          }
        ),
      ],
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: AppColors.primaryColorLight,
    //     leadingWidth: 0,
    //     title: Column(
    //       children: [
    //         Text(
    //           'Welcome Back ✨',
    //           style: themeProvider.appTheme == ThemeMode.light
    //               ? AppStyles.regular14
    //               : AppStyles.regular14.copyWith(
    //             color: AppColors.offWhiteColor,
    //           ),
    //         ),
    //         Text(
    //           'John Safwat',
    //           style: themeProvider.appTheme == ThemeMode.light
    //               ? AppStyles.bold24
    //               : AppStyles.bold24.copyWith(
    //             color: AppColors.offWhiteColor,
    //           ),
    //         ),
    //       ],
    //     ),
    //     actions: [
    //       IconButton(
    //         onPressed: (){},
    //         icon: Icon(
    //           Icons.wb_sunny_outlined,
    //           color: themeProvider.appTheme == ThemeMode.light
    //               ? AppColors.backgroundColorLight
    //               : AppColors.offWhiteColor,
    //         ),
    //       ),
    //       Container(
    //         padding: const EdgeInsets.all(8),
    //         margin: const EdgeInsets.only(right: 16),
    //         decoration: BoxDecoration(
    //             color: themeProvider.appTheme == ThemeMode.light ? AppColors.backgroundColorLight : AppColors.offWhiteColor,
    //             borderRadius: BorderRadiusGeometry.circular(12)
    //         ),
    //         child: Text(
    //           'EN',
    //           style: themeProvider.appTheme == ThemeMode.light
    //               ? AppStyles.bold14.copyWith(color: AppColors.primaryColorLight)
    //               : AppStyles.bold14.copyWith(color: AppColors.backgroundColorDark),
    //         ),
    //       ),
    //     ],
    //     bottom: AppBar(
    //       backgroundColor: AppColors.primaryColorLight,
    //       leadingWidth: 0,
    //       title: Row(
    //         children: [
    //           ImageIcon(
    //             color: AppColors.backgroundColorLight,
    //             AssetImage(
    //               AssetsManager.mapIcon,
    //             ),
    //           ),
    //           SizedBox(
    //             width: 3,
    //           ),
    //           Text(
    //             'Cairo , Egypt',
    //             style: themeProvider.appTheme == ThemeMode.light
    //                 ? AppStyles.medium14.copyWith(
    //               color: AppColors.offWhiteColor,
    //             )
    //                 : AppStyles.medium14.copyWith(
    //               color: AppColors.offWhiteColor,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
