import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_shopping/config/model/container.dart';

class ItemList extends StateNotifier<List<ItemListModel>> {
  ItemList() : super([]);
  static final itemListStateProvider =
      StateNotifierProvider<ItemList, List<ItemListModel>>((ref) => ItemList());
  ItemListModel _current = ItemListModel();
  ItemListModel get current => _current;

  void addItem(ItemListModel item) {
    _current = item;
    state = [...state, item];
  }
  //
}
