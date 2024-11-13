import 'package:flutter/material.dart';

class ActividadesScreen extends StatefulWidget {
  @override
  _ActividadesScreenState createState() => _ActividadesScreenState();
}

class _ActividadesScreenState extends State<ActividadesScreen> {
  final List<Map<String, String>> actividades = [
    {
      'nombre': 'Clase de Yoga',
      'descripcion': 'Yoga en la terraza con vista al mar.',
      'horario': '7:00 AM - 8:00 AM',
    },
    {
      'nombre': 'Tour de Bicicleta',
      'descripcion': 'Recorrido por los alrededores del hotel.',
      'horario': '10:00 AM - 12:00 PM',
    },
    {
      'nombre': 'Cata de Vinos',
      'descripcion': 'Sesión de cata de vinos locales.',
      'horario': '6:00 PM - 8:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: actividades.length,
          itemBuilder: (context, index) {
            final actividad = actividades[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  actividad['nombre']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descripción: ${actividad['descripcion']}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Text(
                      'Horario: ${actividad['horario']}',
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
                          title: Text('Actividad Registrada'),
                          content: Text(
                              'Te has registrado para la actividad: ${actividad['nombre']}'),
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
                  child: Text('Registrar'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
