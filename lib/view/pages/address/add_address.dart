import 'package:fashio/controllers/address_controller.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:fashio/view/constants/validations.dart';
import 'package:fashio/view/shared/components/custom_button.dart';
import 'package:fashio/view/shared/components/text_filed.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddAdress extends StatelessWidget {
  AddAdress({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final AddressController addressC = Get.find();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _houseNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: 'Add Address',
            leadingWidth: 0,
          )),
      body: ListView(
        padding: EdgeInsets.all(8.sp),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                    controller: _nameController,
                    validator: (val) => validateName(val!),
                    icon: const Icon(Icons.person),
                    label: 'Full Name'),
                AppSize.kSizedBox10h,
                CustomTextField(
                    controller: _mobileController,
                    validator: (val) => validateMobile(val!),

                    // onChanged: loginSignInC.mobileNumber,
                    icon: const Icon(Icons.phone),
                    label: 'Mobile Number'),
                AppSize.kSizedBox10h,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: CustomTextField(
                          controller: _pincodeController,
                          validator: (value) => validatePincode(value!),
                          // onChanged: loginSignInC.email,
                          icon: const Icon(Icons.location_on),
                          label: 'Pincode'),
                    ),
                    AppSize.kSizedBox10w,
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.blueGrey,
                          borderRadius: BorderRadius.circular(6.sp),
                        ),
                        width: 10.w,
                        height: 15.w,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.gps_fixed,
                                size: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                            HeadTitle(
                              text: 'Use my location',
                              fontSize: 10.sp,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                AppSize.kSizedBox10h,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: CustomTextField(
                          controller: _stateController,
                          validator: (value) {
                            return null;
                          },
                          // onChanged: loginSignInC.email,
                          icon: const Icon(Icons.add_location_alt_sharp),
                          label: 'State'),
                    ),
                    AppSize.kSizedBox10w,
                    Expanded(
                      child: CustomTextField(
                          controller: _cityController,
                          validator: (value) {
                            return null;
                          },
                          // onChanged: loginSignInC.email,
                          icon: const Icon(Icons.location_city_rounded),
                          label: 'City'),
                    )
                  ],
                ),
                AppSize.kSizedBox10h,
                CustomTextField(
                    controller: _houseNameController,
                    validator: (value) {
                      return null;
                    },
                    // onChanged: loginSignInC.password,
                    icon: const Icon(Icons.home),
                    label: 'House name / Building name'),
                AppSize.kSizedBox10h,
                CustomTextField(
                    controller: _areaController,
                    validator: (value) {
                      return null;
                    },
                    // onChanged: loginSignInC.password,
                    icon: const Icon(
                      Icons.drive_file_rename_outline_rounded,
                    ),
                    label: 'Road name / Area'),
              ],
            ),
          ),
          AppSize.kSizedBox20h,
          CustomButton(
            color: AppColor.kDarkBluePrimary,
            text: 'Save Address',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('going inside');
                addressC.addAddress(
                  name: _nameController.text,
                  phno: _mobileController.text,
                  pincode: _pincodeController.text,
                  state: _stateController.text,
                  city: _cityController.text,
                  area: _areaController.text,
                  houseName: _houseNameController.text,
                );
              }
            },

            // },
          ),
          AppSize.kSizedBox20h,
          AppSize.kSizedBox10h,
        ],
      ),
    );
  }
}
