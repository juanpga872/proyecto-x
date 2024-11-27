import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 15, // Número de notificaciones
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/notification_icon.png'), // Ícono de notificación
            ),
            title: Text(
              'Notificación #$index',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Este es el detalle de la notificación $index',
              style: TextStyle(color: Colors.white60),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.white70),
            onTap: () {
              // Acción al seleccionar una notificación
            },
          );
        },
      ),
    );
  }
}
