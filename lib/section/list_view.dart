import 'package:flutter/material.dart';
import 'car_view.dart';
import 'product_list.dart';

class ViewList extends StatefulWidget {
  const ViewList({Key? key}) : super(key: key);

  @override
  State<ViewList> createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {

  final String person = 'Caballero, Dama';

//arreglo de la lista de objetos
  List<ProductList> _list = <ProductList>[];
  //arreglo de la lista de objetos que hay en el carro
  final List<ProductList> _carList = <ProductList>[];

  //se utiliza para
  @override
  void initState(){
    super.initState();
    _products();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas de Productos'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Car(_carList)));
          },
              icon: const Icon(Icons.shopping_cart))
        ],

      ),
      //necesitamos un istView.builder para crear la lista de objetos
      body: ListView.builder(
        //toma la cantidad de objetos que hay en venta
          itemCount: _list.length,
          //creamos los objetos
          itemBuilder: (context, index){
            //retornamos cards
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  //alineamos el widget en direccion al centro
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              _list[index].name.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ),
                          IconButton(
                            //definimos una accion al cliquear
                              onPressed: (){
                                //le definimos un estado al objeto
                                setState(() {

                                  if (_list[index].isAdd!){
                                    _carList.removeWhere((element) => element.id == index);
                                    _list[index].isAdd = false;
                                  }else{
                                    _carList.add(_list[index]);
                                    _list[index].isAdd = true;
                                  }
                                });
                              },
                              icon: const Icon(Icons.add),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
      ),
    );
  }

  void _products(){
    var list = <ProductList>[
      ProductList(name: 'Medias', type: person,id: 1, isAdd: false),
      ProductList(name: 'Zapatillas Deportivas', type: person, id: 2, isAdd: false),
      ProductList(name: 'Zapato Formal', type: person, id: 3, isAdd: false),
      ProductList(name: 'Chaquetas', type: person,id: 4, isAdd: false),
    ];
    setState(() {
      _list = list;
    });
  }
}
