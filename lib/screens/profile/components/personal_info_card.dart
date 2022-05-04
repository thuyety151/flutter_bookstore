import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';

class PersonalInfo {
  String name;
  String email;
  String location;
  String gender;
  String phoneNumber;

  PersonalInfo(
      {required this.name,
      required this.email,
      required this.location,
      required this.gender,
      required this.phoneNumber});
}

Map<String, String> map = {
  'name': 'Thuyet Y"',
  'email': 'thuyety15@gmail.com',
  'location': 'Ho Chi Minh, Viet Nam',
  'gender': 'Female',
  'phoneNumber': '+84 366 303 800'
};

PersonalInfo sampleData = PersonalInfo(
    name: "Thuyet Y",
    email: "thuyety15@gmail.com",
    location: "Ho Chi Minh, Viet Nam",
    gender: "Female",
    phoneNumber: "+84 366 303 800");

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({Key? key}) : super(key: key);

  Widget _contents() {
    return Column(
      children: map.entries.map((entry) {
    return Padding(
        padding:const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(entry.key + ":",
                style:const TextStyle(color: AppColors.kTextGrey)),
            Text(
              entry.value,
              style:const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ));
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: _contents());
  }
}
