import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ip_locator/data_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  static final String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer(builder:
            (BuildContext context, DataProvider provider, Widget child) {
          print(provider.iPData.countryFlag);
          return Stack(
            children: <Widget>[
              Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.45,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                        double.parse(provider.iPData.latitude),
                        double.parse(provider.iPData.longitude),
                      ),
                      zoom: 14),
                ),
              ),
          
              ListView(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQuery.size.height * 0.35,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    elevation: 20,
                    color: Colors.white,
                    child: Container(
                      width: mediaQuery.size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20),
                            DataRow(label: 'IP', value: provider.iPData.ip),
                            DataRow(label: 'type', value: provider.iPData.type),
                            DataRow(label: 'ISP', value: provider.iPData.isp),
                            DataRow(label: 'ORG', value: provider.iPData.org),
                            DataRow(label: 'asn', value: provider.iPData.asn),
                            DataRow(
                                label: 'country',
                                value: provider.iPData.country),
                            DataRow(
                                label: 'country phone',
                                value: provider.iPData.countryPhone),
                            DataRow(
                                label: 'continent',
                                value: provider.iPData.continent),
                            DataRow(
                                label: 'region', value: provider.iPData.region),
                            DataRow(label: 'city', value: provider.iPData.city),
                            DataRow(
                                label: 'Time_Zone',
                                value: provider.iPData.timezone),
                            DataRow(
                                label: 'Tome-Zone Name',
                                value: provider.iPData.timezoneName),
                            DataRow(
                                label: 'timezone_gmt',
                                value: provider.iPData.timezoneGmt),
                            DataRow(
                                label: 'currency',
                                value: provider.iPData.currency),
                            DataRow(
                                label: 'currency code',
                                value: provider.iPData.currencyCode),
                            DataRow(
                                label: '"currency symbol',
                                value: provider.iPData.currencySymbol),
                            DataRow(
                                label: 'currency rates',
                                value: provider.iPData.currencyRates),
                            DataRow(
                                label: 'currency plural',
                                value: provider.iPData.currencyPlural),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ])
            ],
          );
        }));
  }
}

class DataRow extends StatelessWidget {
  final String label, value;
  const DataRow({Key key, @required this.label, @required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 156.208.156.109
