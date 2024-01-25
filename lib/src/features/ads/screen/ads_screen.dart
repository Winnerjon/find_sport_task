import 'package:find_sport_task/src/common/localization/words.dart';
import 'package:find_sport_task/src/common/values/colors.dart';
import 'package:find_sport_task/src/common/values/icons.dart';
import 'package:find_sport_task/src/features/ads/bloc/ads_bloc.dart';
import 'package:find_sport_task/src/features/ads/widget/map_widget.dart';
import 'package:find_sport_task/src/features/components/icon/regular_svg.dart';
import 'package:find_sport_task/src/features/components/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdsScreen extends StatefulWidget {
  static const String routeName = '/ads_screen';

  const AdsScreen({Key? key}) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  final _globalKey = GlobalKey<FormState>();
  final titleCtr = TextEditingController();
  final descriptionCtr = TextEditingController();
  final addressCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdsBloc(),
      child: BlocListener<AdsBloc, AdsState>(
        listener: (context, state) {
          addressCtr.text = state.address;

          if(state.isSuccess) {
            titleCtr.clear();
            descriptionCtr.clear();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: context.pop,
              icon: const Icon(Icons.close),
            ),
            title: Text(Words.newAds.translate()),
            actions: [
              BlocBuilder<AdsBloc, AdsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(right: 10),
                      child: const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2,),
                      ),
                    );
                  }
                  return IconButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        String title = titleCtr.text.trim();
                        String description = descriptionCtr.text.trim();
                        context.read<AdsBloc>().add(AdsResponse(
                            title: title, description: description));
                      }
                    },
                    icon: const RegularSvg(
                      iconSvg: AppIcons.arrowRight,
                      iconColor: AppColors.n327BED,
                      height: 16,
                      width: 16,
                    ),
                  );
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    CustomTextField(
                      ctr: titleCtr,
                      title: Words.title.translate(),
                      hintText: Words.enterProductTitle.translate(),
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      ctr: descriptionCtr,
                      maxLines: 5,
                      title: Words.description.translate(),
                      hintText: Words.enterDescription.translate(),
                    ),
                    Row(
                      children: [
                        const Expanded(child: Divider(height: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          child: Text(
                            Words.changeLocation.translate(),
                            style: const TextStyle(
                              color: AppColors.n01001F,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(height: 1)),
                      ],
                    ),
                    CustomTextField(
                      ctr: addressCtr,
                      title: Words.addressLocation.translate(),
                      hintText: Words.enterMapAddress.translate(),
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    const MapWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
