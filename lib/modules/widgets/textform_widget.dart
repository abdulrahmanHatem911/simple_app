import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/style/app_color.dart';

class DefaultTextFormWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefix;
  final IconData? suffix;
  final TextInputType? keyboardType;
  bool isPassword = false;
  final FormFieldValidator<String>? validate;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  DefaultTextFormWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.prefix,
    this.suffix,
    this.isPassword = false,
    this.validate,
    this.onChanged,
    this.inputFormatters,
  });

  @override
  State<DefaultTextFormWidget> createState() => _DefaultTextFormWidgetState();
}

class _DefaultTextFormWidgetState extends State<DefaultTextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      controller: widget.controller,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      validator: widget.validate,
      obscureText: widget.isPassword,
      style: const TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.grey),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(14.0),
        hintText: widget.hintText,
        filled: true,
        prefixIcon:
            widget.prefix != null ? Icon(widget.prefix, size: 18) : null,
        suffixIcon: widget.suffix != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.isPassword = !widget.isPassword;
                  });
                },
                icon: Icon(
                  widget.isPassword ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                ),
              )
            : null,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
