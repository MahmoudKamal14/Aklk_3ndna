import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var searchController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Search Can\'t be Empty';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  if (formKey.currentState!.validate()) {
                    // SearchCubit.get(context).getSearch(searchController.text);
                  }
                },
                decoration: const InputDecoration(
                  hintText: '   Search',
                  hintStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
