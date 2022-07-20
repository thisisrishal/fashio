import 'package:fashio/controllers/search_controller.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechController extends GetxController {
  @override
  void onInit() {
    speech = stt.SpeechToText();
    super.onInit();
  }

  final textFieldController = TextEditingController();

  // final SearchController searchC = Get.find();

  stt.SpeechToText? speech;
  RxBool isListening = false.obs;
  RxString text = 'Press the button and start speaking'.obs;
  RxDouble confidencePercentage = 1.0.obs;

  void listen() async {
    print('got here');
    if (!isListening.value) {
      print('${speech!.errorListener}');

      bool available = await speech!.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        isListening.value = true;
        speech!.listen(onResult: (val) {
          
          text.value = val.recognizedWords;
          if (val.hasConfidenceRating && val.confidence > 0) {
            confidencePercentage.value = val.confidence;

            textFieldController.text = val.recognizedWords;

            isListening.value = false;

            searchController.search(val.recognizedWords);
            searchController.isSearching.value = true;

            // speech!.stop();

            print('kittttttipooyyyyyyyyyyyyy===========$text===');
          }
        });
      }
      isListening.value = true;
    } else {
      speech!.stop();
      isListening.value = false;
    }
  }
}
