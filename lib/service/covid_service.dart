import 'dart:convert';

import 'package:covid_19/model/covid_model.dart';
import 'package:http/http.dart' as http;

class CovidService {
  Future<List<CovidModel>> fetchCovidData() async {
    // https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true
    Uri uri = Uri(
        scheme: 'https',
        host: 'api.apify.com',
        path: 'v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST',
        queryParameters: {'disableRedirect': 'true'});

    http.Response response =
        await http.get(uri).catchError((error) => print(error));

    List result = json.decode(response.body) as List;
    List<CovidModel> covidModelList =
        result.map((e) => CovidModel.fromMap(e)).toList();

    if (response.statusCode == 200) {
      return covidModelList;
    } else {
      throw 'Error';
    }
  }
}
