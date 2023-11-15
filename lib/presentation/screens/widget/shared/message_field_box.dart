import 'package:flutter/material.dart';
import 'package:nueva_app/services/comentario_post.dart';
import 'package:provider/provider.dart';
class MessageFieldBox extends StatelessWidget {
  final int indice;
  final int user;
  const MessageFieldBox({
    super.key, 
    required this.indice,
    required this.user
    });

  @override
  Widget build(BuildContext context) {
    final comentarioServices = Provider.of<ComentarioPostServices>(context,listen: false);
    final textController=TextEditingController();
    final focusNone=FocusNode();
    final outlinedInputBorder=UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );
    final inputDecoration=InputDecoration(
        hintText: 'Agregar Comentario...',
        enabledBorder: outlinedInputBorder,
        focusedBorder: outlinedInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () async{
            //final textvalue=textController.value.text;
                    if (textController.value.text.isNotEmpty) {
                         //         print('valor ingresado: $textvalue');
                      // Lógica para añadir el nuevo contacto
                      await comentarioServices.postComentarios(textController,indice , user);
                      // Mostrar SnackBar
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Comentario agregado'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context); // Cerrar la hoja modal
                    }

            textController.clear();
          },
           icon: const Icon(Icons.send))
      );
    return TextFormField(
      onTapOutside: (event) {
        focusNone.unfocus();
      },
      focusNode: focusNone,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        //print('sumit $value');
        textController.clear();
        focusNone.requestFocus();
      },
    );
  }
}