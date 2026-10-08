import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({super.key});

  final List<Map<String, String>> products = List.generate(
    10,
    (index) => {
      'title': 'Товар ${index + 1}',
      'description': 'Описание товара ${index + 1}',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Каталог'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: Text(item['title']!),
              subtitle: Text(item['description']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MyApp3(
                      title: item['title']!,
                      description: item['description']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MyApp3 extends StatefulWidget {
  const MyApp3({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  State<MyApp3> createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  bool _isPurchased = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Icon(Icons.shopping_bag_outlined, size: 120)),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(widget.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isPurchased ? Colors.green : Colors.blue,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.green,
                  disabledForegroundColor: Colors.white,
                ),
                onPressed: _isPurchased
                    ? null
                    : () {
                        setState(() {
                          _isPurchased = true;
                        });
                      },
                icon: Icon(
                  _isPurchased ? Icons.check_circle : Icons.shopping_cart,
                ),
                label: Text(_isPurchased ? 'Куплено' : 'Купить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
