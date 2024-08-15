import 'dart:convert';
import 'dart:io';

import 'package:country/country_list/repo/api_status.dart';
import 'package:country/utils/constants.dart';
import 'package:http/http.dart' as http;


class CountryServices{
 static Future<Object> getCountries() async{
   try{
     var url = Uri.parse(COUNTRY_LIST);
     var response = await http.get(url);

     if(response.statusCode == 200){
       return Success(response:jsonDecode(response.body), code: 200);
     }else{
       return Failure(errorResponse: "Failure Response", code: COUNTRY_INVALID_RESPONSE);
     }

   }on HttpException{
     return Failure(errorResponse: "No Internet", code: NO_INTERNET);

   }on FormatException{
     return Failure(errorResponse: "Invalid Format", code: INVALID_FORMAT);

   }
   catch(e){

     return Failure(errorResponse: "Unkown Error", code: UNKOWN_ERROR);

   }
 }
}