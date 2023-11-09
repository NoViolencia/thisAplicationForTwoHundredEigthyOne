import 'package:flutter/material.dart';
import 'package:nueva_app/services/contactos_services.dart';
import 'package:provider/provider.dart';
class ContactosUserScreen extends StatelessWidget {
  const ContactosUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactosServices=Provider.of<ContactosServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos de Usuario'),
      ),
      body: ListView.builder(
        itemCount: contactosServices.contactosResults.length,
        itemBuilder: (context, index) {
          final contactos=contactosServices.contactosResults[index];
          return ListTile(
            title: Text(contactos.nombreContacto),
            subtitle: Text(contactos.telefono),
          );
          
        },

      )
    );
  }
}