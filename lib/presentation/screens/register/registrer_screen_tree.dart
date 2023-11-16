import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nueva_app/services/registrer_post_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
class RegistrerScreenTree extends StatelessWidget {
  const RegistrerScreenTree({super.key});

  @override
  Widget build(BuildContext context) {
    final colors=Theme.of(context).colorScheme;
    //final size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
        backgroundColor:colors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
            size: 30,
          )),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pushNamed(context, '/login');
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ), 
            child:const Text('Iniciar Sesion', style:TextStyle(fontSize: 20) ),
          )
        ],

      ),
      backgroundColor: colors.primary,
        body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Regístrate ', 
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900
              ),),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Por favor Llena los siguientes campos', 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              width: double.infinity,
              height: 1800,
              //color: Colors.blue,
              decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(40) ,
                  topRight:Radius.circular(40) ,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  )
                ],
              ) ,
              child: Column(
                children: [
                  MyCustomForm(),

                ],
              ),
            ),
          ],
        ),
        ),


      );

  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  MyCustomForm({super.key});
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
enum Genero { masculino, femenino, otro }


class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  //final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController nombre = TextEditingController();
  TextEditingController apellido = TextEditingController();
  TextEditingController materno = TextEditingController();
  TextEditingController ci = TextEditingController();
  Genero selectedGenero = Genero.masculino;
  DateTime fechaNaci=DateTime.now(); // Puedes usar DateTime? para permitir nulos
  TextEditingController direccion = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController celular = TextEditingController();
  TextEditingController nomUser = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController repitPass = TextEditingController();
  bool imageSelected = false;
  DateTime? selectedDate ;
  PickedFile? selectedImage;
  TextEditingController fechaNaciController = TextEditingController();
  //PickedFile selectedImage= PickedFile('assets/perfil.jpg'); // Puedes usar PickedFile? para permitir nulos
  //late PickedFile selectedImage;
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imagenPerfil(),
            const SizedBox(height: 15),
            _generoDropdown(),
            const SizedBox(height: 15),
            FormBuilderDateTimePicker(
              name: 'fechaNac',
              inputType: InputType.date,
              format: DateFormat('yyyy-MM-dd'),
              decoration: const InputDecoration(labelText: 'Fecha de nacimiento'),
              controller: fechaNaciController,
              onChanged: (value) => setState(() {
                selectedDate=value;
              }),
                // onChanged: (DateTime value) {
                //   setState(() {
                //     selectedDate = value; // Almacena la fecha seleccionada
                //   });
                // },
            ),
            const SizedBox(height: 15),
            _nombre(nombre),
            const SizedBox(height: 15),
            _apellido(apellido),
            const SizedBox(height: 15),
            _materno(materno),
            const SizedBox(height: 15),
            _ci(ci),
            const SizedBox(height: 15),
            _direccion(direccion),
            const SizedBox(height: 15),
            _email(email),
            const SizedBox(height: 15),
            _celular(celular),
            const SizedBox(height: 15),
            _nomUser(nomUser),
            const SizedBox(height: 15),
            _pass(pass),
            const SizedBox(height: 15),
            _repitPass(repitPass, pass),
            const SizedBox(height: 15),
            _CustomButtonRegistrer(
              formKey: _formKey,
              nombre: nombre,
              apellido: apellido,
              materno: materno,
              ci: ci,
              selectedGenero: selectedGenero,
              fechaNaci: selectedDate ??DateTime.now(),
              direccion: direccion,
              email: email,
              celular: celular,
              nomUser: nomUser,
              pass: pass,
              repitPass: repitPass,
              imageSelected: imageSelected,
              selectedImage: selectedImage ?? PickedFile('assets/perfil.jpg'),
            ),
          ],
        ),
      ),
    );
  }



