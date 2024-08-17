import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/country_view_model.dart';


class CountryDetailPage extends StatefulWidget {
  const CountryDetailPage({super.key});

  @override
  State<CountryDetailPage> createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {

  @override
  Widget build(BuildContext context) {
    CountryViewModel countryViewModel = context.watch<CountryViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Center(child: Column(
              children: [
                Text(countryViewModel.selectedCountry!.name),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
