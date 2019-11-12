import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.white,
        elevation: 20,
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 150,
          height: 40,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  child: Text(
                'Go',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
              )),
              Container(
                width: 50,
                height: 40,
                color: Colors.blueAccent,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
