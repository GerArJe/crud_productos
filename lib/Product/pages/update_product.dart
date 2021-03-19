import 'package:flutter/material.dart';
import 'package:google_signin_example/Product/models/product.dart';
import 'package:google_signin_example/Product/providers/product_provider.dart';
import 'package:provider/provider.dart';

class UpdateProduct extends StatefulWidget {
  final Product product;

  UpdateProduct({@required this.product});

  @override
  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final _formKey = GlobalKey<FormState>();

  String name;
  String description;
  int price;
  int stock;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar Producto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: widget.product.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nombre',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nombre requerido';
                    }
                  },
                  onSaved: (value) => name = value),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  initialValue: widget.product.description,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Descripción',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Descripción requerido';
                    }
                  },
                  onSaved: (value) => description = value),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  initialValue: widget.product.stock.toString(),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Stock',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Stock requerido';
                    }
                  },
                  onSaved: (value) => stock = int.parse(value)),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  initialValue: widget.product.price.toString(),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Precio',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Precio requerido';
                    }
                  },
                  onSaved: (value) => price = int.parse(value) ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.updateProduct(
                        Product(
                          name: name,
                          price: price,
                          description: description,
                          stock: stock,
                        ),
                        widget.product.id);
                    Navigator.pop(context);
                  }
                },
                child: Text('Actualizar Producto',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
