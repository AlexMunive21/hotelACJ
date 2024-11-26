import 'package:flutter/material.dart';

class EventosScreen extends StatefulWidget {
  @override
  _EventosScreenState createState() => _EventosScreenState();
}

class _EventosScreenState extends State<EventosScreen> {
  final List<Map<String, String>> eventos = [
    {
      'nombre': 'Conferencia Anual',
      'descripcion': 'Evento de negocios con invitados internacionales.',
      'fecha': '15 de Marzo, 2024',
    },
    {
      'nombre': 'Cena de Gala',
      'descripcion': 'Evento formal con música en vivo.',
      'fecha': '20 de Abril, 2024',
    },
    {
      'nombre': 'Taller de Fotografía',
      'descripcion': 'Aprende los fundamentos de la fotografía.',
      'fecha': '5 de Mayo, 2024',
    },
    {
  'nombre': 'Clase de Yoga al Aire Libre',
  'descripcion': 'Relájate y conecta con la naturaleza en esta clase especial.',
  'fecha': '12 de Junio, 2024',
  },
  {
  'nombre': 'Concierto de Jazz',
  'descripcion': 'Disfruta de una velada mágica con música de jazz en vivo.',
  'fecha': '25 de Julio, 2024',
  },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: eventos.length,
          itemBuilder: (context, index) {
            final evento = eventos[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  evento['nombre']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descripción: ${evento['descripcion']}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Text(
                      'Fecha: ${evento['fecha']}',
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
                          title: Text('Evento Registrado'),
                          content: Text(
                              'Te has registrado para el evento: ${evento['nombre']}'),
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
