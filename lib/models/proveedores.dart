import 'dart:convert';

class Supplier {
  Supplier({required this.listado});

  List<ListadoProveedores> listado;

  factory Supplier.fromJson(String str) => Supplier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Supplier.fromMap(Map<String, dynamic> json) => Supplier(
    listado: List<ListadoProveedores>.from(
      json["Proveedores Listado"].map((x) => ListadoProveedores.fromMap(x)),
    ),
  );

  Map<String, dynamic> toMap() => {
    "Proveedores Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
  };
}

class ListadoProveedores {
  ListadoProveedores({
    required this.supplierId,
    required this.supplierName,
    required this.supplierLastName,
    required this.supplierMail,
    required this.supplierState,
  });

  int supplierId;
  String supplierName;
  String supplierLastName;
  String supplierMail;
  String supplierState;

  factory ListadoProveedores.fromJson(String str) =>
      ListadoProveedores.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListadoProveedores.fromMap(Map<String, dynamic> json) =>
      ListadoProveedores(
        supplierId: json["providerid"],
        supplierName: json["provider_name"],
        supplierLastName: json["provider_last_name"],
        supplierMail: json["provider_mail"],
        supplierState: json["provider_state"],
      );

  Map<String, dynamic> toMap() => {
    "providerid": supplierId,
    "product_name": supplierName,
    "provider_last_name": supplierLastName,
    "provider_mail": supplierMail,
    "product_state": supplierState,
  };

  ListadoProveedores copy() => ListadoProveedores(
    supplierId: supplierId,
    supplierName: supplierName,
    supplierLastName: supplierLastName,
    supplierMail: supplierMail,
    supplierState: supplierState,
  );
}
