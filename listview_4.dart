import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Screen')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(child: ListTile(title: Text('Noor ul Huda'))), // Name Card
          Card(
            child: Image.asset(
              'assets/my_picture.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ), // Profile Picture
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items:
                [
                  'assets/image1.jpg',
                  'assets/image2.jpg',
                  'assets/image3.jpg',
                ].map((img) => Image.asset(img, fit: BoxFit.cover)).toList(),
          ), // Swipeable Images
        ],
      ),
    );
  }
}
