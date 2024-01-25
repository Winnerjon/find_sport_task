import 'package:find_sport_task/src/common/values/colors.dart';
import 'package:find_sport_task/src/features/components/text_field/regular_phone_field.dart';
import 'package:find_sport_task/src/features/components/text_field/regular_text_field.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController ctr;
  final bool isPhone;
  final String title;
  final int? maxLines;
  final String? hintText;
  final FormFieldValidator? validator;

  const CustomTextField({
    Key? key,
    required this.ctr,
    this.isPhone = false,
    this.maxLines,
    required this.title,
    this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.n01001F,
            fontSize: 12,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w400,
            height: 0.10,
          ),
        ),
        const SizedBox(height: 5),
        if(isPhone)
          RegularPhoneField(
            ctr: ctr,
            hintText: hintText,
          )
        else
          RegularTextField(
            ctr: ctr,
            maxLines: maxLines,
            hintText: hintText ?? '',
            validator: validator,
          ),
        const SizedBox(height: 12),
      ],
    );
  }
}
