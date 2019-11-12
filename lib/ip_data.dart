class IPData {
  String ip;
  String type;
  String continent;
  String country;
  String countryFlag;
  String countryCapital;
  String countryPhone;
  String region;
  String city;
  String latitude;
  String longitude;
  String asn;
  String org;
  String isp;
  String timezone;
  String timezoneName;
  String timezoneGmt;
  String currency;
  String currencyCode;
  String currencySymbol;
  String currencyRates;
  String currencyPlural;

  IPData(
      {this.ip,
      this.type,
      this.continent,
      this.country,
      this.countryCapital,
      this.countryPhone,
      this.region,
      this.city,
      this.latitude,
      this.longitude,
      this.asn,
      this.org,
      this.isp,
      this.timezone,
      this.timezoneName,
      this.timezoneGmt,
      this.currency,
      this.currencyCode,
      this.currencySymbol,
      this.currencyRates,
      this.currencyPlural});

  IPData.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    type = json['type'];
    continent = json['continent'];
    country = json['country'];
    countryCapital = json['country_capital'];
    countryPhone = json['country_phone'];
    region = json['region'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    asn = json['asn'];
    org = json['org'];
    isp = json['isp'];
    timezone = json['timezone'];
    timezoneName = json['timezone_name'];
    timezoneGmt = json['timezone_gmt'];
    currency = json['currency'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    currencyRates = json['currency_rates'];
    currencyPlural = json['currency_plural'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ip'] = this.ip;
    data['type'] = this.type;
    data['continent'] = this.continent;
    data['country'] = this.country;
    data['country_capital'] = this.countryCapital;
    data['country_phone'] = this.countryPhone;
    data['region'] = this.region;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['asn'] = this.asn;
    data['org'] = this.org;
    data['isp'] = this.isp;
    data['timezone'] = this.timezone;
    data['timezone_name'] = this.timezoneName;
    data['timezone_gmt'] = this.timezoneGmt;
    data['currency'] = this.currency;
    data['currency_code'] = this.currencyCode;
    data['currency_symbol'] = this.currencySymbol;
    data['currency_rates'] = this.currencyRates;
    data['currency_plural'] = this.currencyPlural;
    return data;
  }
}