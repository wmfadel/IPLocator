import 'package:flutter/material.dart';
import 'package:ip_locator/data_provider.dart';
import 'package:ip_locator/details_page.dart';
import 'package:ip_locator/ip_banner.dart';
import 'package:ip_locator/search_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final String routeName = '/';
  final TextEditingController _ipTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IPBanner(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _ipTextController,
                maxLines: 1,
                minLines: 1,
                keyboardType: TextInputType.number,
                enabled: true,
                decoration: InputDecoration(
                  hintText: 'Search for IP ...',
                  labelText: 'Search for IP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                toolbarOptions: ToolbarOptions(
                  copy: true,
                  cut: true,
                  paste: true,
                  selectAll: true,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer(
              builder:
                  (BuildContext context, DataProvider provider, Widget child) {
                return provider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : GestureDetector(
                        onTap: () async {
                          final ip = _ipTextController.text.trim();
                          bool status = await provider.getIPData(ip);
                          if (status) {
                            _ipTextController.text='';
                            Navigator.of(context).pushNamed(DetailsPage.routeName);
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'cannot find data for ip: $ip',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.blueAccent,
                              duration: Duration(seconds: 1),
                            ));
                          }
                        },
                        child: SearchButton());
              },
            )
          ],
        ),
      ),
    );
  }
}

// 156.208.156.109
