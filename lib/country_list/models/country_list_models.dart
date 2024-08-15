import 'dart:convert';

class Country {
  final String name;
  final String capital;

  Country({required this.name, required this.capital});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: Utf8Decoder().convert(json['name']['common'].toString().codeUnits) ,
      capital: (json['capital'] != null ) ? Utf8Decoder().convert(json['capital'][0].toString().codeUnits) : 'No Capital'
    );
  }

  static List<Country> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Country.fromJson(json as Map<String, dynamic>)).toList();

  }
}
