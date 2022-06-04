import 'package:flutter/material.dart';
import 'package:flutter_folder/provider/address_model.dart';
import 'package:provider/provider.dart';
import '../../../components/custom_text_style.dart';
import '../../../provider/shipping.dart';

class CheckoutDelivery extends StatelessWidget {
  const CheckoutDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAddress =
        Provider.of<AddressModel>(context, listen: false).defaulAddress;
    return FutureBuilder(
      future: Provider.of<Shipping>(context, listen: false)
          .getServiceType(currentAddress.districtID ?? 0),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (dataSnapshot.error != null) {
            // ...
            // Do error handling stuff
            print(dataSnapshot.error);
            return Center(
              child: Text('An error occurred!'),
            );
          } else {
            return Consumer<Shipping>(
                builder: (_, value, ch) => Card(
                    elevation: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        //color: Colors.tealAccent.withOpacity(0.2),
                      ),
                      margin: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: value.serviceTypes
                           .where((element) => element.shortName != "") .map(
                              (serviceType) => 
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: serviceType.isMain ? 1 : 0,
                                      groupValue: 1,
                                      onChanged: (isChecked) {
                                        value.setSelectedServiceType(
                                            serviceType);
                                      },
                                      activeColor: Colors.orange.shade400,
                                    ),
                                    Text(
                                      serviceType.shortName.toString() ==
                                              "Đi bộ"
                                          ? "Standard"
                                          :  serviceType.shortName.toString() ==
                                              "Bay" ? "Express" : "DHL Express",
                                      style: CustomTextStyle.textFormFieldMedium
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ]),
                            )
                            .toList(),
                      ),
                    )));
          }
        }
      },
    );
  }
}
