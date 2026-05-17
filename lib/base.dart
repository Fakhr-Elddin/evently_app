import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/widgets/primary_text_button.dart';
import 'package:flutter/material.dart';

abstract class BaseValidator{
  void onLoading();
  void onError(String errorMessage);
}

class BaseViewModel<T extends BaseValidator> extends ChangeNotifier{
   T? validator;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel> extends State<T> implements BaseValidator{

  late VM viewModel;

  VM initMyViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initMyViewModel();
  }

  @override
  void onError(String errorMessage) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Something Went Wrong",
        ),
        content: Text(
          errorMessage,
        ),
        actions: [
          PrimaryTextButton(
            text: "OK",
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  void onLoading() {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator(color: AppColors.primaryColorLight,),),);
  }

}