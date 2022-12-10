import 'package:meta/meta.dart';
import 'dart:convert';

List<CovidModel> covidModelFromMap(String str) =>
    List<CovidModel>.from(json.decode(str).map((x) => CovidModel.fromMap(x)));

String covidModelToMap(List<CovidModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CovidModel {
  CovidModel({
    required this.infected,
    required this.tested,
    required this.recovered,
    required this.deceased,
    required this.country,
    required this.moreData,
    required this.historyData,
    required this.sourceUrl,
    required this.lastUpdatedApify,
    required this.lastUpdatedSource,
  });

  int? infected;
  dynamic? tested;
  dynamic? recovered;
  dynamic? deceased;
  String? country;
  String? moreData;
  String? historyData;
  String? sourceUrl;
  DateTime lastUpdatedApify;
  String? lastUpdatedSource;

  factory CovidModel.fromMap(Map<String, dynamic> json) => CovidModel(
        infected: json["infected"] == null ? null : json["infected"],
        tested: json["tested"],
        recovered: json["recovered"],
        deceased: json["deceased"],
        country: json["country"],
        moreData: json["moreData"],
        historyData: json["historyData"],
        sourceUrl: json["sourceUrl"] == null ? null : json["sourceUrl"],
        lastUpdatedApify: DateTime.parse(json["lastUpdatedApify"]),
        lastUpdatedSource: json["lastUpdatedSource"] == null
            ? null
            : json["lastUpdatedSource"],
      );

  Map<String, dynamic> toMap() => {
        "infected": infected == null ? null : infected,
        "tested": tested,
        "recovered": recovered,
        "deceased": deceased,
        "country": country,
        "moreData": moreData,
        "historyData": historyData,
        "sourceUrl": sourceUrl == null ? null : sourceUrl,
        "lastUpdatedApify": lastUpdatedApify.toIso8601String(),
        "lastUpdatedSource":
            lastUpdatedSource == null ? null : lastUpdatedSource,
      };
}

// enum DeceasedEnum { NA }

// final deceasedEnumValues = EnumValues({
//     "NA": DeceasedEnum.NA
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }



// class Covidmodel {
//   final int infected;
//   final String tested;
//   final int recovered;
//   final int deceased;
//   final String country;
//   final String moreData;
//   final String historyData;
//   final String sourceUrl;
//   final String lastUpdatedApify;
//   Covidmodel({
//     required this.infected,
//     required this.tested,
//     required this.recovered,
//     required this.deceased,
//     required this.country,
//     required this.moreData,
//     required this.historyData,
//     required this.sourceUrl,
//     required this.lastUpdatedApify,
//   });

//   Covidmodel copyWith({
//     int? infected,
//     String? tested,
//     int? recovered,
//     int? deceased,
//     String? country,
//     String? moreData,
//     String? historyData,
//     String? sourceUrl,
//     String? lastUpdatedApify,
//   }) {
//     return Covidmodel(
//       infected: infected ?? this.infected,
//       tested: tested ?? this.tested,
//       recovered: recovered ?? this.recovered,
//       deceased: deceased ?? this.deceased,
//       country: country ?? this.country,
//       moreData: moreData ?? this.moreData,
//       historyData: historyData ?? this.historyData,
//       sourceUrl: sourceUrl ?? this.sourceUrl,
//       lastUpdatedApify: lastUpdatedApify ?? this.lastUpdatedApify,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'infected': infected,
//       'tested': tested,
//       'recovered': recovered,
//       'deceased': deceased,
//       'country': country,
//       'moreData': moreData,
//       'historyData': historyData,
//       'sourceUrl': sourceUrl,
//       'lastUpdatedApify': lastUpdatedApify,
//     };
//   }

//   factory Covidmodel.fromMap(Map<String, dynamic> map) {
//     return Covidmodel(
//       infected: map['infected'].toInt() as int,
//       tested: map['tested'] as String,
//       recovered: map['recovered'].toInt() as int,
//       deceased: map['deceased'].toInt() as int,
//       country: map['country'] as String,
//       moreData: map['moreData'] as String,
//       historyData: map['historyData'] as String,
//       sourceUrl: map['sourceUrl'] as String,
//       lastUpdatedApify: map['lastUpdatedApify'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   // factory Covidmodel.fromJson(String source) =>
//   //     Covidmodel.fromMap(json.decode(source) as Map<String, dynamic>);

//   override
//   String toString() {
//     return 'Covidmodel(infected: $infected, tested: $tested, recovered: $recovered, deceased: $deceased, country: $country, moreData: $moreData, historyData: $historyData, sourceUrl: $sourceUrl, lastUpdatedApify: $lastUpdatedApify)';
//   }

//   override
//   bool operator ==(covariant Covidmodel other) {
//     if (identical(this, other)) return true;

//     return other.infected == infected &&
//         other.tested == tested &&
//         other.recovered == recovered &&
//         other.deceased == deceased &&
//         other.country == country &&
//         other.moreData == moreData &&
//         other.historyData == historyData &&
//         other.sourceUrl == sourceUrl &&
//         other.lastUpdatedApify == lastUpdatedApify;
//   }

//   override
//   int get hashCode {
//     return infected.hashCode ^
//         tested.hashCode ^
//         recovered.hashCode ^
//         deceased.hashCode ^
//         country.hashCode ^
//         moreData.hashCode ^
//         historyData.hashCode ^
//         sourceUrl.hashCode ^
//         lastUpdatedApify.hashCode;
//   }
// }
