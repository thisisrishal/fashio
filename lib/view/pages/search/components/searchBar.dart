import 'package:avatar_glow/avatar_glow.dart';
import 'package:fashio/controllers/speech_controller.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

//?need min SDK version 21

class SearchingAppBar extends StatelessWidget {
  const SearchingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .3,
      toolbarHeight: 10.h,
      backgroundColor: AppColor.kWhite,
      automaticallyImplyLeading: false,
      title: SearchBar(),
    );
  }
}

class SearchBar extends StatefulWidget {
  SearchBar({
    Key? key,
    this.autofocus = true,
  }) : super(key: key);

  final bool autofocus;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final speechC = Get.put(SpeechController());

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 80.w,
        height: 6.h,
        color: Colors.white,
        child: Obx(
          () => Center(
            child: TextField(
              controller: speechC.textFieldController,
              style: TextStyle(
                  fontFamily: 'Poppins-SemiBold',
                  fontWeight: FontWeight.values[4],
                  color: AppColor.kblack.withOpacity(.6)),
              autofocus: widget.autofocus,
              textInputAction: TextInputAction.search,
              onSubmitted: (val) {
                searchController.isKeyboard.value = false;
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColor.kThemeBlue.withOpacity(.4), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColor.kLightGrey.withOpacity(.1), width: 2.0),
                ),
                hintText: 'Search for something',
                contentPadding: const EdgeInsets.all(10),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColor.kThemeBlue.withOpacity(.8),
                  size: 20.sp,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    speechC.textFieldController.clear();
                    // searchController.isKeyboard.value = false;
                  },
                  icon: searchController.isSearching.value
                      ? Icon(
                          Icons.clear,
                          color: AppColor.kThemeBlue.withOpacity(.8),
                          size: 20.sp,
                        )
                      : speechC.isListening.value
                          ? AvatarGlow(
                              endRadius: 20,
                              glowColor: AppColor.kThemeBlue,
                              child: GestureDetector(
                                onTap:  speechC.listen,
                                child: const Icon(
                                  Icons.mic_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : GestureDetector(
                            onTap:  speechC.listen,
                            child: const Icon(
                                Icons.mic_none_rounded,
                                color: Colors.grey,
                              ),
                          ),
                ),
              ),
              onChanged: (val) {
                (val.isEmpty)
                    ? searchController.isSearching.value = false
                    : searchController.isSearching.value = true;
                if (val.isNotEmpty) searchController.search(val);
              },
            ),
          ),
        ));
  }
}
