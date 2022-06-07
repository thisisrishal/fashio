import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashio/ui/shared/components/texts.dart';
import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomColon extends StatelessWidget {
  const CustomColon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeadTitle(
      text: ':',
      fontSize: 16,
      color: AppColor.kWhite,
    );
  }
}

class TimeContainer extends StatelessWidget {
  String time;
  TimeContainer({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 14.w,
        width: 14.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: AppColor.kWhite),
        child: Center(child: HeadTitle(text: time)),
      ),
    );
  }
}

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    Key? key,
    required CarouselController controller,
    required RxInt current,
    required String title,
    required String offer,
  })  : _controller = controller,
        _current = current,
        _title = title,
        _offer = offer,
        super(key: key);

  final CarouselController _controller;
  final RxInt _current;
  final String _title;
  final String _offer;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(children: [
          Container(
              // height: 206,
              width: 100.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imgList[index]), fit: BoxFit.cover),
                  color: Colors.green,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ))),
          Positioned(
            bottom: 6.w,
            left: 2.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeContainer(time: '08'),
                const CustomColon(),
                TimeContainer(time: '34'),
                const CustomColon(),
                TimeContainer(time: '52'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadTitle(
                  text: _title,
                  color: AppColor.kWhite,
                  fontSize: 24,
                ),
                HeadTitle(
                  text: '$_offer% off',
                  color: AppColor.kWhite,
                  fontSize: 24,
                )
              ],
            ),
          )
        ]),
      ),
      options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1,
          enlargeCenterPage: true,
          aspectRatio: 2,
          onPageChanged: (index, reason) {
            _current.value = index;
          }),
    );
  }
}
