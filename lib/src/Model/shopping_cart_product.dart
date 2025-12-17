import 'package:app/src/Model/product.dart';

class ShoppingCartProduct extends Product{
  int count;

  ShoppingCartProduct(
    super.name,
    super.image, 
    super.description, 
    super.price, 
    super.category,
    this.count
  );
}