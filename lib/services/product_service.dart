import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/models.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = '';
  final String _user = '';
  final String _pass = '';

  List<Listado> products = [];
  Listado? SelectProduct;
  bool isLoading = true;
  bool _isEditCreate = true;

  ProductService() {
    loadProducts();
  }

  Future loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/product_list_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final productMap = Product.fromJson(response.body);
    products = productMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateProducts(Listado product) async {
    _isEditCreate = true;
    notifyListeners();
    if (product.productId == 0) {
      await createProduct(product);
    } else {
      await updateProduct(product);
    }
    _isEditCreate = false;
    notifyListeners();
  }

  Future<String> createProduct(Listado product) async {
    final url = Uri.http(_baseUrl, 'ejemplos/product_add_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final decodeResp = response.body;
    // ignore: avoid_print
    print(decodeResp);
    products.add(product);
    return '';
  }

  Future<String> updateProduct(Listado product) async {
    final url = Uri.http(_baseUrl, 'ejemplos/product_edit_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final decodeResp = response.body;
    // ignore: avoid_print
    print(decodeResp);
    //actualizar el listado
    final index = products.indexWhere(
      (element) => element.productId == product.productId,
    );
    products[index] = product;
    return '';
  }

  Future deleteProduct(Listado product, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/product_del_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final decodeResp = response.body;
    // ignore: avoid_print
    print(decodeResp);
    products.clear();
    loadProducts();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed('list_product');
    return '';
  }
}
