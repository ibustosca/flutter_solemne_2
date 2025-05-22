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
    //print(response.body);
    final productMap = Product.fromJson(response.body);
    products = productMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateProducts(Listado product) async {
    _isEditCreate = true;
    notifyListeners();
    String result = '';
    if (product.productId == 0) {
      print(product.productId);
      result = await createProduct(product);
    } else {
      print(product.productId);
      result = await updateProduct(product);
    }
    _isEditCreate = false;
    notifyListeners();
    return result;
  }

  Future<String> createProduct(Listado product) async {
    final url = Uri.http(_baseUrl, 'ejemplos/product_add_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    print(product.toJson());
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final decodeResp = json.decode(response.body);
    if (response.statusCode == 200 && decodeResp['MSJ'] == 'creado') {
      products.add(product);
      return decodeResp['MSJ'];
    } else {
      return 'error';
    }
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
    if (response.statusCode == 200) {
      final decodeResp = json.decode(response.body);
      if (decodeResp['MSJ'] == 'creado') {
        // Actualizar el producto en la lista local
        final index = products.indexWhere(
          (element) => element.productId == product.productId,
        );
        if (index != -1) {
          products[index] = product;
        }
        return decodeResp['MSJ'];
      }
    }
    return 'error';
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
    if (response.statusCode == 200) {
      products.removeWhere((item) => item.productId == product.productId);
      return true;
    } else {
      return false;
    }
  }
}
