import 'package:flutter/material.dart';
import 'package:news/app_them.dart';

class DefaultTextFormFiled extends StatefulWidget {
  DefaultTextFormFiled({
    required this.hintText,
    this.prefixIcons,
    this.onChanged,
    this.suffixIcon,
    this.isSearching = false,
    required this.onClose,
    this.controller, 
  });

  final String hintText;
  final IconData? prefixIcons;
  final IconData? suffixIcon;
  final bool isSearching;
  final void Function()? onClose;
  final void Function(String)? onChanged;
  final TextEditingController? controller; 

  @override
  State<DefaultTextFormFiled> createState() => _DefaultTextFormFiledState();
}

class _DefaultTextFormFiledState extends State<DefaultTextFormFiled> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: widget.onChanged,
      autofocus: true, 
      style: TextStyle(color: AppThem.white),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppThem.white),
        suffixIcon: IconButton(
          icon: Icon(Icons.close_outlined),
          color: AppThem.white,
          onPressed: () {
            
            controller.clear(); 
            widget.onClose?.call();
          },
        ),
        prefixIcon: Icon(
          Icons.search_outlined,
          color: AppThem.white,
        ),
      ),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
