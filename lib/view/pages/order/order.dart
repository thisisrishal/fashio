import 'package:flutter/material.dart';

import 'package:fashio/view/constants/appConstants.dart';
import '../home/components/components.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            top: 8,
                            bottom: 8,
                            right: 80,
                          ),
                          child: SizedBox(
                            child: ProductCard(
                                imgSrc: imgList[index],
                                name: 'FS - Nike Air max 270 React new',
                                currentPrize: '2999',
                                originalPrize: '4999',
                                offer: '24'),
                          ),
                        );
                      },
                    ),
    );
  }
}
