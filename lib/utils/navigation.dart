import 'package:country/country_list/views/country_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void openCountryDetail(BuildContext context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDetailPage()));
}