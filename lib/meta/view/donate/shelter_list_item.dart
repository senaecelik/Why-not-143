import 'package:flutter/material.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';

class ShelterListItem extends StatelessWidget {
  final String name;
  final String city;
  const ShelterListItem(
      {required this.name, required this.city,  Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(
          name,
          style: TextStyleConstant.instance.textLargeMedium,
        ),
        subtitle: Text(
          city,
          style: TextStyleConstant.instance.textLargeMedium,
        ),
        
      ),
    );
  }
}
