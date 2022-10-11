//esta el la page del carrito de compras, es decir es el view dentro de este 

import 'package:flutter/material.dart';
import 'product_list.dart';


class Car extends StatefulWidget {
  final List<ProductList> _car;

  const Car(this._car,{super.key});

  @override
  State<Car> createState() => _CarState(this._car);
}

class _CarState extends State<Car> {

  _CarState(this._car);

  List<ProductList> _car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Este es su Carrito de Compras'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
            setState(() {
              _car.length;
            });
          },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: ListView.builder(
        itemCount: _car.length,
        itemBuilder: (context, index){
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      _car[index].name.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        })
    );
  }
}
