import 'package:country/country_list/models/country_list_models.dart';
import 'package:country/utils/navigation.dart';
import 'package:flutter/material.dart';


class Countrylist extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;
  Countrylist({super.key, required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {



    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(country.name + " --- "+country.capital,style: const TextStyle(color: Colors.black),)
        ],
      ),
    );
  }
}
