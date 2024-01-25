import 'package:find_sport_task/src/common/localization/words.dart';
import 'package:find_sport_task/src/common/values/colors.dart';
import 'package:find_sport_task/src/common/values/images.dart';
import 'package:find_sport_task/src/features/ads/screen/ads_screen.dart';
import 'package:find_sport_task/src/features/auth/reg/bloc/reg_bloc.dart';
import 'package:find_sport_task/src/features/components/button/regular_button.dart';
import 'package:find_sport_task/src/features/components/text_field/custom_text_field.dart';
import 'package:find_sport_task/src/models/entity/auth_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegScreen extends StatefulWidget {
  static const String routeName = '/reg_screen';

  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _globalKey = GlobalKey<FormState>();
  final firstNameCtr = TextEditingController();
  final lastNameCtr = TextEditingController();
  final phoneCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final confirmPasswordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegBloc(),
      child: BlocListener<RegBloc, RegState>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.pushReplacement(AdsScreen.routeName);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage(AppImages.authImage),
                          height: 260,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 24),
                          child: Text(
                            Words.signUp.translate(),
                            style: const TextStyle(
                              color: AppColors.n01001F,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        CustomTextField(
                          ctr: firstNameCtr,
                          title: Words.firstName.translate(),
                          hintText: Words.enterFirstName.translate(),
                        ),
                        CustomTextField(
                          ctr: lastNameCtr,
                          title: Words.lastName.translate(),
                          hintText: Words.enterLastName.translate(),
                        ),
                        CustomTextField(
                          ctr: phoneCtr,
                          isPhone: true,
                          title: Words.phoneNumber.translate(),
                          hintText: '(__) ___ - __ - __',
                        ),
                        CustomTextField(
                          ctr: passwordCtr,
                          title: Words.password.translate(),
                          hintText: Words.enterPassword.translate(),
                        ),
                        CustomTextField(
                          ctr: confirmPasswordCtr,
                          title: Words.confirmPassword.translate(),
                          hintText: Words.enterConfirmPassword.translate(),
                          validator: (value) {
                            String password1 = passwordCtr.text.trim();
                            String password2 = confirmPasswordCtr.text.trim();
                            if (value == null || value == '') {
                              return Words.required.translate();
                            }
                            if (password1 != password2) {
                              return Words.suitablePassword.translate();
                            }
                            return null;
                          },
                        ),

                        /// button
                        BlocBuilder<RegBloc, RegState>(
                          builder: (context, state) {
                            return RegularButton(
                              height: 40,
                              isLoading: state.isLoading,
                              title: Words.save.translate(),
                              onTap: () {
                                if (_globalKey.currentState!.validate()) {
                                  String firstName = firstNameCtr.text.trim();
                                  String lastName = lastNameCtr.text.trim();
                                  String phoneNumber = phoneCtr.text.trim();
                                  String password = passwordCtr.text.trim();
                                  AuthEntity authEntity = AuthEntity(
                                      firstname: firstName,
                                      lastname: lastName,
                                      phone: phoneNumber,
                                      password: password);
                                  context
                                      .read<RegBloc>()
                                      .add(RegResponse(authEntity: authEntity));
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
