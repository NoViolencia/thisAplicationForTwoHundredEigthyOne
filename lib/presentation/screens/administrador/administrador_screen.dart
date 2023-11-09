import 'package:flutter/material.dart';
class AdministradorScreen extends StatelessWidget {
  const AdministradorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(
          onPressed: (){
            Navigator.pushNamed(context, '/welcome');
          }, 
          child: const Text('Eres un usuario Administrador (Click Para Salir a la Pantalla Principal)',style: TextStyle(fontSize: 22),)),
      ),
    );
  }
}