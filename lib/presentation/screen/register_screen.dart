import 'package:flutter/material.dart';
class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nombre=TextEditingController();
    TextEditingController apellido=TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();


    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
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
      backgroundColor: Colors.cyan,
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
              height: size.height*1,
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
                  Form(
                   key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                      child: Column(
                        children: [
                          _nombre(nombre),
                          const SizedBox(
                            height: 15,
                          ),
                          _apellido(apellido),
                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                            padding:const EdgeInsets.symmetric(horizontal: 30),
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
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
                          ),
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
      
      
          ],
      
        ),
      ),
    );
  }

    _apellido(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Apellido',
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
}