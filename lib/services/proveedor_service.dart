//ISMAEL VERGARA VIDELA
//16.936.330-7
//SEM 2 2023 | COMPUTACIÓN MÓVIL | eICFE1119-07

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:examen_final/models/proveedores.dart';

class ProveedorService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8000';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> proveedores = [];
  Listado? SelectProveedor;
  bool isLoading = true;
  bool isEditCreate = true;

  ProveedorService() {
    loadProveedores();
  }
  Future loadProveedores() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_list_rest/',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final proveedorMap = Proveedor.fromJson(response.body);
    print(response.body);
    proveedores = proveedorMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateProveedor(Listado proveedor) async {
    isEditCreate = true;
    notifyListeners();
    if (proveedor.proveedorId == 0) {
      await createProveedor(proveedor);
    } else {
      await updateProveedor(proveedor);
    }

    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateProveedor(Listado proveedor) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_edit_rest/',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(url, body: proveedor.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);

    //actualizamos el listado
    final index = proveedores
        .indexWhere((element) => element.proveedorId == proveedor.proveedorId);
    proveedores[index] = proveedor;

    return '';
  }

  Future createProveedor(Listado proveedor) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_add_rest/',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(url, body: proveedor.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    proveedores.add(proveedor);
    return '';
  }

  Future deleteProveedor(Listado proveedor, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_del_rest/',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(url, body: proveedor.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    proveedores.clear(); //borra todo el listado
    loadProveedores();
    Navigator.of(context).pushNamed('list');
    return '';
  }
}
