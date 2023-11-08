import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

final random = Random();

class _HomePageState extends State<HomePage> {
  int miRandomNumber = 1;
  int tuRandomNumber = 1;
  String textoBoton = 'Tira el dado';
  TextStyle estilo = TextStyle(fontSize: 25, color: Colors.amber[100]);
  int tiradas = 0;
  int empate = 0;
  int ganaM = 0;
  int ganaJ = 0;

  @override
  Widget build(BuildContext context) {
    double ancho = (MediaQuery.of(context).size.width);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: ancho,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 86, 54, 244), Color.fromARGB(255, 123, 44, 169)],
              begin: Alignment.topLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Tot: $tiradas', style: estilo),
                  Text('Maq: $ganaM', style: estilo),
                  Text('Emp: $empate', style: estilo),
                  Text('Jug: $ganaJ', style: estilo),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Máquina',
                style: estilo,
              ),
              Image.asset(
                'images/dice-$miRandomNumber.png',
                width: ancho * 0.5,
              ),
              const SizedBox(height: 40.0),
              Text(
                'Jugador',
                style: estilo,
              ),
              Image.asset(
                'images/dice-$tuRandomNumber.png',
                width: ancho * 0.5,
              ),
              const SizedBox(height: 40.0),
              Container(
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    setState(
                      () {
                        miRandomNumber = random.nextInt(6) + 1;
                        tuRandomNumber = random.nextInt(6) + 1;
                        tiradas++;
                        if (miRandomNumber == tuRandomNumber) {
                          textoBoton = 'Empate, tira de nuevo';
                          empate++;
                        } else if (miRandomNumber > tuRandomNumber) {
                          textoBoton = 'Pierdes';
                          ganaM++;
                        } else {
                          textoBoton = 'Has Ganado!';
                          ganaJ++;
                        }
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textoBoton,
                      style: estilo,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
