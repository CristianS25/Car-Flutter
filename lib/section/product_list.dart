//definimos el constructor para los objetos o productos

class ProductList{
  final String ? name;
  final String ? type;
  final int ? id;
  late final bool ? isAdd;

  ProductList({required this.name, required this.type, required this.id, required this.isAdd});
}