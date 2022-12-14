// import 'dart:convert';

// import 'package:covid_19/model/more_data_model.dart';
// import 'package:http/http.dart' as http;

// class MoreDataCovidService {
//   dynamic moreDataService;
//   MoreDataCovidService({required this.moreDataService});
//   Future<MoreDataModel> fetchDataMoreDataCovid() async {
//     // https://api.apify.com/v2/key-value-stores/OHrZyNo9BzT6xKMRD/records/LATEST?disableRedirect=true

//     // Uri uri = Uri(
//     //     scheme: 'https',
//     //     host: 'api.apify.com',
//     //     path: 'v2/key-value-stores/$moreDataService/records/LATEST',
//     //     queryParameters: {'disableRedirect': 'true'});

//     Uri uri = Uri.parse(moreDataService);
//     http.Response response = await http.get(uri);

//     if (response.statusCode == 200) {
//       MoreDataModel moreDataModel = MoreDataModel.fromJson(response.body);
//       return moreDataModel;
//     } else {
//       throw "Unable to retrieve more data";
//     }
//   }
// }
