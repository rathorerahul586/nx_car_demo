import 'package:get/get.dart';
import 'package:nx_car_demo/utils/screen_navigator.dart';

/// AppBinding is responsible for initializing dependencies when the application starts.
/// It implements the Bindings interface from the GetX package to manage the dependency injection.
class AppBinding implements Bindings {
  @override
  void dependencies() {
    // Registers the ScreenNavigator as a dependency, ensuring it's available throughout the app.
    // The `permanent: true` argument ensures that this instance is not removed from memory
    // even if it is not currently in use.
    Get.put(ScreenNavigator(), permanent: true);
  }
}
