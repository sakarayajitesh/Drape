import 'package:drape/controllers/coach_marks_controller.dart';
import 'package:get/get.dart';

import 'laundry_controller.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  late final CoachMarksController coachMarksController;
  var _hasCoachMarkChecked = true;

  @override
  void onInit() {
    super.onInit();
    coachMarksController = Get.find();
    Get.put(LaundryController());
    coachMarksController.navigationInfo.listen((p0) {
      if(p0==coachMarksController.targetInfo[0]) selectedIndex.value = 1;
    });
  }

  void checkCoachMarks(context){
    if(!_hasCoachMarkChecked) {
      coachMarksController.checkForCoachMarks(context);
      _hasCoachMarkChecked = true;
    }
  }

}
