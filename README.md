# my_shopping

A new Flutter application with RIVERPOD as state management.

## Getting Started

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/SatishKumarRaizada/flutter-conf-state-management.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```


## Boilerplate Features:

* Splash
* Home
* Detail
* Cart

## ChangeNotifier Code Snippet and Screens 

<tr>
<td>

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider.autoDispose((ref) {
  return ChangeThemeState();
});

class ChangeThemeState extends ChangeNotifier {
  bool darkMode = false;

  void enableDarkMode() {
    darkMode = !darkMode;
    notifyListeners();
  }
}
```
</td>
</tr>
</table>
<table>
  <td>
<img src="https://user-images.githubusercontent.com/70257658/166654152-2d8ac269-a64e-446c-8ad2-e270ec9ddcd0.png" alt="light_theme">
</td>
  <td>
  <img src="https://user-images.githubusercontent.com/70257658/166654206-2bdb6f47-4021-4a03-b1d1-8da59ecc1453.png" alt="dark_theme">
</td>
</tr>
</table>

## StatePrvider Code Snippet and Screens 

<table>
<tr>
<td>

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_shopping/config/model/container.dart';

class ItemList extends StateNotifier<List<ItemListModel>> {
  ItemList() : super([]);

  static final provider =
      StateNotifierProvider<ItemList, List<ItemListModel>>((ref) => ItemList());

  ItemListModel _current = ItemListModel();
  ItemListModel get current => _current;

  void addItem(ItemListModel item) {
    _current = item;
    state = [...state, item];
  }
}
```
</td>
</tr>
</table>

<table>

</td>
  <td>
<img src="https://user-images.githubusercontent.com/70257658/166625549-5b71efd1-354c-4d5b-9731-1c7fb79295ed.png" alt="updating_cart_value_with_stateprovider">
</td>
  <td>
  <img src="https://user-images.githubusercontent.com/70257658/166626584-ab519b15-363b-484f-84a3-23bfe05e4cb1.png" alt="updated_cart_value">
</td>
</tr>
</table>

### Libraries & Tools Used, highlevel

* [Riverpod](https://pub.dev/packages/flutter_riverpod) (State Management)
* [Equatable](https://pub.dev/packages/equatable) (Comparing objects)

