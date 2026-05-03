import 'package:flutter/material.dart';
import '../models/number_model.dart';
import 'detail_screen.dart';

class NumbersScreen extends StatefulWidget {
  @override
  _NumbersScreenState createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {

  List<RifaNumber> numeros = List.generate(
    20,
    (index) => RifaNumber(numero: index + 1),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Números de la Rifa"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: numeros.length,
        itemBuilder: (context, index) {
          final num = numeros[index];

          return GestureDetector(
            onTap: () async {
              final reservado = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(numero: num),
                ),
              );

              if (reservado == true) {
                setState(() {
                  num.reservado = true;
                });
              }
            },
            child: Card(
              color: num.reservado ? Colors.red : Colors.green,
              child: Center(
                child: Text(
                  num.numero.toString().padLeft(2, '0'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}