import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ClothingListScreen(),
    );
  }
}

class ClothingListScreen extends StatelessWidget {
  final List<ClothingItem> clothingItems = [
    ClothingItem(
      name: 'LFC Nike Mens 24/25 Home Match Jersey',
      imageUrl: 'assets/images/home_kit.jpg',
      description: 'Official LFC Nike Men\'s 24/25 Home Match Jersey.',
      price: 89.99,
    ),
    ClothingItem(
      name: 'LFC Nike Mens 24/25 Home Match Shorts',
      imageUrl: 'assets/images/shorts.jpg',
      description: 'Official LFC Nike Men\'s 24/25 Home Match Shorts.',
      price: 39.99,
    ),
    ClothingItem(
      name: 'LFC Nike 24/25 Home Socks',
      imageUrl: 'assets/images/socks.jpg',
      description: 'Comfortable LFC Nike 24/25 Home Socks.',
      price: 19.99,
    ),
    ClothingItem(
      name: 'LFC Womens Rain Jacket Black',
      imageUrl: 'assets/images/jackets.jpg',
      description: 'LFC Women\'s Rain Jacket in Black.',
      price: 59.99,
    ),
    ClothingItem(
      name: 'LFCW Adults Crest Hoody Red',
      imageUrl: 'assets/images/hoodie.jpg',
      description: 'Official LFCW Adults Crest Hoody in Red.',
      price: 49.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('186061'),
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClothingDetailScreen(item: item),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(item.imageUrl, height: 100, width: 80, fit: BoxFit.cover),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            item.description,
                            style: TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ClothingItem {
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  ClothingItem({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}

class ClothingDetailScreen extends StatelessWidget {
  final ClothingItem item;

  ClothingDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(item.imageUrl),
            SizedBox(height: 10),
            Text(item.name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('Price: \$${item.price.toStringAsFixed(2)}'),
            SizedBox(height: 10),
            Text(item.description),
          ],
        ),
      ),
    );
  }
}
