import 'package:flutter/material.dart';
import 'package:flutter_folder/components/custom_text_style.dart';

class CheckoutAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6,
              ),
              Text(
                "Truong Nguyen",
                style: CustomTextStyle.textFormFieldSemiBold
                    .copyWith(fontSize: 14),
              ),
              Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Text(
                    "54 Duong so 8, Linh Trung, Thu Duc, Ho Chi Minh",
                    style: CustomTextStyle.textFormFieldMedium
                        .copyWith(fontSize: 13, color: Colors.grey.shade800),
                  )),
              SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Mobile : ",
                      style: CustomTextStyle.textFormFieldMedium
                          .copyWith(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: "0866933178",
                      style: CustomTextStyle.textFormFieldBold
                          .copyWith(fontSize: 12, color: Colors.black)),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),
              Container(
                child: Row(children: [
                  Spacer(
                    flex: 2,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Edit Address",
                      style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          fontSize: 12, color: Colors.indigo.shade700),
                    ),
                  ),
                  Spacer(flex: 3),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("Add New Address",
                        style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                            fontSize: 12, color: Colors.indigo.shade700)),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
