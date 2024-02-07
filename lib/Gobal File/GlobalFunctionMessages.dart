import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';

class SuccessMessage extends StatelessWidget {
  String titleMessage;

  SuccessMessage({String? titleMessage})
      : titleMessage = titleMessage ?? "Default Title";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF108925),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 20),
              Text(
                '$titleMessage',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Country findCountryByValue(String searchValue) {
  List<Country> countries = countryList;
  String searchValueUpperCase = searchValue.toUpperCase();
  Country? foundCountry = countries.firstWhere(
    (country) =>
        country.isoCode.toUpperCase() == searchValueUpperCase ||
        country.phoneCode == searchValue ||
        country.name.toUpperCase() == searchValueUpperCase ||
        country.iso3Code.toUpperCase() == searchValueUpperCase,
    orElse: () => Country(
      isoCode: "N/A",
      phoneCode: "N/A",
      name: "Not Found",
      iso3Code: "N/A",
    ),
  );
  return foundCountry;
}
