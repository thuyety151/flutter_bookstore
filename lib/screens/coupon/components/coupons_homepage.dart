import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/components/list_book_section.dart';
import 'package:flutter_folder/provider/coupons.dart';
import 'package:flutter_folder/screens/coupon/components/coupon_item.dart';
import 'package:provider/provider.dart';

class CouponHomepage extends StatelessWidget {
  const CouponHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<Coupons>(context, listen: false).fetchCoupons();

    return ListBookSession(
      title: "Coupons",
      hideViewAll: true,
      child: Consumer<Coupons>(
          builder: ((context, value, child) => Wrap(
                spacing: 12,
                children: List.generate(
                    value.coupons.length,
                    (index) =>
                        CouponItem(value.coupons[index], false, () {}, false)),
              ))),
    );
  }
}
