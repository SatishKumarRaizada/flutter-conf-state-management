import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_shopping/config/model/container.dart';
import 'package:my_shopping/config/routes/app_route.dart';
import 'package:my_shopping/screens/cart/load_item.dart';
import 'package:my_shopping/state/cart/cart.dart';
import 'package:my_shopping/state/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _sun = 'assets/images/sun.png';
  final _moon = 'assets/images/moon.png';
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _height = _size.height;
    final _width = _size.width;
    // Provider starting point as Consumer widget
    return Consumer(
      builder: (context, ref, child) {
        // 1. Provider to watch the state of themeProvider
        var isDarkMode = ref.watch(themeProvider).darkMode;
        final theme = Theme.of(context);
        // 2. NotifierListener Provider to watch the state of item list
        final itemList = ref.watch(ItemList.stateNotifierProvider);
        // 3. Future provider to get list of items from json file
        // AsyncValue<T> is the class used to safely manipulate asynchronous data
        AsyncValue<List<ItemListModel>> _itemList = ref.watch(itemsList);

        /* when() method is used to map the data, loading, and error states
           to different widgets */

        return _itemList.when(
          loading: () => const Scaffold(
            body: CircularProgressIndicator(),
          ),
          error: (err, stack) => Text('Error: $err'),
          data: (items) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Shopping'),
                actions: [
                  Switch(
                    value: isDarkMode,
                    onChanged: (bool theme) {
                      ref.read(themeProvider).toggleThemeMode();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: Colors.black,
                    inactiveThumbColor: Colors.orange,
                    activeThumbImage: AssetImage(_moon),
                    inactiveThumbImage: AssetImage(_sun),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoute.cartDetail);
                          },
                          child: const Icon(CupertinoIcons.cart),
                        ),
                        itemList.isNotEmpty
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  '${itemList.length}',
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Select item(s)'),
                      SizedBox(height: _height * 0.01),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Card(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoute.itemDetail,
                                      arguments: items[index],
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          items[index].image!,
                                          width: _width * 0.2,
                                        ),
                                        SizedBox(height: _height * 0.01),
                                        _itemRow('Type', items[index].name!),
                                        SizedBox(height: _height * 0.005),
                                        _itemRow('Age', items[index].age!),
                                        SizedBox(height: _height * 0.005),
                                        _itemRow(
                                          'Loadability',
                                          items[index].loadability!,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    ref
                                        .watch(ItemList
                                            .stateNotifierProvider.notifier)
                                        .addItem(
                                          items[index],
                                        );
                                  },
                                  icon: const Icon(CupertinoIcons.add_circled),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _itemRow(String title, String value) {
    final _size = MediaQuery.of(context).size;
    final _width = _size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(width: _width * 0.02),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'MaerskBold',
          ),
        ),
      ],
    );
  }
}