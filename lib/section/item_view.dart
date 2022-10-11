import 'package:flutter/material.dart';


class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Producto'),
        actions: [
          IconButton(onPressed: (){
            /*Navigator.push(context, MaterialPageRoute(builder: (context) => Car()));*/
          },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const Text('Detalles del producto')
        ],
      ),
    );
  }
}
