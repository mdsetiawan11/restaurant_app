import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/pages/restaurant_detail.dart';
import 'package:restaurant_app/widgets/restaurant_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List _items = [];
  List searchData = [];
  TextEditingController textEditingController = new TextEditingController();

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/local_restaurant.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["restaurants"];
      print("..number of items ${_items.length}");
    });
  }

  onSearchTextChanged(String text) async {
    searchData.clear();
    if (text.isEmpty) {
      // Check textfield is empty or not
      setState(() {});
      return;
    }
    for (var data in _items) {
      if (data['name']
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase().toString())) {
        searchData.add(
            data); // If not empty then add search data into search data list
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Restaurant'),
            SizedBox(
              width: 5,
            ),
            Text(
              'App',
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: TextField(
                  controller: textEditingController,
                  onChanged: onSearchTextChanged,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search restaurant',
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.deepPurple),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: searchData
                        .isEmpty // Check SearchData list is empty or not if empty then show full data else show search data
                    ? ListView.builder(
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RestaurantDetail(
                                  pictureId: _items[index]["pictureId"],
                                  name: _items[index]["name"],
                                  city: _items[index]["city"],
                                  rating: _items[index]["rating"].toString(),
                                  description: _items[index]["description"],
                                  foods: _items[index]["menus"]["foods"],
                                  drinks: _items[index]["menus"]["drinks"],
                                );
                              }));
                            },
                            child: RestaurantCard(
                                pictureId: _items[index]["pictureId"],
                                name: _items[index]["name"],
                                city: _items[index]["city"],
                                rating: _items[index]["rating"].toString()),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: searchData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: RestaurantCard(
                                pictureId: searchData[index]["pictureId"],
                                name: searchData[index]["name"],
                                city: searchData[index]["city"],
                                rating: searchData[index]["rating"].toString()),
                          );
                        },
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
