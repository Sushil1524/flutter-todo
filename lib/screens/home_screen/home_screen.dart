import 'package:flutter/material.dart';

import 'text_data.dart';
import 'image_data.dart';

import '../settings_screen/settings_screen.dart';

import 'package:todo/models/product.dart';

var products = Product.getProducts();
var product = products.first;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void tapped() {
    debugPrint("Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App UI"),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          debugPrint("Tapped item: $index");
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: "Locations",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.sailing), label: "Sailing"),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          ImageData(url: "assets/images/poster.jpg"),
          TextData(title: product.name, body: product.description),
          TextData(
            title: "Poster for Wallpaper",
            body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966",
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              child: Text("Go to Settings"),
            ),
          ),
        ],
      ),
      // drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.create),
      ),
    );
  }
}
