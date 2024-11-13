import 'package:flutter/material.dart';
import 'package:principal/user_screen.dart';
import 'habitacion_screen.dart';
import 'eventos_screen.dart';
import 'actividades_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool) toggleDarkMode;
  final bool isDarkMode;

  HomeScreen({required this.toggleDarkMode, required this.isDarkMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
  }

  final List<Widget> _screens = [
    HabitacionScreen(),
    EventosScreen(),
    ActividadesScreen(),
  ];

  final List<String> _titles = [
    'Habitaciones',
    'Eventos',
    'Actividades',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[850] : Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Usuario'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.checklist_rounded),
              title: Text('Mis reservaciones'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ajustes'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Modo oscuro'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                  widget.toggleDarkMode(value);
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar sesión'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.hotel),
            label: 'Habitaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Eventos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Actividades',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: isDarkMode ? Colors.white : Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
