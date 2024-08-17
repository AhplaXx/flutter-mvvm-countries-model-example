import 'package:country/country_list/view_models/country_view_model.dart';
import 'package:country/country_list/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountryViewModel())

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),

      ),
    );
  }
}


