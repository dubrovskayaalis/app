import 'package:app/src/Model/shopping_cart_product.dart';

List<ShoppingCartProduct> getShoppingCartProducts(){
  return [
    ShoppingCartProduct(
      "Экспрессо First Blood",
      "https://lh3.googleusercontent.com/aida-public/AB6AXuBBcAGmbHYaGpUowjEz43_WZqPCWmqLUNarfTUrLL4l48TTAiGO18u-CgOUWZEpj-9LBcl0BItukicbimLnUz4LrrUhMrxSg2cI5oU6AzAi-IbEbbLO8eggAKnH-d1HcMCBv86G9xyqLfxJ-LVKd4Oy6BzBfFBfywc-BWxn2eBz5jLM-WPy7c61FG4ufhIms_O68csTCeJ6YhnUyER8_c1HBO0j9ySdO8fnv1fI3AJgSd1eOMP5RoIoSX1nOEbPvTnvNunbISRPtArn",
      "Классический шот",
      150,
      "Кофе",
      1
      ),
    ShoppingCartProduct(
      "Латте 'Mana Potion",
      "https://lh3.googleusercontent.com/aida-public/AB6AXuD60v1s3Ei15EmnpNAyZngDaLTr4bxdLE9Nx2zCP3TrH7I7ZJ2Drk9bJSanebk-Xs6BegRReucK0XBncfjtBDenOdJ4SortnoltPBzif7ssSOnMiGAMN90p-ovfzo__IebsDLGxgSWdabUEayp8KGf4pl9R2bQFdI7YXCkWI7HZRnk4IKxKjQJ3zV0x1-O4xP5XUMwr1c-FyP5wM6HYglE9aApUX8R3wLHT_63y57nThRcHVB9-1tIofH-b7uKAvUOTrTFYhIZSQWto",
      "Нежный и сливочный",
      250,
      "Напитки",
      2
      )
  ];
}