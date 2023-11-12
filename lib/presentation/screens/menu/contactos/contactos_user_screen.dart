import 'package:flutter/material.dart';
import 'package:nueva_app/data/models/conactos_model.dart';
import 'package:nueva_app/services/contactos_services.dart';
import 'package:provider/provider.dart';


class ContactosUserScreen extends StatelessWidget {
  const ContactosUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos de Usuario'),
      ),
      body: _buildContactosList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAgregarContactoModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildContactosList(BuildContext context) {
    final contactosServices = Provider.of<ContactosServices>(context, listen: true);
    const int idUsuario = 71;

    // Llama a getContactos solo si aún no se ha cargado la lista
    if (contactosServices.contactosResults.isEmpty) {
      contactosServices.getContactos(idUsuario);
    }

    return ListView.builder(
      itemCount: contactosServices.contactosResults.length,
      itemBuilder: (context, index) {
        final contactos = contactosServices.contactosResults[index];
        return _buildContactoItem(contactos);
      },
    );
  }

  Widget _buildContactoItem(Datum contactos) {
    return Card(
      child: ListTile(
        title: Text(contactos.nombreContacto),
        subtitle: Text(contactos.telefono),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Lógica para editar el contacto
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Lógica para eliminar el contacto
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAgregarContactoModal(BuildContext context) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController numeroController = TextEditingController();

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      isScrollControlled: true, // Permite que el modal use todo el espacio disponible
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Agregar Contacto',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: nombreController,
                    decoration: InputDecoration(labelText: 'Nombre del Contacto'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingresa el nombre del contacto.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: numeroController,
                    decoration: InputDecoration(labelText: 'Número del Contacto'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingresa el número del contacto.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Lógica para añadir el nuevo contacto
                        Navigator.pop(context); // Cerrar la hoja modal
                      }
                    },
                    child: Text('Añadir Contacto'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}