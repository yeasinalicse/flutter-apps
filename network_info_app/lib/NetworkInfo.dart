class NetworkInfo {
  final String? ip;
  final int? ipDecimal;
  final String? country;
  final String? countryIso;
  final bool? countryEu;
  final String? regionName;
  final String? regionCode;
  final String? zipCode;
  final String? city;
  final double? latitude;
  final double? longitude;
  final String? timeZone;
  final String? asn;
  final String? asnOrg;
  final UserAgent? userAgent;

  NetworkInfo({
    this.ip,
    this.ipDecimal,
    this.country,
    this.countryIso,
    this.countryEu,
    this.regionName,
    this.regionCode,
    this.zipCode,
    this.city,
    this.latitude,
    this.longitude,
    this.timeZone,
    this.asn,
    this.asnOrg,
    this.userAgent,
  });

  NetworkInfo.fromJson(Map<String, dynamic> json)
      : ip = json['ip'] as String?,
        ipDecimal = json['ip_decimal'] as int?,
        country = json['country'] as String?,
        countryIso = json['country_iso'] as String?,
        countryEu = json['country_eu'] as bool?,
        regionName = json['region_name'] as String?,
        regionCode = json['region_code'] as String?,
        zipCode = json['zip_code'] as String?,
        city = json['city'] as String?,
        latitude = json['latitude'] as double?,
        longitude = json['longitude'] as double?,
        timeZone = json['time_zone'] as String?,
        asn = json['asn'] as String?,
        asnOrg = json['asn_org'] as String?,
        userAgent = (json['user_agent'] as Map<String,dynamic>?) != null ? UserAgent.fromJson(json['user_agent'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'ip' : ip,
    'ip_decimal' : ipDecimal,
    'country' : country,
    'country_iso' : countryIso,
    'country_eu' : countryEu,
    'region_name' : regionName,
    'region_code' : regionCode,
    'zip_code' : zipCode,
    'city' : city,
    'latitude' : latitude,
    'longitude' : longitude,
    'time_zone' : timeZone,
    'asn' : asn,
    'asn_org' : asnOrg,
    'user_agent' : userAgent?.toJson()
  };
}

class UserAgent {
  final String? product;
  final String? version;
  final String? comment;
  final String? rawValue;

  UserAgent({
    this.product,
    this.version,
    this.comment,
    this.rawValue,
  });

  UserAgent.fromJson(Map<String, dynamic> json)
      : product = json['product'] as String?,
        version = json['version'] as String?,
        comment = json['comment'] as String?,
        rawValue = json['raw_value'] as String?;

  Map<String, dynamic> toJson() => {
    'product' : product,
    'version' : version,
    'comment' : comment,
    'raw_value' : rawValue
  };
}