Widget _imagenPerfil() {
  return Column(
    children: [
      InkWell(
        onTap: () async {
          final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
          setState(() {
            if (pickedImage != null) {
              selectedImage = PickedFile(pickedImage.path);
              imageSelected = true;
            } else {
              // El usuario canceló la selección de imagen.
              // Aquí puedes manejarlo de acuerdo a tus necesidades.
            }
          });
        },
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
            image: selectedImage != null
                ? DecorationImage(
                    image: FileImage(File(selectedImage!.path)),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (selectedImage == null) // Mostrar el icono solo si no hay una imagen seleccionada
                  const Icon(
                    Icons.camera_alt,
                    size: 40,
                    color: Colors.grey,
                  ),
                if (selectedImage == null) // Mostrar el texto solo si no hay una imagen seleccionada
                  const SizedBox(height: 8),
                if (selectedImage == null) // Mostrar el texto solo si no hay una imagen seleccionada
                  const Text(
                    'Subir Imagen',
                    style: TextStyle(fontSize: 12),
                  ),
              ],
            ),
          ),
        ),
      ),
      if (selectedImage != null) const SizedBox(height: 15),
    ],
  );
}


Widget _generoDropdown() {
    return DropdownButtonFormField<Genero>(
      value: selectedGenero,
      onChanged: (Genero? value) {
        setState(() {
          selectedGenero = value!;
        });
      },
      items: const [
        DropdownMenuItem(
          value: Genero.masculino,
          child: Text('Masculino'),
        ),
        DropdownMenuItem(
          value: Genero.femenino,
          child: Text('Femenino'),
        ),
        DropdownMenuItem(
          value: Genero.otro,
          child: Text('Otro'),
        ),
      ],
      decoration:const  InputDecoration(
        labelText: 'Género',
      ),
    );
  }


  TextFormField _apellido(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Apellido Paterno',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
  TextFormField _nombre(TextEditingController val) {
    return TextFormField(
      controller: val,
      autovalidateMode: AutovalidateMode.disabled,
      validator: (value){
        if(value!.isEmpty){
          return'Este campo es obligatorio';

        }
      },
      decoration: InputDecoration(
        hintText: 'Nombre',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
  TextFormField _materno(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Apellido Materno',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
  TextFormField _ci(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Numero de Carnet',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }

  TextFormField _fechaNaci(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Fecha de Nacimiento',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
  TextFormField _direccion(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Direccion',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
  TextFormField _email(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";
        }
      },
      
      decoration: InputDecoration(
        hintText: 'Correo Electronico',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
  TextFormField _celular(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Numero de Celular',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
  TextFormField _nomUser(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Nombre de Usuario',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
  TextFormField _pass(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Contraseña',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
  TextFormField _repitPass(TextEditingController value,TextEditingController value2) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value.toString() == value2.toString()){
          return"Las Contraseñas no Coinciden";
        }
      },
      
      decoration: InputDecoration(
        hintText: 'Repetir Contraseña',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }

}

class _CustomButtonRegistrer extends StatelessWidget {
  const _CustomButtonRegistrer({
    required GlobalKey<FormState> formKey,
    required this.nombre,
    required this.apellido,
    required this.materno,
    required this.ci,
    required this.selectedGenero,
    required this.fechaNaci,
    required this.direccion,
    required this.email,
    required this.celular,
    required this.nomUser,
    required this.repitPass,
    required this.pass,
    required this.imageSelected,
    required this.selectedImage,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nombre;
  final TextEditingController apellido;
  final TextEditingController materno;
  final TextEditingController ci;
  final Genero selectedGenero;
  final DateTime fechaNaci;
  final TextEditingController direccion;
  final TextEditingController email;
  final TextEditingController celular;
  final TextEditingController nomUser;
  final TextEditingController repitPass;
  final TextEditingController pass;
  final bool imageSelected;
  final PickedFile selectedImage;


  @override
  Widget build(BuildContext context) {
    final registerServices = Provider.of<RegistrerPostServices>(context,listen: false);
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () async {
          print(selectedGenero.toString());
          if(repitPass.text.toString()== pass.text.toString()){
               bool success= await registerServices.postRegister(nombre.text.toString(),celular.text.toString(),ci.text.toString(),fechaNaci,selectedGenero.toString(),email.text.toString(),direccion.text.toString(),nomUser.text.toString(),pass.text.toString(),selectedImage,apellido.text.toString(),materno.text.toString());
               if(success){
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Contacto agregado'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, '/login');
               }
          }else{
              //   ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(
              //     content: Text('Contraseñas no Coinciden'),
              //     duration: Duration(seconds: 2),
              //   ),
              // );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )
        ),
        child:const Text('Registrarse',
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        ),
    );
  }
}