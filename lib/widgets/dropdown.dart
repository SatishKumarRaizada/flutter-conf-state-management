import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final List<String> dropList;
  final String? hintText;
  final String? valueSelected;
  final Function onSelect;

  const AppDropdown({
    Key? key,
    required this.dropList,
    this.hintText = 'Select role',
    required this.valueSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(hintText!),
          borderRadius: BorderRadius.circular(10),
          underline: null,
          icon: const Icon(CupertinoIcons.chevron_down),
          isExpanded: true,
          items: dropList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: valueSelected,
          onChanged: (String? cargo) {
            onSelect(cargo);
          },
        ),
      ),
    );
  }
}
