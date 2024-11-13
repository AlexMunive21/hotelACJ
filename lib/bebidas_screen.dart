import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BebidasScreen extends StatefulWidget {
  @override
  _BebidasScreenState createState() => _BebidasScreenState();
}

class _BebidasScreenState extends State<BebidasScreen> {
  List<Drink> _drinks = [];

  @override
  void initState() {
    super.initState();
    fetchDrinks();
  }

  Future<void> fetchDrinks() async {
    final response = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'));

    if (response.statusCode == 200) {
      final List drinksJson = json.decode(response.body)['drinks'];
      setState(() {
        _drinks = drinksJson.map((json) => Drink.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load drinks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bebidas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _drinks.length,
          itemBuilder: (context, index) {
            final drink = _drinks[index];
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
                    drink.thumbnail,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  drink.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Aquí podrías mostrar un mensaje de confirmación, como en HabitacionScreen
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Bebida seleccionada'),
                          content:
                              Text('Has seleccionado la bebida: ${drink.name}'),
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

class Drink {
  final String name;
  final String thumbnail;

  Drink({required this.name, required this.thumbnail});

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      name: json['strDrink'],
      thumbnail: json['strDrinkThumb'],
    );
  }
}
