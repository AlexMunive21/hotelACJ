import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final String userName = "Juan Pérez";
  final String userLastName = "González";
  final String userEmail = "juan.perez@example.com";
  final String userPhone = "+52 123 456 7890";
  final String userPhoto = "assets/user_photo.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil de Usuario"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(userPhoto),
            ),
            SizedBox(height: 20),
            Text(
              "$userName $userLastName",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Correo: $userEmail"),
            SizedBox(height: 10),
            Text("Teléfono: $userPhone"),
          ],
        ),
      ),
    );
  }
}
