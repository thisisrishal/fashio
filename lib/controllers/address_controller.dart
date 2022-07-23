import 'package:fashio/controllers/cart_controller.dart';
import 'package:fashio/models/address_model.dart';
import 'package:fashio/services/AppServices.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {


  var addressList = Rx<List<UserAddressDatum>>([]);
  final CartController cartC = Get.find();

  void getAddress() async {
    var response = await AppServices.getAddress(cartC.userId);

    final addressModel = AddressModel.fromJson(response);

    addressList.value = addressModel.data.userAddressData;
    print(addressList.value);
  }

  void addAddress(
      {required String name,
      required String houseName,
      required String area,
      required String state,
      required String phno,
      required String city,
      required String pincode}) async {
    var response = await AppServices.addAddress(
        userid: cartC.userId,
        name: name,
        houseName: houseName,
        area: area,
        state: state,
        phno: phno,
        city: city,
        pincode: pincode);
    print(response);
    getAddress();
  }
}
