import 'package:app/src/Model/shopping_cart_product.dart';
import 'package:app/src/ViewModel/shopping_cart_vm.dart';
import 'package:app/src/Widgets/shopping_cart_card.dart';
import 'package:flutter/material.dart';

class ListShoppingCart extends StatelessWidget{
  final List<ShoppingCartProduct>? products = getShoppingCartProducts();
  
  ListShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index){
        return SizedBox(height: 10);
      },
      itemCount: products!.length,
      itemBuilder: (BuildContext context, int index){
          return ShoppingCartCard(product: products![index]);
      }
    );
  }
}