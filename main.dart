import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Listing")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: const <Widget>[
          ProductBox(
            name: "iPhone",
            description: "iPhone is the stylish phone ever",
            price: 1000,
            image: "iphone.png",
          ),
          ProductBox(
            name: "Pixel",
            description: "Pixel is the most featureful phone ever",
            price: 800,
            image: "pixel.png",
          ),
          ProductBox(
            name: "Laptop",
            description: "Laptop is most productive development tool",
            price: 2000,
            image: "laptop.png",
          ),
          ProductBox(
            name: "Tablet",
            description: "Tablet is the most useful device ever for meeting",
            price: 1500,
            image: "tablet.png",
          ),
          ProductBox(
            name: "Pendrive",
            description: "Pendrive is a portable storage device",
            price: 100,
            image: "pendrive.png",
          ),
          ProductBox(
            name: "Floppy Drive",
            description: "Floppy Drive is a legacy storage device",
            price: 20,
            image: "floppy.png",
          ),
          ProductBox(
            name: "Smartwatch",
            description: "Smartwatch is the future of wearable technology",
            price: 300,
            image: "smartwatch.png",
          ),
          ProductBox(
            name: "Bluetooth Speaker",
            description: "Bluetooth Speaker for your entertainment needs",
            price: 150,
            image: "speaker.png",
          ),
        ],
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _size = 20;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        5,
        (index) => Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: Icon(
              index < _rating ? Icons.star : Icons.star_border,
              size: _size,
            ),
            color: Colors.purple[100],
            onPressed: () => _setRating(index + 1),
            iconSize: _size,
          ),
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 100, // Specify the width of the image
              height: 100, // Specify the height of the image
              child: Image.asset("assets/appimages/$image"),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(description),
                    Text("Price: \$ $price"),
                    RatingBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

