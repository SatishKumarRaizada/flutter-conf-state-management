/// *  textInputType - The type of information for which to optimize the text input control.
/// *  hintText - Text that suggests what sort of input the field accepts.
/// *  prefixWidget - Leading Icon if required
/// *  suffixWidget - Trailing/Siffix Icon if required
/// *  defaultText - If there is predefined value is there for a text field
/// *  focusNode - Currently focus node
/// *  obscureText - Is Password field?
/// *  controller - Text controller
/// *  functionValidate - Validation function(currently I have used to check empty field)
/// *  parametersValidate - Value to validate
/// *  actionKeyboard - Keyboard action eg. next, done, search, etc
/// *  onDone - Done click action
/// *  onTap - On tap/click on textinput field
/// *  onChange - Method for reading text entered
/// *  onFieldTap - On focus on TextField
///
import 'package:flutter/material.dart';

class FlutterInputField extends StatelessWidget {
  final String hintText;
  final Function onChange;
  final Function onDone;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextEditingController? textFieldController;
  final Function? suffixTap;
  final Function? validateTextField;
  final bool isSecure;
  final int lineHeight;
  final double hintFontSize;
  final bool isEnabled;
  final TextInputType keyboardType;

  const FlutterInputField({
    Key? key,
    required this.hintText,
    required this.onChange,
    required this.onDone,
    this.prefixWidget,
    this.suffixWidget,
    this.textFieldController,
    this.suffixTap,
    this.validateTextField,
    this.isSecure = false,
    this.lineHeight = 1,
    this.hintFontSize = 16,
    this.isEnabled = true,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFieldController,
      obscureText: isSecure,
      maxLines: lineHeight,
      enabled: isEnabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        errorStyle: const TextStyle(
          fontSize: 16,
        ),
        hintText: hintText,
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        hintStyle: TextStyle(
          fontSize: hintFontSize,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (String str) {
        onChange(str);
      },
      validator: (String? value) {
        return validateTextField!(value);
      },
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
