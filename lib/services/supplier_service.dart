import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/models.dart';

class SupplierService extends ChangeNotifier {
  final String _baseUrl = "143.198.118.203:8100";
  final String _user = "test";
  final String _pass = "test2023";

  List<ListadoProveedores> suppliers = [];
  ListadoProveedores? SelectSupplier;
  bool isLoading = true;
  bool _isEditCreate = true;

  SupplierService() {
    loadSuppliers();
  }

  Future loadSuppliers() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/provider_list_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final supplierMap = Supplier.fromJson(response.body);
    suppliers = supplierMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateSuppliers(ListadoProveedores supplier) async {
    _isEditCreate = true;
    notifyListeners();
    String result = '';
    if (supplier.supplierId == 0) {
      result = await createSupplier(supplier);
    } else {
      result = await updateSupplier(supplier);
    }
    _isEditCreate = false;
    notifyListeners();
    return result;
  }

  Future<String> createSupplier(ListadoProveedores supplier) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_add_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: supplier.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final decodeResp = json.decode(response.body);
    if (response.statusCode == 200 && decodeResp['MSJ'] == 'Proveedor creado') {
      suppliers.add(supplier);
      return decodeResp['MSJ'];
    } else {
      return 'error';
    }
  }

  Future<String> updateSupplier(ListadoProveedores supplier) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_edit_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: supplier.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final decodeResp = json.decode(response.body);
      if (decodeResp['MSJ'] == 'Proveedor editado') {
        // Actualizar el provider en la lista local
        final index = suppliers.indexWhere(
          (element) => element.supplierId == supplier.supplierId,
        );
        if (index != -1) {
          suppliers[index] = supplier;
        }
        return decodeResp['MSJ'];
      }
    }
    return 'error';
  }

  Future deleteSupplier(
    ListadoProveedores supplier,
    BuildContext context,
  ) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_del_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: supplier.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      suppliers.removeWhere((item) => item.supplierId == supplier.supplierId);
      return true;
    } else {
      return false;
    }
  }
}
