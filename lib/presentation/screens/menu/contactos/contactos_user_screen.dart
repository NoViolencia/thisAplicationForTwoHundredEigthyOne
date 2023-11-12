import 'package:flutter/material.dart';
import 'package:nueva_app/data/models/conactos_model.dart';
import 'package:nueva_app/presentation/screens/widget/shared/app_bar_Back_Space.dart';
import 'package:nueva_app/services/contactos_services.dart';
import 'package:provider/provider.dart';


class ContactosUserScreen extends StatelessWidget {
  final int idUser;
  const ContactosUserScreen({Key? key, required this.idUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int idUsuario = idUser;
    return Scaffold(
      appBar:const AppBarBackSpace(nombreAppBar: 'Contactos del Usuario'),

      body: _buildContactosList(context,idUsuario),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAgregarContactoModal(context,idUsuario);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContactosList(BuildContext context,int idU) {
    final contactosServices = Provider.of<ContactosServices>(context, listen: true);
    final int idUsuario = idU;

    // Llama a getContactos solo si aún no se ha cargado la lista
    if (contactosServices.contactosResults.isEmpty) {
      contactosServices.getContactos(idUsuario);
    }

    return ListView.builder(
      itemCount: contactosServices.contactosResults.length,
      itemBuilder: (context, index) {
        final contactos = contactosServices.contactosResults[index];
        return _buildContactoItem(contactos, contactosServices, context);
      },
    );
  }

  Widget _buildContactoItem(Datum contactos, ContactosServices contactosServices, BuildContext context) {
  return Card(
    child: ListTile(
      title: Text(contactos.nombreContacto),
      subtitle: Text(contactos.telefono),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon:const Icon(Icons.edit),
            onPressed: () {
              _mostrarDialogoEditar(context,contactos,contactosServices);
              // Lógica para editar el contacto
            },
          ),
          IconButton(
            icon:const  Icon(Icons.delete),
            onPressed: () {
              _mostrarDialogoEliminar(context, contactos, contactosServices);
            },
          ),
        ],
      ),
    ),
  );
}

  void _mostrarDialogoEditar(BuildContext context, Datum contactos, ContactosServices contactosServices) {
  TextEditingController nombreControllerE = TextEditingController(text: contactos.nombreContacto);
  TextEditingController numeroControllerE = TextEditingController(text: contactos.telefono);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int idUsuario = contactos.idUsuario;

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Editar Contacto',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: nombreControllerE,
                  decoration: const InputDecoration(labelText: 'Nombre del Contacto'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa el nombre del contacto.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: numeroControllerE,
                  decoration:const  InputDecoration(labelText: 'Número del Contacto'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa el número del contacto.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          bool success = await contactosServices.putContactos(nombreControllerE, numeroControllerE, contactos.idContacto, idUsuario);
                          if (success) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Contacto Editado'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            contactosServices.getContactos(idUsuario);
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: const Text('Editar Contacto'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Cerrar la hoja modal
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
  
  void _mostrarDialogoEliminar(BuildContext context, Datum contactos, ContactosServices contactosServices) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Eliminar contacto'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('¿Seguro que quieres eliminar el contacto?'),
            const SizedBox(height: 8.0),
            Text('Nombre: ${contactos.nombreContacto}'),
            Text('Número: ${contactos.telefono}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              bool success = await contactosServices.deleteContactos(contactos.idContacto, contactos.idUsuario);
              if (success) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Contacto Eliminado'),
                    duration: Duration(seconds: 2),
                  ),
                );

                // Cargar nuevamente la lista de contactos
                contactosServices.getContactos(contactos.idUsuario);
              }
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text('Eliminar'),
          ),
        ],
      );
    },
  );
}

  void _showAgregarContactoModal(BuildContext context,int idU) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController numeroController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final contactosServices = Provider.of<ContactosServices>(context,listen: false);
    final int idUsuario = idU;

    showModalBottomSheet(
      isScrollControlled: true, // Permite que el modal use todo el espacio disponible
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding:const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Agregar Contacto',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: nombreController,
                    decoration:const InputDecoration(labelText: 'Nombre del Contacto'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingresa el nombre del contacto.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: numeroController,
                    decoration:const InputDecoration(labelText: 'Número del Contacto'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingresa el número del contacto.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),


                 ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // Lógica para añadir el nuevo contacto
                      await contactosServices.postContactos(nombreController, numeroController, idUsuario);
                      // Mostrar SnackBar
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Contacto agregado'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      // Cargar nuevamente la lista de contactos
                      contactosServices.getContactos(idUsuario);

                      // ignore: use_build_context_synchronously
                      Navigator.pop(context); // Cerrar la hoja modal
                    }
                  },
                  child: const Text('Añadir Contacto'),
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