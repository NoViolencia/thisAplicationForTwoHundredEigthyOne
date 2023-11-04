import 'package:flutter/material.dart';
class loginScreen extends StatelessWidget {
const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final _formKey= GlobalKey<FormState>();
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent.shade700,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
          size: 30,
        )),
        actions: [
          TextButton(onPressed: (){
            Navigator.pushNamed(context, '/register');
          },
           style: TextButton.styleFrom(
            foregroundColor: Colors.black,
           ),
           child: const Text('REGISTRO'))
        ],
      ),
      backgroundColor: Colors.cyan,
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Iniciar Sesion',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
                ),
            ),
              const SizedBox(
                height: 15,
              ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'bienvenidos a mi aplicacion contra la lucha de la violencia de genero',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: size.height*1,
              width: double.infinity,
              decoration:const  BoxDecoration(
                color: Color.fromARGB(255, 53, 214, 21),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft:Radius.circular(30),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 30,
                  )
                ],
              ),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 50),
                      child: Column(
                        children: [
                        _email(email),
                        const SizedBox(
                          height: 20,
                        ),
                         _password(password),
                         const SizedBox(
                          height: 45,
                         ),
                         Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          width:double.infinity,
                           child: ElevatedButton(onPressed: (){
                            if(_formKey.currentState!.validate()){
                              print('inincio de sesion actia');
                              print(email.text);
                              print(password.text);

                            }
                           },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                              )
                            ),
                            child: const Text('Iniciar Sesion',
                            style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold
                            ),
                            ),
                            ),
                         )
                      ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  TextFormField _password(TextEditingController val) {
    return TextFormField(
      controller: val,
      // validator: (value){
      //   if(value!.isEmpty){
      //     return "este campo es obligatorio";
      //   }
      // },
      decoration: InputDecoration(
        hintText: 'Contraseña',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }

  TextFormField _email(TextEditingController val) {
    return TextFormField(
      controller: val,
      // validator: (value){
      //   if(value!.isEmpty){
      //     return "este campo es obligatorio";
      //   }
      // },
      decoration: InputDecoration(
        hintText: 'Correo Electronico',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}