import 'package:flutter/material.dart';
// Carpeta para las pantallas (Home, Perfil, etc.)



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Número de publicaciones
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/avatar.png'), // Avatar de usuario
            ),
            title: Text('Usuario #$index'),
            subtitle: Text('Este es el contenido del tuit $index'),
            trailing: Icon(Icons.favorite_border),
            onTap: () {
              // Acción al hacer clic en el tuit
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Ítem seleccionado
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          // Cambiar de pantalla (puedes implementar la navegación aquí)
        },
      ),
    );
  }
}

