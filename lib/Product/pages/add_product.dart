import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_signin_example/Product/models/product.dart';
import 'package:google_signin_example/Product/providers/product_provider.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String description;
  int price;
  int stock;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Crear Producto'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
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
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Stock',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Precio',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Precio requerido';
                    }
                  },
                  onSaved: (value) => price = int.parse(value)),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.addProduct(Product(
                      name: name,
                      description: description,
                      price: price,
                      stock: stock,
                    ));
                    Navigator.pop(context);
                  }
                },
                child:
                    Text('Crear Producto', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
