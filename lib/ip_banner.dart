import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ip_locator/data_provider.dart';
import 'package:provider/provider.dart';

class IPBanner extends StatelessWidget {
  const IPBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, DataProvider provider, Widget child) {
      return Material(
        elevation: 10,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Your IP: ',
                style: Theme.of(context).textTheme.body1,
              ),
              FutureBuilder(
                future: provider.getUserIP(),
                builder: (BuildContext context, results) {
                  if (results.connectionState == ConnectionState.done &&
                      results.hasData) {
                    return SelectableText(results.data);
                  } else {
                    return Text('.............');
                  }
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.content_copy,
                  color: Colors.blueAccent,
                  size: 25,
                ),
                tooltip: 'Copy',
                onPressed: () {
                  provider.getUserIP().then((String ip) {
                    Clipboard.setData(
                      ClipboardData(text: ip),
                    );
                    Scaffold.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.blueAccent,
                      content: Text(
                        'Your IP is copied to Clipboard',
                        style: TextStyle(color: Colors.white),
                      ),
                      duration: Duration(seconds: 2),
                    ));
                  });
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
