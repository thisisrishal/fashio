import 'package:fashio/models/notification/notification_model.dart';
import 'package:fashio/services/AppServices.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchNotificationData();
    getDataResponse('/all-notification-data');
  }

  final notifications = Rx<List<Notifications>>([]);

  Future fetchNotificationData() async {
    try {
      var response = await getDataResponse('/all-notification-data');

      var notificationModel = NotificationModel.fromJson(response);

      notifications.value = notificationModel.notifications!;
    } catch (e) {throw e.toString();}
  }
}
