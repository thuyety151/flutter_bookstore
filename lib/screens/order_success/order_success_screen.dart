import 'package:flutter/material.dart';

import '../../components/button/primary_button.dart';
import '../../configs/size_config.dart';
import '../../routes/index.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Order Success"),
      ),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4, //40%
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Order Success",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: PrimaryButton(
              onTap: () {
                Navigator.of(context).pushNamed(RouteManager.ROUTE_HOME_PAGE);
              },
              buttonText: "Back to home",
              buttonColor:const Color.fromARGB(255, 249, 82, 69),
              textColor: Colors.white,
              buttonWidth: 200,
              loading: false,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
