import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class Recipe {
  final String title;
  final String imageUrl;
  final double priceRupees; // Price in rupees

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.priceRupees,
  });
}

class CartItem {
  final Recipe recipe;
  int quantity;

  CartItem(this.recipe, {this.quantity = 1});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Recommendations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipePage(),
    );
  }
}

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  TextEditingController _controller = TextEditingController();
  List<Recipe> _recommendedRecipes = [];
  List<CartItem> _cartItems = [];

  Future<void> _fetchRecipes(String query) async {
    final apiKey = '0beec132b30c45acb4c622c9e50094c8';
    final url =
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&query=$query';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final recipes = data['results'] as List<dynamic>;

      setState(() {
        _recommendedRecipes = recipes.map((recipe) {
          return Recipe(
            title: recipe['title'],
            imageUrl: recipe['image'],
            priceRupees: (Random().nextInt(20) + 5.0) *
                75.0, // Random price between 5 and 25 in rupees
          );
        }).toList();
      });
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  void _addToCart(Recipe recipe) {
    final existingItem = _cartItems.firstWhere(
      (item) => item.recipe.title == recipe.title,
      orElse: () => CartItem(recipe),
    );

    setState(() {
      if (_cartItems.contains(existingItem)) {
        existingItem.quantity++;
      } else {
        _cartItems.add(existingItem);
      }
    });
  }

  void _removeFromCart(CartItem cartItem) {
    setState(() {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
      } else {
        _cartItems.remove(cartItem);
      }
    });
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in _cartItems) {
      total += item.recipe.priceRupees * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Recommendations'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter your preferred ingredient or cuisine',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _fetchRecipes(_controller.text);
              },
              child: Text('Get Recommendations'),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: _recommendedRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = _recommendedRecipes[index];
                  return ListTile(
                    leading: Image.network(recipe.imageUrl),
                    title: Text(recipe.title),
                    subtitle: Text(
                        'Price: ₹${recipe.priceRupees.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        _addToCart(recipe);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Shopping Cart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = _cartItems[index];
                  return ListTile(
                    leading: Image.network(cartItem.recipe.imageUrl),
                    title: Text(cartItem.recipe.title),
                    subtitle: Text('Quantity: ${cartItem.quantity}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_shopping_cart),
                      onPressed: () {
                        _removeFromCart(cartItem);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Total Price: ₹${getTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement payment logic here
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
