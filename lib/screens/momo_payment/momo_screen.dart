import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:momo_vn/momo_vn.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/button/primary_button.dart';
import '../../configs/size_config.dart';
import '../../routes/index.dart';

class ScreenArguments {
  final int amount;
  final String orderId;
  final String username;

  ScreenArguments(
      {required this.amount, required this.orderId, required this.username});
}

class MoMoPaymentScreen extends StatefulWidget {
  static const routeName = "/momo";
  final int amount;
  final String orderId;
  final String username;

  const MoMoPaymentScreen(
      {Key? key,
      required this.amount,
      required this.orderId,
      required this.username})
      : super(key: key);
  @override
  _MoMoPaymentState createState() => _MoMoPaymentState();
}

class _MoMoPaymentState extends State<MoMoPaymentScreen> {
  late MomoVn _momoPay;
  late PaymentResponse _momoPaymentResult;
  // ignore: non_constant_identifier_names
  late String _paymentStatus;

  @override
  void initState() {
    super.initState();
    _momoPay = MomoVn();
    _momoPay.on(MomoVn.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _momoPay.on(MomoVn.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _paymentStatus = "";
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('args' +
        widget.amount.toRadixString(2) +
        widget.orderId +
        widget.username);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PAYMENT WITH MOMO'),
          backgroundColor: kPrimaryColor,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  FlatButton(
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: kPrimaryColor,
                    child: Text('DIRECT TO MOMO APP'),
                    onPressed: () async {
                      MomoPaymentInfo options = MomoPaymentInfo(
                          merchantName: "BookStore",
                          appScheme: "MOxx",
                          merchantCode: 'MOMO28TI20220531',
                          partnerCode: 'MOMO28TI20220531',
                          amount: widget.amount * 23000,
                          orderId: widget.orderId,
                          orderLabel: 'Book',
                          merchantNameLabel: "BookStore",
                          fee: 0,
                          description: 'Payment with momo from BookStore',
                          username: widget.username,
                          partner: 'merchant',
                          extra: "{\"key1\":\"value1\",\"key2\":\"value2\"}",
                          isTestMode: true);
                      try {
                        _momoPay.open(options);
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                  )
                ],
              ),
              Text(_paymentStatus == "" ? "UNPAID" : _paymentStatus),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 32),
                child: const Image(
                  image: AssetImage("assets/images/momo.png"),
                  height: 250,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: SizeConfig.screenWidth * 0.6,
                child: PrimaryButton(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteManager.ROUTE_HOME_PAGE);
                  },
                  buttonText: "Back to home",
                  buttonColor: const Color.fromARGB(255, 249, 82, 69),
                  textColor: Colors.white,
                  buttonWidth: 200,
                  loading: false,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _momoPay.clear();
  }

  void _setState() {
    _paymentStatus = 'PAYMENT SUCCESS';
    if (_momoPaymentResult.isSuccess == true) {
      _paymentStatus += "\nStatus: Payment successfully.";
      _paymentStatus += "\nPhone: " + _momoPaymentResult.phoneNumber.toString();
    } else {
      _paymentStatus += "\nStatus: Payment failed.";
      _paymentStatus += "\nExtra: " + _momoPaymentResult.extra.toString();
      _paymentStatus += "\nErrors: " + _momoPaymentResult.status.toString();
    }
  }

  void _handlePaymentSuccess(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    Fluttertoast.showToast(
        msg: "Success: " + response.phoneNumber.toString(),
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    Fluttertoast.showToast(
        msg: "Failed: " + response.message.toString(),
        toastLength: Toast.LENGTH_SHORT);
  }
}
