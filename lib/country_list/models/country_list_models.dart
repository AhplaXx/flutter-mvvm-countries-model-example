import 'dart:convert';

class Country {
  final String name;
  final String capital;
  final String flag_url;
  final bool independent;
  final int population;


  Country({required this.name, required this.capital,required this.flag_url,required this.independent,required this.population});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: const Utf8Decoder().convert(json['name']['common'].toString().codeUnits) ,
      capital: (json['capital'] != null ) ? const Utf8Decoder().convert(json['capital'][0].toString().codeUnits) : 'No Capital',
      flag_url: json['flags']['png'] as String,
      independent: json['independent'] as bool? ?? false,
      population: json['population'] as int,


    );
  }

  static List<Country> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Country.fromJson(json as Map<String, dynamic>)).toList();

  }
}
