import 'package:flutter/material.dart';
class FormFieldBox extends StatelessWidget {
  const FormFieldBox({super.key});


  @override
  Widget build(BuildContext context) {
    final textController=TextEditingController();
    final focusNone=FocusNode();
    final outlinedInputBorder=UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );
    final inputDecoration=InputDecoration(
        hintText: 'Agrega un Comentario...',
        enabledBorder: outlinedInputBorder,
        focusedBorder: outlinedInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: (){
            final textvalue=textController.value.text;
            print('valor ingresado: $textvalue');
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
        print('sumit $value');
        textController.clear();
        focusNone.requestFocus();
      },
    );
  }
}