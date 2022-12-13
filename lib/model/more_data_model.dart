import 'dart:convert';

class MoreDataModel {
  final int infected;
  final int deceased;
  final List<InfectedByRegion> infectedByRegion;
  final String country;
  final String moreData;
  final String historyData;
  final String SOURCE_URL;
  final String lastUpdatedAtApify;
  final String readMe;
  MoreDataModel({
    required this.infected,
    required this.deceased,
    required this.infectedByRegion,
    required this.country,
    required this.moreData,
    required this.historyData,
    required this.SOURCE_URL,
    required this.lastUpdatedAtApify,
    required this.readMe,
  });

  MoreDataModel copyWith({
    int? infected,
    int? deceased,
    List<InfectedByRegion>? infectedByRegion,
    String? country,
    String? moreData,
    String? historyData,
    String? SOURCE_URL,
    String? lastUpdatedAtApify,
    String? readMe,
  }) {
    return MoreDataModel(
      infected: infected ?? this.infected,
      deceased: deceased ?? this.deceased,
      infectedByRegion: infectedByRegion ?? this.infectedByRegion,
      country: country ?? this.country,
      moreData: moreData ?? this.moreData,
      historyData: historyData ?? this.historyData,
      SOURCE_URL: SOURCE_URL ?? this.SOURCE_URL,
      lastUpdatedAtApify: lastUpdatedAtApify ?? this.lastUpdatedAtApify,
      readMe: readMe ?? this.readMe,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'infected': infected,
      'deceased': deceased,
      'infectedByRegion': infectedByRegion.map((x) => x.toMap()).toList(),
      'country': country,
      'moreData': moreData,
      'historyData': historyData,
      'SOURCE_URL': SOURCE_URL,
      'lastUpdatedAtApify': lastUpdatedAtApify,
      'readMe': readMe,
    };
  }

  factory MoreDataModel.fromMap(Map<String, dynamic> map) {
    return MoreDataModel(
      infected: map['infected'].toInt() as int,
      deceased: map['deceased'].toInt() as int,
      infectedByRegion: List<InfectedByRegion>.from(
        (map['infectedByRegion'] as List<dynamic>).map<InfectedByRegion>(
          (x) => InfectedByRegion.fromMap(x as Map<String, dynamic>),
        ),
      ),
      country: map['country'] as String,
      moreData: map['moreData'] as String,
      historyData: map['historyData'] as String,
      SOURCE_URL: map['SOURCE_URL'] as String,
      lastUpdatedAtApify: map['lastUpdatedAtApify'] as String,
      readMe: map['readMe'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoreDataModel.fromJson(String source) =>
      MoreDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MoreDataModel(infected: $infected, deceased: $deceased, infectedByRegion: $infectedByRegion, country: $country, moreData: $moreData, historyData: $historyData, SOURCE_URL: $SOURCE_URL, lastUpdatedAtApify: $lastUpdatedAtApify, readMe: $readMe)';
  }

  @override
  int get hashCode {
    return infected.hashCode ^
        deceased.hashCode ^
        infectedByRegion.hashCode ^
        country.hashCode ^
        moreData.hashCode ^
        historyData.hashCode ^
        SOURCE_URL.hashCode ^
        lastUpdatedAtApify.hashCode ^
        readMe.hashCode;
  }
}

class InfectedByRegion {
  final String region;
  final int infectedCount;
  final int deceasedCount;
  InfectedByRegion({
    required this.region,
    required this.infectedCount,
    required this.deceasedCount,
  });

  InfectedByRegion copyWith({
    String? region,
    int? infectedCount,
    int? deceasedCount,
  }) {
    return InfectedByRegion(
      region: region ?? this.region,
      infectedCount: infectedCount ?? this.infectedCount,
      deceasedCount: deceasedCount ?? this.deceasedCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'region': region,
      'infectedCount': infectedCount,
      'deceasedCount': deceasedCount,
    };
  }

  factory InfectedByRegion.fromMap(Map<String, dynamic> map) {
    return InfectedByRegion(
      region: map['region'] as String,
      infectedCount: map['infectedCount'].toInt() as int,
      deceasedCount: map['deceasedCount'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfectedByRegion.fromJson(String source) =>
      InfectedByRegion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'InfectedByRegion(region: $region, infectedCount: $infectedCount, deceasedCount: $deceasedCount)';

  @override
  bool operator ==(covariant InfectedByRegion other) {
    if (identical(this, other)) return true;

    return other.region == region &&
        other.infectedCount == infectedCount &&
        other.deceasedCount == deceasedCount;
  }

  @override
  int get hashCode =>
      region.hashCode ^ infectedCount.hashCode ^ deceasedCount.hashCode;
}
