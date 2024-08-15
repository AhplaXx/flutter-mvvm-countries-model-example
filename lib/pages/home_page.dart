import 'package:country/country_list/view_models/country_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../country_list/models/country_list_models.dart';


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
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      );
    }
    return Expanded(child: ListView.separated(
        itemBuilder: (context,index){
          Country country = countryViewModel.countryListModel[index];
          return Container(
            child: Column(
              children: [
                Text(country.name,style: TextStyle(color: Colors.black),)
              ],
            ),
          );
        },
        separatorBuilder: (context,index) => Divider(),
        itemCount: countryViewModel.countryListModel.length
    )
    );
  }
}
