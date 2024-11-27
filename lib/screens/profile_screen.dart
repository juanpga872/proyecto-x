import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto X',
      theme: ThemeData.dark().copyWith(  // Usamos el tema oscuro
        primaryColor: Colors.black,  // Fondo oscuro para la app
        scaffoldBackgroundColor: Colors.black,  // Fondo oscuro para la pantalla
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,  // Color de la AppBar en oscuro
          iconTheme: IconThemeData(color: Colors.white),  // Íconos blancos en la AppBar
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,  // Fondo negro para el BottomNavigationBar
          selectedItemColor: Colors.blue,  // Color azul para el ítem seleccionado
          unselectedItemColor: Colors.white,  // Color blanco para los ítems no seleccionados
        ),
      ),
      darkTheme: ThemeData.dark(),  // Activar tema oscuro globalmente
      themeMode: ThemeMode.dark,  // Asegurarnos de que la app use el modo oscuro
      home: HomeScreen(),  // Pantalla inicial
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Ítem seleccionado

  // Lista de pantallas que se mostrarán según el índice
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),  // Pantalla de inicio
    SearchPage(),  // Pantalla de búsqueda
    NotificationsPage(),  // Pantalla de notificaciones
    ProfileScreen(),  // Pantalla de perfil
  ];

  // Esta función se llama cuando el usuario selecciona un ítem del BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Actualiza el índice
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda (puedes implementar lo que desees)
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),  // Muestra la pantalla según el índice
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,  // Muestra el índice seleccionado
        onTap: _onItemTapped,  // Cambia de pantalla cuando se selecciona un ítem
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
      ),
    );
  }
}

// Pantalla de inicio (HomePage)
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // Número de publicaciones
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/avatar.png'), // Avatar de usuario
            ),
            title: Text('Usuario #$index', style: TextStyle(color: Colors.white)),  // Texto blanco
            subtitle: Text('Este es el contenido del tuit $index', style: TextStyle(color: Colors.white60)),  // Texto blanco opaco
            trailing: Icon(Icons.favorite_border, color: Colors.white),  // Íconos blancos
            onTap: () {
              // Acción al hacer clic en el tuit
            },
          );
        },
      ),
    );
  }
}

// Pantalla de búsqueda (SearchPage)
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pantalla de búsqueda',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

// Pantalla de notificaciones (NotificationsPage)
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pantalla de notificaciones',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

// Pantalla de perfil (ProfileScreen)
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pantalla de perfil',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

