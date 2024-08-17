import 'package:country/components/countrylist.dart';
import 'package:country/components/loading.dart';
import 'package:country/country_list/view_models/country_view_model.dart';
import 'package:country/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/country_list_models.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CountryViewModel countryViewModel = context.watch<CountryViewModel>();
    return Scaffold(
      body: Container(
        child:Column(
          children: [
            _ui(countryViewModel),
          ],
        )
      ),
    );
  }
  _ui(CountryViewModel countryViewModel){
    if(countryViewModel.loading){
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Loading()),
        ],
      );
    }
    return Expanded(child: ListView.separated(
        itemBuilder: (context,index){
          Country country = countryViewModel.countryListModel[index];
          return Countrylist(country: country,onTap: () async{
            countryViewModel.setSelectedCountry(country);
            openCountryDetail(context);
          },);
        },
        separatorBuilder: (context,index) => const Divider(),
        itemCount: countryViewModel.countryListModel.length
    )
    );
  }
}
