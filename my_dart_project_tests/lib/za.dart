// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pizza {
  late int id;
  late String name;
  late final double price ;
  Pizza(){
    id = 1;
    name = 'Pizza';
    price = 10.0;
  }


  String printPizza(){ 
    print('coocking pizza');
    return 'Pizza id: $id, name: $name, price: $price';
  }
}
