import 'package:cached_network_image/cached_network_image.dart';
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
            Center(
                child: Column(
              children: [
                const Text(
                  "Country Flag",
                  style: TextStyle(fontSize: 30, color: Colors.grey),
                ),
                const SizedBox(height: 10,),
                CachedNetworkImage(
                  imageUrl: countryViewModel.selectedCountry!.flag_url,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          const Text(
                            "Country Name",
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                          ),
                          Text(
                            countryViewModel.selectedCountry!.name,
                            style: const TextStyle(fontSize: 20),
                          )

                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(

                      children: [
                        const Text(
                          "Country Capital",
                          style: TextStyle(fontSize: 22, color: Colors.grey),
                        ),
                        Text(
                          countryViewModel.selectedCountry!.capital,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    )

                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

              ],
            ))
          ],
        ),
      ),
    );
  }
}
