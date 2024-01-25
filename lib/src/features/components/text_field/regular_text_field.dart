import 'package:find_sport_task/src/common/localization/words.dart';
import 'package:find_sport_task/src/common/values/colors.dart';
import 'package:flutter/material.dart';

class RegularTextField extends StatelessWidget {
  final TextEditingController ctr;
  final String hintText;
  final int? maxLines;
  final FormFieldValidator? validator;

  const RegularTextField({
    Key? key,
    required this.ctr,
    this.maxLines,
    required this.hintText,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctr,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        filled: true,
        fillColor: AppColors.transparent,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.n949CA9,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(width: 1, color: AppColors.nE7ECF3),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(width: 1, color: AppColors.nE7ECF3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(width: 1, color: AppColors.nE7ECF3)),
      ),
      validator: validator ?? (value) => val(value, context),
    );
  }

  String? val(dynamic value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return Words.required.translate();
    }
    return null;
  }
}
