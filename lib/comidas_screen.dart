import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComidasScreen extends StatefulWidget {
  @override
  _ComidasScreenState createState() => _ComidasScreenState();
}

class _ComidasScreenState extends State<ComidasScreen> {
  List<Meal> _meals = [];

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'));

    if (response.statusCode == 200) {
      final List mealsJson = json.decode(response.body)['meals'];
      setState(() {
        _meals = mealsJson.map((json) => Meal.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comidas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _meals.length,
          itemBuilder: (context, index) {
            final meal = _meals[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    meal.thumbnail,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  meal.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Aquí podrías mostrar un mensaje de confirmación, similar a HabitacionScreen
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Comida seleccionada'),
                          content: Text(
                              'Has seleccionado el platillo: ${meal.name}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Seleccionar'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Meal {
  final String name;
  final String thumbnail;

  Meal({required this.name, required this.thumbnail});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
    );
  }
}
