import 'package:flutter/material.dart';
import 'package:nueva_app/services/denuncia_usuario_services.dart';
import 'package:provider/provider.dart';

class DenunciaUsuarioScreen extends StatefulWidget {
  const DenunciaUsuarioScreen({Key? key}) : super(key: key);

  @override
  DenunciaUsuarioScreenState createState() => DenunciaUsuarioScreenState();
}

class DenunciaUsuarioScreenState extends State<DenunciaUsuarioScreen> {
  late DenunciaUsuarioServices denunciaUsuarioServices;
  final int userID = 49;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtener el servicio de DenunciaUsuarioServices
    denunciaUsuarioServices = Provider.of<DenunciaUsuarioServices>(context);
    // Llama a getDenuncia solo si aún no se han cargado los datos
    if (denunciaUsuarioServices.denunciaResults.isEmpty) {
      denunciaUsuarioServices.getDenuncia(userID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Denuncia User'),
      ),
      body: FutureBuilder(
        // Utiliza el método future para evitar la llamada duplicada
        future: Future.value(denunciaUsuarioServices.denunciaResults),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Puedes seguir utilizando ListView.builder con los datos ya cargados
            return ListView.builder(
              itemCount: denunciaUsuarioServices.denunciaResults.length,
              itemBuilder: (context, index) {
                final denunciaU = denunciaUsuarioServices.denunciaResults[index];
                return ListTile(
                  title: Text(denunciaU.nombreAgresor),
                  subtitle: Text(denunciaU.nombreVictima),
                );
              },
            );
          }
        },
      ),
    );
  }
}