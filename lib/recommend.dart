import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class Recipe {
  final String title;
  final String imageUrl;

  Recipe({
    required this.title,
    required this.imageUrl,
  });
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
          print(recipe['vegetarian']);
          return Recipe(
            title: recipe['title'],
            imageUrl: recipe['image'],
          );
        }).toList();
      });
    } else {
      throw Exception('Failed to load recipes');
    }
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
                print(_controller.text);
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
