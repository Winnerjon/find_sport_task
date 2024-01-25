import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport_task/src/common/localization/localization.dart';
import 'package:find_sport_task/src/common/localization/words.dart';
import 'package:find_sport_task/src/common/values/colors.dart';
import 'package:find_sport_task/src/common/values/icons.dart';
import 'package:find_sport_task/src/common/values/images.dart';
import 'package:find_sport_task/src/features/ads/screen/ads_screen.dart';
import 'package:find_sport_task/src/features/auth/reg/screen/reg_screen.dart';
import 'package:find_sport_task/src/features/components/icon/regular_svg.dart';
import 'package:find_sport_task/src/models/entity/language_entity.dart';
import 'package:find_sport_task/src/services/enum/db_enum.dart';
import 'package:find_sport_task/src/services/local_db/db_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LanguageScreen extends StatefulWidget {
  static const String routeName = '/language_screen';

  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<LanguageEntity> languages = [
    LanguageEntity(
      langCode: 'uz',
      name: 'Uzbek',
      flag: AppImages.uz,
    ),
    LanguageEntity(
      langCode: 'uz',
      countryCode: 'UZ',
      name: 'Узбек',
      flag: AppImages.uz,
    ),
    LanguageEntity(
      langCode: 'ru',
      name: 'Русский',
      flag: AppImages.ru,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Center(
                child: Image(
                  image: AssetImage(AppImages.logo),
                ),
              ),
            ),
            Text(
              Words.languages.translate(),
              style: const TextStyle(
                  color: AppColors.n232638,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField<LanguageEntity>(
              value: languages.firstWhere((element) =>
                  (context.locale.languageCode == element.langCode) &&
                  (context.locale.countryCode == element.countryCode)),
              onChanged: (LanguageEntity? value) {
                if (value != null) {
                  AppLocalization.change(
                      context, value.langCode, value.countryCode);
                }
              },
              items: languages.map((value) {
                return DropdownMenuItem<LanguageEntity>(
                  value: value,
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(value.flag),
                        height: 12,
                        width: 24,
                      ),
                      const SizedBox(width: 15),
                      Text(value.name),
                    ],
                  ),
                );
              }).toList(),
              isExpanded: true,
              icon: const RegularSvg(
                iconSvg: AppIcons.chevronDown,
                height: 22,
                width: 22,
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                filled: true,
                fillColor: AppColors.transparent,
                hintText: Words.chooseLanguage.translate(),
                hintStyle: const TextStyle(
                  color: AppColors.n949CA9,
                  fontSize: 14,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.nE7ECF3),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.nE7ECF3)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.nE7ECF3)),
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: RawMaterialButton(
                onPressed: () {
                  final token = DbService().getLocalString(DbEnum.accessToken);
                  print(token);
                  if (token != null) {
                    context.push(AdsScreen.routeName);
                  } else {
                    context.push(RegScreen.routeName);
                  }
                },
                elevation: 4,
                fillColor: AppColors.n01001F,
                padding: const EdgeInsets.all(15),
                shape: const CircleBorder(),
                child: const RegularSvg(
                  iconSvg: AppIcons.arrowRight,
                  iconColor: AppColors.white,
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
