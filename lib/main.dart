import 'package:flutter/material.dart';
import 'package:ip_locator/data_provider.dart';
import 'package:ip_locator/details_page.dart';
import 'package:provider/provider.dart';

import 'package:ip_locator/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          DetailsPage.routeName: (context) => DetailsPage(),
        },
      ),
    );
  }
}
