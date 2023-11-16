import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _customBody(),
    );
  }
}

class _customBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size.height;
    return Column(
      children: [
        _animationWidget(size: size),
        _welcomeWidget(size: size),
      ],
    );
  }
}

class _welcomeWidget extends StatelessWidget {
  const _welcomeWidget({
    required this.size,
  });
  final double size;
  @override
  Widget build(BuildContext context) {
    final colors=Theme.of(context).colorScheme;
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      height: size *0.35,
      width: double.infinity,
      decoration:  BoxDecoration(
        color: colors.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "BIENVENIDO",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Por favor, inicie sesion o registrese",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
            customButton(
            text: "Iniciar Sesion",
            color: Colors.black,
            textColor: Colors.white,
            onTap: (){
              //Navigator.pushNamed(context, "/login");
              Navigator.pushReplacementNamed(context, '/login');
            },
            ),
            const SizedBox(
              width: 10,
            ),
            customButton(
            text: "Registrarse",
            color: Colors.white,
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, "/register");
            },
            ),
            ],
          ),

        ],
      ),
    );
  }
}

class customButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function()? onTap;
  const customButton({
    super.key, required this.text, required this.color, required this.textColor, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap, 
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)))
        ),
        child: Text(
          text,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        ),
        ),
    );
  }
}

class _animationWidget extends StatelessWidget {
  const _animationWidget({
    required this.size,
  });
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size *0.65,
      width: double.infinity,
      //color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical:70),
            child: Lottie.asset('assets/animations/animation1.json'),
          ),
          const Text("NO VIOLENCIA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
          ),
          const Text("I N F - 2 8 1",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 35,
          ),
          ),
        ],
      ),
    );
  }
}