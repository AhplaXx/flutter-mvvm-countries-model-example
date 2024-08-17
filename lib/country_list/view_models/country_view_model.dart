import 'package:country/country_list/repo/api_status.dart';
import 'package:country/country_list/repo/country_services.dart';
import 'package:flutter/cupertino.dart';
import '../models/country_list_models.dart';

class CountryViewModel extends ChangeNotifier {
  bool _loading = false;
  List<Country> _countryListModel = [];
  Country? _selectedCountry;

  bool get loading => _loading;
  List<Country> get countryListModel => _countryListModel;
  Country? get selectedCountry => _selectedCountry;

  CountryViewModel() {
    _initialize();
  }

  Future<void> _initialize() async {
    await getCountries();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setCountryListModel(List<Country> countryListModel) {
    _countryListModel = countryListModel;
    notifyListeners();
  }

  setSelectedCountry(Country selectedCountry){
    _selectedCountry = selectedCountry;
    notifyListeners();
  }

  Future<void> getCountries() async {
    setLoading(true);
    var response = await CountryServices.getCountries();
    if (response is Success) {
      List<Country> countries = Country.fromJsonList(response.response as List<dynamic>);
      countries.sort((a,b) => a.name.compareTo(b.name));
      setCountryListModel(countries);
    } else if (response is Failure) {
      print("error");
    }
    setLoading(false);
  }
}
