import 'dart:convert';

class Category {
  Category({required this.listado});

  List<ListadoCategorias> listado;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    listado: List<ListadoCategorias>.from(
      json["Listado Categorias"].map((x) => ListadoCategorias.fromMap(x)),
    ),
  );

  Map<String, dynamic> toMap() => {
    "Listado Categorias": List<dynamic>.from(listado.map((x) => x.toMap())),
  };
}

class ListadoCategorias {
  ListadoCategorias({
    required this.categoryId,
    required this.categoryName,
    required this.categoryState,
  });

  int categoryId;
  String categoryName;
  String categoryState;

  factory ListadoCategorias.fromJson(String str) =>
      ListadoCategorias.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListadoCategorias.fromMap(Map<String, dynamic> json) =>
      ListadoCategorias(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryState: json["category_state"],
      );

  Map<String, dynamic> toMap() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_state": categoryState,
  };

  ListadoCategorias copy() => ListadoCategorias(
    categoryId: categoryId,
    categoryName: categoryName,
    categoryState: categoryState,
  );
}
