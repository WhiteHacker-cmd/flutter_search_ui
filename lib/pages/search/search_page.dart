import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_search_ui/services/search_service.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> searchResult = [];

  searchDjango(value) async {
    SearchService.searchDjangoApi(value).then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      setState(() {
        data.forEach((element) {
          searchResult.add(element);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Django Api Search"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                searchResult.clear();
                searchDjango(val);
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 25.00),
                  hintText: "Search Here",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: null,
                  )),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: searchResult.length,
            itemBuilder: (BuildContext context, int index) {
              return buildResultCard(searchResult[index]);
            },
          )
        ],
      ),
    );
  }
}

Widget buildResultCard(data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        ListTile(
          title: Text(data['name']),
          subtitle: Text(data['price'].toString()),
        ),
        Divider(
          color: Colors.black,
        )
      ],
    ),
  );
}
