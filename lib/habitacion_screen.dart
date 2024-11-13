import 'package:flutter/material.dart';

class HabitacionScreen extends StatefulWidget {
  @override
  _HabitacionScreenState createState() => _HabitacionScreenState();
}

class _HabitacionScreenState extends State<HabitacionScreen> {
  final List<Map<String, String>> habitaciones = [
    {
      'nombre': 'Habitación Individual',
      'tipo': 'Económica',
      'precio': '\$50 por noche',
    },
    {
      'nombre': 'Habitación Doble',
      'tipo': 'Estándar',
      'precio': '\$80 por noche',
    },
    {
      'nombre': 'Habitación Suite',
      'tipo': 'Lujo',
      'precio': '\$150 por noche',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: habitaciones.length,
          itemBuilder: (context, index) {
            final habitacion = habitaciones[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  habitacion['nombre']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tipo: ${habitacion['tipo']}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Text(
                      'Precio: ${habitacion['precio']}',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Reserva confirmada'),
                          content:
                              Text('Has reservado la ${habitacion['nombre']}'),
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
                  child: Text('Reservar'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
