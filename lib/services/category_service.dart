import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/models.dart';

class CategoryService extends ChangeNotifier {
  final String _baseUrl = "143.198.118.203:8100";
  final String _user = "test";
  final String _pass = "test2023";

  List<ListadoCategorias> categories = [];
  ListadoCategorias? SelectCategory;
  bool isLoading = true;
  bool _isEditCreate = true;

  CategoryService() {
    loadCategories();
  }

  Future loadCategories() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/category_list_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final categoryMap = Category.fromJson(response.body);
    categories = categoryMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateCategories(ListadoCategorias category) async {
    _isEditCreate = true;
    notifyListeners();
    String result = '';
    if (category.categoryId == 0) {
      print(category.categoryId);
      result = await createCategory(category);
    } else {
      print(category.categoryId);
      result = await updateCategory(category);
    }
    _isEditCreate = false;
    notifyListeners();
    return result;
  }

  Future<String> createCategory(ListadoCategorias category) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_add_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    print(category.toJson());
    final response = await http.post(
      url,
      body: category.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final decodeResp = json.decode(response.body);
    print("-----------------------------");
    print(decodeResp);
    print(response.statusCode);
    print(decodeResp['MSJ']);
    print("-----------------------------");
    if (response.statusCode == 200 && decodeResp['MSJ'] == 'Categoria creada') {
      print("Entré al if");
      categories.add(category);
      return decodeResp['MSJ'];
    } else {
      print("Estoy en el else");
      return 'error';
    }
  }

  Future<String> updateCategory(ListadoCategorias category) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_edit_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: category.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final decodeResp = json.decode(response.body);
      print("-----------------------------");
      print(decodeResp);
      print(response.statusCode);
      print(decodeResp['MSJ']);
      print("-----------------------------");
      if (decodeResp['MSJ'] == 'Categoria creada') {
        // Actualizar el provider en la lista local
        final index = categories.indexWhere(
          (element) => element.categoryId == category.categoryId,
        );
        if (index != -1) {
          categories[index] = category;
        }
        return decodeResp['MSJ'];
      }
    }
    return 'error';
  }

  Future deleteCategory(
    ListadoCategorias category,
    BuildContext context,
  ) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_del_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: category.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      categories.removeWhere((item) => item.categoryId == category.categoryId);
      return true;
    } else {
      return false;
    }
  }
}
