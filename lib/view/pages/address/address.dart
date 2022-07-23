import 'package:fashio/controllers/address_controller.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:fashio/view/pages/account/account.dart';
import 'package:fashio/view/shared/components/custom_button.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);

  final AddressController addressC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            leading: Center(
                child: HeadTitle(
              text: 'Address',
              fontSize: 20,
            )),
            leadingWidth: 110,
          )),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {

              Get.toNamed('/addAddress');
            },
            child: const CustomListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: AppColor.kThemeBlue,
                ),
                title: 'Add a new address'),
          ),
          const Divider(
            color: Colors.grey,
            height: 2,
          ),
          AppSize.kSizedBox10h,
          Obx(
            () => Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: addressC.addressList.value.length,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:  EdgeInsets.all(2.sp),
                    child: Container(
                      padding: EdgeInsets.all(6.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadTitle(
                              text: addressC.addressList.value[index].firstName
                                  .toString()),
                          SubTitle(
                              text: addressC.addressList.value[index].address1),
                          SubTitle(
                              text: addressC.addressList.value[index].address2),
                          const SubTitle(text: 'India'),
                          const SubTitle(text: '9921494342'),
                          AppSize.kSizedBox10h,
                          SizedBox(
                            width: 20.w,
                            height: 20,
                            child: CustomButton(
                              color: Colors.red,
                              text: 'Delete',
                              onPressed: () {},
                              padding: const EdgeInsets.all(0),
                            ),
                          ),
                          AppSize.kSizedBox10h
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
