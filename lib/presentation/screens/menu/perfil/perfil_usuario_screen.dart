import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nueva_app/data/models/usuario_normal_model.dart';
import 'package:nueva_app/presentation/screens/widget/shared/app_bar_Back_Space.dart';
import 'package:nueva_app/services/perfil_services.dart';
import 'package:nueva_app/services/usuario_normal_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PerfilUsuarioScreen extends StatelessWidget {
  final int idUser;
  const PerfilUsuarioScreen({Key? key, required this.idUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int idUsuario = idUser;
    //final int idUsuario = 71;
    final usuariosNormalesServices = Provider.of<UsuarioNormalServices>(context, listen: false);

    return Scaffold(
      appBar: const AppBarBackSpace(nombreAppBar: 'Perfil de Usuario'),
      body: FutureBuilder<bool>(
        future: usuariosNormalesServices.getUsuarioNormal(idUsuario),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == true) {
            final user = usuariosNormalesServices.usuarioNormalResult;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(user.usuario.imagenPerfil),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.transparent,
                        ),
                      ),
                      CircleAvatar(
                        radius: 110,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(user.usuario.imagenPerfil),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: () {
                            _showImagePicker(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DATOS PERSONALES',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildProfileInfo('Correo', user.usuario.correo),
                          _buildProfileInfo('Nombre de usuario', user.usuario.nombreUsuario),
                          _buildProfileInfo('Telefono', user.usuario.telefono),
                          _buildProfileInfo('Carnet', user.usuario.ci),
                          _buildProfileInfo('Nombre completo', user.usuario.nombre),
                          _buildProfileInfo('Dirección', user.usuario.direccion),
                          _buildProfileInfo('Género', user.usuario.genero),
                          _buildProfileInfo('Fecha de nacimiento', user.usuario.fechaNac.toString()),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _showEditForm(context, user);
                    },
                    child: const Text('Editar Datos'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Hubo un problema al obtener los datos del usuario.'));
          }
        },
      ),
    );
  }

  Widget _buildProfileInfo(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value ?? 'N/A',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

void _showEditForm(BuildContext context, Data user) {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController nombreUsuarioController = TextEditingController(text: user.usuario.nombreUsuario);
  final TextEditingController telefonoController = TextEditingController(text: user.usuario.telefono);
  final TextEditingController ciController = TextEditingController(text: user.usuario.ci);
  final TextEditingController nombreCompletoController = TextEditingController(text: user.usuario.nombre);
  final TextEditingController direccionController = TextEditingController(text: user.usuario.direccion);
  final TextEditingController generoController = TextEditingController(text: user.usuario.genero);
  final perfilServices = Provider.of<PerfilServices>(context, listen: false);
  final usuariosNormalesServices = Provider.of<UsuarioNormalServices>(context, listen: false);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Editar Datos'),
        content: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //_buildEditFormField('Correo', user.usuario.correo),
                _buildEditFormField('Nombre de usuario', nombreUsuarioController),
                _buildEditFormField('Telefono', telefonoController),
                _buildEditFormField('Carnet', ciController),
                _buildEditFormField('Nombre Completo', nombreCompletoController),
                _buildEditFormField('Dirección', direccionController),
                _buildEditFormField('Género', generoController),
                FormBuilderDateTimePicker(
                  name: 'fechaNac',
                  initialValue: user.usuario.fechaNac,
                  inputType: InputType.date,
                  format: DateFormat('yyyy-MM-dd'),
                  decoration: const InputDecoration(labelText: 'Fecha de nacimiento'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.saveAndValidate()) {
// Obtén los valores directamente de los controladores
                Map<String, dynamic> formData = _formKey.currentState!.value;
                DateTime fechaNac = formData['fechaNac'] as DateTime;
                DateTime soloFecha = DateTime(fechaNac.year, fechaNac.month, fechaNac.day);
                String nombre = nombreCompletoController.text ; 
                String telefono = telefonoController.text ;
                String ci = ciController.text ;
                String genero = generoController.text ;
                String direccion = direccionController.text ;
                String nombreUsuario = nombreUsuarioController.text ;
                String contrasenia = user.usuario.contrasenia;
                dynamic imagen = user.usuario.imagenPerfil;
                bool success = await perfilServices.putPerfil(
                  nombre,
                  telefono,
                  ci,
                  soloFecha,
                  genero,
                  direccion,
                  nombreUsuario,
                  contrasenia,
                  imagen,
                  user.idUsuario,
                );
                if (success) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Usuario Editado'),
                      duration: Duration(seconds: 4),
                    ),
                  );
                  usuariosNormalesServices.getUsuarioNormal(user.idUsuario);
                  // ignore: use_build_context_synchronously
                  //Navigator.of(context).pop();
                  // ignore: use_build_context_synchronously
                  Navigator.push(context,MaterialPageRoute(builder: (context) => PerfilUsuarioScreen(idUser:user.idUsuario),),);
                }
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      );
    },
  );
}

Widget _buildEditFormField(String key, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: key),
    ),
  );
}

  void _showImagePicker(BuildContext context) async {

  }
}