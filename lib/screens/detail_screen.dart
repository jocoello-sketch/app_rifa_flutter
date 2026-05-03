import 'package:flutter/material.dart';
import '../models/number_model.dart';

class DetailScreen extends StatelessWidget {
  final RifaNumber numero;

  DetailScreen({required this.numero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle del número"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Número: ${numero.numero}",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              numero.reservado ? "Reservado" : "Disponible",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: numero.reservado
                  ? null
                  : () {
                      Navigator.pop(context, true);
                    },
              child: Text("Reservar"),
            ),
          ],
        ),
      ),
    );
  }
}