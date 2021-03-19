import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_signin_example/Product/models/product.dart';
import 'package:google_signin_example/Product/services/products_api.dart';

import '../../locator.dart';

import 'dart:async';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  ProductsAPI _productsApi = locator<ProductsAPI>();

  List<Product> products;

  Future<List<Product>> fetchProducts() async {
    var result = await _productsApi.getDataCollection();
    products =
        result.docs.map((doc) => Product.fromMap(doc.data(), doc.id)).toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _productsApi.streamDataCollection();
  }

  Future<Product> getProductById(String id) async {
    var doc = await _productsApi.getDocumentById(id);
    return Product.fromMap(doc.data(), doc.id);
  }

  Future removeProduct(String id) async {
    await _productsApi.removeDocument(id);
    return;
  }

  Future updateProduct(Product data, String id) async {
    await _productsApi.updateDocument(data.toJson(), id);
    return;
  }

  Future addProduct(Product data) async {
    var result = await _productsApi.addDocument(data.toJson());

    return;
  }
}
