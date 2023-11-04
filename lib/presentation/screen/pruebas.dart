import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Navegación'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navegar a la pantalla de detalle cuando se selecciona un elemento
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PantallaDetalle(index),
                ),
              );
            },
            child: Card(
              child: Center(
                child: Text('Elemento $index'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PantallaDetalle extends StatelessWidget {
  final int index;

  PantallaDetalle(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Elemento $index'),
      ),
      body: Center(
        child: Text('Contenido del Elemento $index'),
      ),
    );
  }
}
