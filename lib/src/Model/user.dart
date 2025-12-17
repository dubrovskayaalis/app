import 'package:app/src/Model/product.dart';

class User {
  String nick;
  String firstName;
  String lastNane;
  String phoneNumber;
  String email;
  Product loveProduct;
  int points;
  int cupOfCoffe;
  int password;

  User(this.nick, this.firstName, this.lastNane, this.phoneNumber, this.email, this.loveProduct, this.points, this.cupOfCoffe, this.password);
}