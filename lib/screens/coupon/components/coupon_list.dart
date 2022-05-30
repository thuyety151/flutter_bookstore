import 'package:flutter/material.dart';
import 'package:flutter_folder/screens/coupon/components/coupon_item.dart';
import 'package:provider/provider.dart';
import '../../../provider/coupons.dart';

class CouponList extends StatefulWidget {
  const CouponList({Key? key}) : super(key: key);

  @override
  State<CouponList> createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  var _isInit = true;
  var _selections = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Coupons>(context, listen: false)
          .fetchUserCoupons()
          .then((_) => {
                setState(() {
                  _selections = List.generate(
                      Provider.of<Coupons>(context, listen: false)
                          .userCoupons
                          .length,
                      (_) => false);
                })
              });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  setSelections(int index) async {
    setState(() {
      print("click " + index.toString());
      int indexPresviousSelection =
          _selections.indexWhere((element) => element == true);
      if (indexPresviousSelection >= 0) {
        _selections[indexPresviousSelection] =
            !_selections[indexPresviousSelection];
      }
      _selections[index] = !_selections[index];
    });
    var coupon =
        Provider.of<Coupons>(context, listen: false).userCoupons[index];
    var result = Provider.of<Coupons>(context, listen: false)
        .setSelectedCoupon(coupon.id)
        .then((value) => value);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(await result),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var userCoupons = Provider.of<Coupons>(context, listen: false).userCoupons;
    var selectedCoupon = Provider.of<Coupons>(context, listen: false).selectedCoupon;

    int index = userCoupons.indexWhere((element) => element.id == selectedCoupon.id);
    if (index >=0){
      _selections[index] = true;
    }

    return Consumer<Coupons>(
      builder: (_, coupons, ch) => ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
              key: Key(coupons.userCoupons[index].id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                //TODO: cart.deleteItem(cart.items[index].id ?? "");
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              child: CouponItem(coupons.userCoupons[index], true, () {
                setSelections(index);
              }, _selections[index])),
        ),
        itemCount: coupons.userCoupons.length,
      ),
    );
  }
}
