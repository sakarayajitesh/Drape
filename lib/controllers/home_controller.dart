import 'package:drape/controllers/coach_marks_controller.dart';
import 'package:get/get.dart';

import 'manage_controller.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  late final CoachMarksController coachMarksController;
  var _hasCoachMarkChecked = false;

  @override
  void onInit() {
    super.onInit();
    Get.put(ManageController());
    coachMarksController = Get.find();
    coachMarksController.navigationInfo.listen((p0) {
      if(p0==coachMarksController.targetInfo[0]) selectedIndex.value = 1;
    });
  }

  void checkCoachMarks(context){
    if(!_hasCoachMarkChecked) {
      coachMarksController.checkAndShowCoachMarks(context);
      _hasCoachMarkChecked = true;
    }
  }

}
