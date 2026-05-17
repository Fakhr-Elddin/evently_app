/// interface == connector == navigator

abstract class RegisterNavigator {
  void onSuccess();
  void onError(String errorMessage);
  void onLoading();
}