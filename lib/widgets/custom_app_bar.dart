import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isForYou;
  final Function(bool) toggleView;

  const CustomAppBar({
    Key? key,
    required this.isForYou,
    required this.toggleView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Ícono a la izquierda
          Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          // Logo centrado
          const Text(
            'X',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Ícono a la derecha
          IconButton(
            icon: const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onPressed: () {
              // Acción del botón
            },
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => toggleView(true),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Para ti',
                    style: TextStyle(
                      color: isForYou ? Colors.white : Colors.grey,
                      fontWeight: isForYou ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (isForYou)
                    const SizedBox(
                      height: 3,
                      width: 30,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => toggleView(false),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Siguiendo',
                    style: TextStyle(
                      color: !isForYou ? Colors.white : Colors.grey,
                      fontWeight: !isForYou ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (!isForYou)
                    const SizedBox(
                      height: 3,
                      width: 30,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
