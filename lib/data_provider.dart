import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ip_locator/ip_data.dart';
import 'package:wifi/wifi.dart';

class DataProvider with ChangeNotifier {
  String _ip;
  IPData _ipData;
  bool isLoading = false;
  Future<String> getUserIP() async {
    if (_ip == null) _ip = await Wifi.ip;
    return _ip;
  }

  IPData get iPData => _ipData;

  Future<bool> getIPData(String ip) async {
    final String url = 'http://free.ipwhois.io/json/$ip';
    isLoading = true;
    notifyListeners();
    http.Response response = await http.get(url);
    Map<String, dynamic> res = json.decode(response.body);
    if (res['success'] &&
        res.containsKey('continent') &&
        ['continent'] != null) {
      _ipData = IPData.fromJson(res);
      print(_ipData.toString());
      isLoading = false;
      notifyListeners();
      return true;
    }
    isLoading = false;
    notifyListeners();
    return false;
  }
}
