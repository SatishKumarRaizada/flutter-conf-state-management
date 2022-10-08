import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_shopping/config/model/container.dart';

final itemsListProvider = FutureProvider.autoDispose<List<ItemListModel>>((ref) async {
  String content = await rootBundle.loadString('assets/data/conatiner_data.json');
  return List<ItemListModel>.from(json.decode(content).map((x) => ItemListModel.fromJson(x)));
});
