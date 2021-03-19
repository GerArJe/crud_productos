import 'package:flutter/material.dart';
import 'package:google_signin_example/Product/models/product.dart';
import 'package:google_signin_example/Product/pages/update_product.dart';
import 'package:google_signin_example/Product/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product productDetails;

  ProductCard({@required this.productDetails,});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        productDetails.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Precio:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            fontStyle: FontStyle.normal),
                      ),
                      Text(
                        '${productDetails.price} \$',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Disponible:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            fontStyle: FontStyle.normal),
                      ),
                      Text(
                        '${productDetails.stock}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        productDetails.description,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 22,
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        iconSize: 35,
                        icon: Icon(Icons.delete_forever),
                        color: Colors.red,
                        onPressed: () async {
                          await productProvider.removeProduct(productDetails.id);
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        iconSize: 35,
                        icon: Icon(Icons.edit),
                        color: Colors.orange,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => UpdateProduct(
                                        product: productDetails,
                                      )));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
