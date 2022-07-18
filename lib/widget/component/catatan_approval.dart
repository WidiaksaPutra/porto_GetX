import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class CatatanApproval extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  const CatatanApproval({Key? key, required this.controller, this.onChanged, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: 1,
      maxLines: 10,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: "Masukkan Catatan",
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color.fromRGBO(194, 194, 194, 1)
        ),
        filled: true,
        fillColor: colorCardSearch,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
          gapPadding: 10,
        ),
      ),
    );
  }
}