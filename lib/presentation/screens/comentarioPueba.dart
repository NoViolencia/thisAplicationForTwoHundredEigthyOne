import 'package:flutter/material.dart';
import 'package:nueva_app/services/comentario_services.dart';
import 'package:provider/provider.dart';

class ComentarioScreen extends StatelessWidget {
const ComentarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final comentarioServices = Provider.of<ComentarioServices>(context, listen: false);
    comentarioServices.getComentarios(19); // Llama a getComentarios con el idRec

    return Scaffold(
      appBar: AppBar(
        title: Text(comentarioServices.comentarioResults.length.toString()),
      ),
      body: Consumer<ComentarioServices>(
        builder: (context, comentarioServices, child) {
          return ListView.builder(
            itemCount: comentarioServices.comentarioResults.length,
            itemBuilder: (context, index) {
              print(comentarioServices.comentarioResults.length);
              final comentario = comentarioServices.comentarioResults[index];
              return ListTile(
                title: Text(comentario.descripcion),
                subtitle: Text(comentario.idUsuario.toString()),
              );
            },
          );
        },
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:nueva_app/services/comentario_services.dart';
// import 'package:provider/provider.dart';
// class ComentarioScreen extends StatelessWidget {
//   const ComentarioScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final comentarioServices=Provider.of<ComentarioServices>(context);
//     comentarioServices.getComentarios(18);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Comentario!'),
//       ),
//       body: ListView.builder(
//         itemCount: comentarioServices.comentarioResults.length,
//         itemBuilder: (context, index) {
//           print(comentarioServices.comentarioResults.length);
//           final comentario=comentarioServices.comentarioResults[index];
//           return ListTile(
//             title: Text(comentario.descripcion),
//             subtitle: Text(comentario.idUsuario.toString()),
//           );
//         },
//         ),
//     );
//   }
// }