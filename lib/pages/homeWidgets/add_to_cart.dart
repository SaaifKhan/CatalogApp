
import 'package:app_catalog/models/cart.dart';
import 'package:app_catalog/models/catalog.dart';
import 'package:app_catalog/widgets/Theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:velocity_x/src/extensions/bool_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
class AddToCart extends StatefulWidget {
  final  Item catalog;

  const AddToCart({Key? key, required this.catalog}) : super(key: key);




  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog)??false;
    return ElevatedButton(
      onPressed: () {
        if(!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();

          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {

          });
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.darkBlue,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart? Icon(Icons.done): Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
