import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


import '../view_models/country_view_model.dart';

class CountryDetailPage extends StatefulWidget {
  const CountryDetailPage({super.key});

  @override
  State<CountryDetailPage> createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {

  @override
  Widget build(BuildContext context) {
    String indep;

    CountryViewModel countryViewModel = context.watch<CountryViewModel>();
    int population = countryViewModel.selectedCountry!.population;
    String formattedPopulation = NumberFormat("#,###").format(population);


    if(countryViewModel.selectedCountry!.independent == true){
      indep = "Yes";
    }else{
      indep = "No";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(countryViewModel.selectedCountry!.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Column(
              children: [

                const SizedBox(height: 10,),
                CachedNetworkImage(
                  imageUrl: countryViewModel.selectedCountry!.flag_url,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row (
                 children: [
                   const Text("Country Name: ",style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.normal),),
                   SizedBox(width: 244,child: Text(countryViewModel.selectedCountry!.name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))

                 ],
               ),
                const SizedBox(height: 8,),
                Row (
                  children: [
                    const Text("Country Capital: ",style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.normal),),
                    Text(countryViewModel.selectedCountry!.capital,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                  ],
                ),
                const SizedBox(height: 8,),
                Row (
                  children: [

                    const Text("Is Country Independent?: ",style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.normal),),
                    Text(indep,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                  ],
                ),
                const SizedBox(height: 8,),
                Row (
                  children: [

                  const  Text("Population?: ",style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.normal),),
                    Text(formattedPopulation,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                  ],
                ),
               const  SizedBox(height: 8,),
                Row (
                  children: [

                    const Text("Currency: ",style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.normal),),
                    SizedBox(width: 280,child: Text(countryViewModel.selectedCountry!.currencyName,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))

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
