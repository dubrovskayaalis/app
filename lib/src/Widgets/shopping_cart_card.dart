import 'package:app/src/Model/shopping_cart_product.dart';
import 'package:flutter/material.dart';

class ShoppingCartCard extends StatefulWidget{

  final ShoppingCartProduct product;

  const ShoppingCartCard({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _ShoppingCartCardState();
}

class _ShoppingCartCardState extends State<ShoppingCartCard>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 27, 12, 12),
      ),      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            Text(
              widget.product.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600]                
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => {
                          setState(() {
                            if (widget.product.count == 1) {
                              return;
                            }
                            widget.product.count--;
                          }
                        )
                      },
                      icon: Icon(Icons.remove, size: 30,),
                      color: const Color.fromARGB(255, 255, 17, 1),
                    ),
                    Text(
                      widget.product.count.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    IconButton(
                      onPressed: () => {
                          setState(() {
                            widget.product.count++;
                          }
                        )
                      },
                      icon: Icon(Icons.add, size: 30,),
                      color: const Color.fromARGB(255, 255, 17, 1),
                    ),
                  ],
                )
              ],
            )
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.product.price}₽",
                  style: const TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.delete, size: 35,),
                  color: Colors.grey[600],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}