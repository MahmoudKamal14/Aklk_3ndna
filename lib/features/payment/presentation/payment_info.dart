import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

TextEditingController CardNumberController = TextEditingController();

TextEditingController ValiduntillController = TextEditingController();

TextEditingController CVVController = TextEditingController();
TextEditingController CardHolderNameController = TextEditingController();

// card Holder Name
//Card Number
class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Payment',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Card Number',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            textFieldProfile(
              controller: CardNumberController,
              type: TextInputType.number,
              label: 'Card Number',
              obscureText: true,
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Valid untill',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            textFieldProfile(
              controller: ValiduntillController,
              type: TextInputType.text,
              label: 'Valid untill',
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'CVV',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            textFieldProfile(
              controller: CVVController,
              type: TextInputType.number,
              label: 'CVV',
              obscureText: true,
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Card Holder Name',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            textFieldProfile(
              controller: CardHolderNameController,
              type: TextInputType.text,
              label: 'Card Holder Name',
            ),
            SizedBox(height: 60),
            CustomButton(onPressed: () {}, text: S.of(context).orderNow),
          ]),
        ),
      ),
    );
  }
}

Widget textFieldProfile(
        {required TextEditingController controller,
        required TextInputType type,
        String? label,
        String? hintText,
        IconData? prefix,
        bool? obscureText}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 22,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'error';
          // return _errorMessage(hintText, context);
        }
        return null;
      },
      obscureText: obscureText ?? false,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: _getBorderStyle(),
        focusedBorder: _getBorderStyle(),
        enabledBorder: _getBorderStyle(color: Colors.grey),
        hintText: hintText,
        prefixIconColor: Colors.amber,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 22,
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: Icon(prefix),
      ),
    );
OutlineInputBorder _getBorderStyle({Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color ?? kPrimaryColor,
    ),
  );
}
