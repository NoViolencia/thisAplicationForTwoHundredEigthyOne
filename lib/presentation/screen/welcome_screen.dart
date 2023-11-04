import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});

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
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
      height: size *0.35,
      width: double.infinity,
      decoration:  BoxDecoration(
        color: Colors.amber.shade700,
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
            "WELCOME",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "main person hunaj min soje ldoe lope mi mana ari mo lov",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
            customButton(
            text: "Sing In",
            color: Colors.black,
            textColor: Colors.white,
            onTap: (){
              Navigator.pushNamed(context, "/login");
            },
            ),
            const SizedBox(
              width: 30,
            ),
            customButton(
            text: "Sing Up",
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
      width: 150,
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
          fontSize: 20,
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