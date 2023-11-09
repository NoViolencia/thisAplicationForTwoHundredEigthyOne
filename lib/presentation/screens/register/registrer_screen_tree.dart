import 'package:flutter/material.dart';

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
              child: const Column(
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
  const MyCustomForm({super.key});
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nombre=TextEditingController();
  TextEditingController apellido=TextEditingController();
  TextEditingController materno=TextEditingController();
  TextEditingController ci=TextEditingController();
  TextEditingController genero=TextEditingController();
  TextEditingController fechaNaci=TextEditingController();
  TextEditingController direccion=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController celular=TextEditingController();
  TextEditingController nomUser=TextEditingController();
  TextEditingController pass=TextEditingController();
  TextEditingController repitPass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _nombre(nombre),
            const SizedBox(height: 15,),
            _apellido(apellido),
            const SizedBox(height: 15,),
            _materno(materno),
            const SizedBox(height: 15,),
            _ci(ci),
            const SizedBox(height: 15,),
            _genero(genero),
            const SizedBox(height: 15,),
            _fechaNaci(fechaNaci),
            const SizedBox(height: 15,),
            _direccion(direccion),
            const SizedBox(height: 15,),
            _email(email),
            const SizedBox(height: 15,),
            _celular(celular),
            const SizedBox(height: 15,),
            _nomUser(nomUser),
            const SizedBox(height: 15,),
            _pass(pass),
            const SizedBox(height: 15,),
            _repitPass(repitPass,pass),
            const SizedBox(height: 15,),
            _CustomButtonRegistrer(formKey: _formKey, nombre: nombre, apellido: apellido),
          ],
        ),
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
  TextFormField _genero(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Genero',
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
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nombre;
  final TextEditingController apellido;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: (){
          if(_formKey.currentState!.validate()){
            print('Inicio de sesion exitoso');
            print(nombre.text);
            print(apellido.text);

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