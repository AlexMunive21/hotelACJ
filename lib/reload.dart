import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Simulación de datos iniciales
  List<String> data = ["Item 1", "Item 2", "Item 3"];

  // Función que simula recargar los datos
  Future<void> reload() async {
    await Future.delayed(Duration(seconds: 2)); // Simula una demora (ej: llamada API)
    setState(() {
      data = ["Item A", "Item B", "Item C"]; // Nuevos datos recargados
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recarga Automática'),
      ),
      body: RefreshIndicator(
        onRefresh: reload, // Llama al método reload al realizar un "pull to refresh"
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reload, // Llama al método reload al presionar el botón
        child: Icon(Icons.refresh),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
