import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(child: Text('FilterScreen')),
        CustomSlider()
      ],
    );
  }
}

class CustomSlider extends StatelessWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RangeController controller = Get.put(RangeController());
    return Scaffold(
      body: Obx(() {
        return RangeSlider(
            values: controller.currentValues.value,
            min: 0,
            max: 100,
            onChanged: (RangeValues values) {
              controller.currentValues.value = values;
              // _controller.RangeValue(values);
            });
      }),
    );
  }
}

class RangeController extends GetxController {
  Rx<RangeValues> currentValues = const RangeValues(10, 50).obs;

  void RangeValue(values) {
    currentValues.value = values;
  }
}
