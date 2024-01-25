import 'package:find_sport_task/src/common/localization/words.dart';
import 'package:find_sport_task/src/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegularPhoneField extends StatefulWidget {
  final TextEditingController? ctr;
  final String? hintText;

  const RegularPhoneField({
    Key? key,
    this.ctr,
    this.hintText,
  }) : super(key: key);

  @override
  State<RegularPhoneField> createState() => _RegularPhoneFieldState();
}

class _RegularPhoneFieldState extends State<RegularPhoneField> {
  String countryCode = 'UZ';
  int countryNumberLength = 9;
  String mask = '(##) ### ## ##';
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(width: 1, color: AppColors.nE7ECF3),
    
  );

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(
        mask: mask,
        filter: { "#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy
    );
    return IntlPhoneField(
      inputFormatters: [maskFormatter],
      initialCountryCode: countryCode,
      showDropdownIcon: false,
      disableLengthCheck: true,
      showCountryFlag: false,
      flagsButtonMargin: const EdgeInsets.only(left: 12, right: 5),
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 8, bottom: 8, right: 12),
        hintText: widget.hintText ?? '',
        hintStyle: const TextStyle(
          color: AppColors.n949CA9,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: AppColors.transparent,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border,
      ),
      onChanged: (phone) {
        if (phone.number.length <= countryNumberLength) {
          widget.ctr?.text = '${phone.countryCode}${phone.number}';
        }
      },
      onCountryChanged: (country) {
        countryCode = country.code;
        countryNumberLength = country.maxLength;
        mask = '';
        for (int i = 0; i < countryNumberLength; i++) {
          mask = '$mask#';
        }
        setState(() {});
      },
      validator: (phone) {
        if(phone == null || phone.number.isEmpty || phone.number.length == countryNumberLength) {
          return Words.required.translate();
        }
        return null;
      },
    );
  }
}
