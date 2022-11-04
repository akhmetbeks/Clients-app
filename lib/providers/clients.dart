import 'dart:async';

import 'package:clients_scroll_app/screens/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Clients with ChangeNotifier {
  List _items = [];

  List get items {
    return [..._items];
  }

  Future<void> getClients(BuildContext ctx) async {
    await Future.delayed(const Duration(seconds: 2));
    final url = Uri.https(
        'jsonplaceholder.typicode.com','users');
    try {
      final response = await http.get(url);
      _items = await json.decode(response.body);
      notifyListeners();
    } catch (err) {
      if (err.toString().isNotEmpty) {
        Navigator.of(ctx).pushReplacementNamed(NoDataFound.routeName);
      }
    }
  }
}
