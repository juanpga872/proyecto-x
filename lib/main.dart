import 'package:flutter/material.dart';
import 'screens/notifications_page.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/custom_app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto X',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Para el BottomNavigationBar
  bool _isForYou = true; // Para alternar entre "Para ti" y "Siguiendo"

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    NotificationsPage(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleView(bool isForYou) {
    setState(() {
      _isForYou = isForYou;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isForYou: _isForYou,
        toggleView: _toggleView,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado del tweet
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('lib/assets/avatar.png'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Usuario $index',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '@usuario$index • 2h',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Contenido del tweet
                  Text(
                    'Este es el contenido del tuit $index.!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Imagen del tweet
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('lib/assets/img2.png', fit: BoxFit.cover, ),
                  ),
                  const SizedBox(height: 10),
                  // Barra de acciones
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.comment, color: Colors.white60),
                        onPressed: () {
                          // Acción de comentar
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.repeat, color: Colors.white60),
                        onPressed: () {
                          // Acción de retweet
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.white60),
                        onPressed: () {
                          // Acción de me gusta
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white60),
                        onPressed: () {
                          // Acción de compartir
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

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

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/assets/avatar.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nombre de Usuario',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '@usuario',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Acción de editar perfil
              },
              style: const ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
              child: Text(
                'Editar Perfil',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
