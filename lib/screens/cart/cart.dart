import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_shopping/state/cart/cart.dart';
import 'package:my_shopping/widgets/button.dart';

class ItemCartScreen extends StatelessWidget {
  const ItemCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _height = _size.height;
    final _width = _size.width;
    return Consumer(
      builder: (context, ref, child) {
        final itemList = ref.watch(ItemList.stateNotifierProvider);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
          ),
          bottomSheet: itemList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: FlutterTextButton(
                    buttonWidth: _width,
                    buttonText: 'PROCEED TO CHECKOUT',
                    onTap: () {},
                  ),
                )
              : const SizedBox(),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: itemList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Image.asset(
                                itemList[index].image!,
                                width: 150,
                              ),
                              SizedBox(width: _width * 0.05),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _itemRow(_width, 'Name', itemList[index].name!),
                                  SizedBox(height: _height * 0.01),
                                  _itemRow(_width, 'Loadability', itemList[index].loadability!),
                                  SizedBox(height: _height * 0.02),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          side: BorderSide(width: 1, color: Colors.grey.shade200),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const InkWell(
                                                child: Icon(Icons.remove),
                                              ),
                                              SizedBox(width: _width * 0.03),
                                              const Text('2'),
                                              SizedBox(width: _width * 0.03),
                                              const InkWell(
                                                child: Icon(Icons.add),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: _width * 0.03),
                                      const Text('\$400.50')
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: _height * 0.1),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _itemRow(double width, String title, String value) {
    return Row(
      children: [
        Text('$title:'),
        SizedBox(width: width * 0.02),
        Text(value),
      ],
    );
  }
}
