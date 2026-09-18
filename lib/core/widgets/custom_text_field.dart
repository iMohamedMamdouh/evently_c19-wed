import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hint,
    this.icon,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    const iconColor = Color(0xFFBDBDBD);

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Color(0xFFEDEDED)),
    );

    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword && isHidden,
      style: const TextStyle(fontSize: 16, color: Colors.black87),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(fontSize: 16, color: Color(0xFF6B6B6B)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
          child: Icon(widget.icon, color: iconColor, size: 26),
        ),

        suffixIcon: widget.isPassword
            ? Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: IconButton(
                  onPressed: () => setState(() => isHidden = !isHidden),
                  icon: Icon(
                    isHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: iconColor,
                    size: 26,
                  ),
                ),
              )
            : null,
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
