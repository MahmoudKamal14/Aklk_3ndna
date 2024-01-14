import 'dart:developer';

import 'package:aklk_3ndna/core/cubit/current_locale/current_locale_cubit.dart';
import 'package:aklk_3ndna/core/database/cache/cache_helper.dart';
import 'package:aklk_3ndna/core/services/service_locator.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class languageView extends StatefulWidget {
  const languageView({super.key});

  @override
  State<languageView> createState() => _languageViewState();
}

class _languageViewState extends State<languageView> {
  @override
  void initState() {
    _value = getIt<CacheHelper>().getData(key: "value") ?? true;
    log("$_value");
    super.initState();
  }

  bool? _value = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).cardColor,
            title: Text(
              S.of(context).language,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
          ),
          backgroundColor: Theme.of(context).cardColor,
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              RadioListTile(
                  activeColor: Colors.amber,
                  selected: _value == true ? true : false,
                  title: Text(
                    S.of(context).Arabic,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  value: true,
                  groupValue: _value,
                  onChanged: (value) async {
                    await getIt<CacheHelper>().put(key: 'value', value: value);
                    setState(() {
                      _value = value;
                      CurrentLocaleCubit.get(context)
                          .updateLanguage(value: _value!);
                    });
                  }),
              RadioListTile(
                  activeColor: Colors.amber,
                  selected: _value == false ? true : false,
                  title: Text(
                    S.of(context).English,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  value: false,
                  groupValue: _value,
                  onChanged: (value) async {
                    await getIt<CacheHelper>().put(key: 'value', value: value);

                    setState(() {
                      _value = value;
                      CurrentLocaleCubit.get(context)
                          .updateLanguage(value: _value!);
                    });
                  }),
            ],
            //Arabic
          ),
        ),
      ),
    );
  }
}
//  appBar: AppBar(
//             title: Text(S.of(context).signUp),
//           ),
//           body: GestureDetector(
//             onTap: () {
//               CurrentLocaleCubit.get(context).updateLanguage(value: true);
//             },
//             child: Center(child: Text('En')),
//           ),