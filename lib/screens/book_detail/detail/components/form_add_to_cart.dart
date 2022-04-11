import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormAddToCart extends StatefulWidget {
  const FormAddToCart({Key? key}) : super(key: key);

  @override
  _FormAddToCartState createState() => _FormAddToCartState();
}

class _FormAddToCartState extends State<FormAddToCart> {
  // int quantity;

  Widget _quantity() {
    return SizedBox(
      // width: 5,
      child: TextField(
        // onChanged: (input)=>loginRequestModel.password=input,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: "1",
            isDense: true,
            border: InputBorder.none,
            prefixIcon: GestureDetector(
                onTap: () {
                  print("hi");
                },
                child: Icon(Icons.remove)),
            suffixIcon: GestureDetector(onTap: () {}, child: Icon(Icons.add)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide:
                    BorderSide(color: Color.fromARGB(100, 158, 158, 158))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide:
                    BorderSide(color: Color.fromARGB(100, 158, 158, 158))),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: _quantity(),
    );
  }
}
