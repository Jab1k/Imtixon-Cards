import 'package:cardsimtixon/cantroller/cards_controller.dart';
import 'package:cardsimtixon/components/myTextcoponient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:switcher_button/switcher_button.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  bool chek = false;
  TextEditingController number = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController data = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                88.verticalSpaceFromWidth,
                Text(
                  'Add New Card',
                  style: CostumTextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                48.verticalSpaceFromWidth,
                Container(
                  width: 342,
                  height: 540,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, top: 12, bottom: 30),
                          child: Text(
                            'Enter details',
                            style: CostumTextStyle(
                              fontSize: 14,
                              color: const Color(0xffFF9900),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: name,
                          validator: (s) {
                            if (s?.isEmpty ?? true) {
                              return "Please Type the name";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        24.verticalSpaceFromWidth,
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CreditCardNumberFormater(),
                            LengthLimitingTextInputFormatter(25)
                          ],
                          validator: (s) {
                            if (s?.isEmpty ?? true) {
                              return "Please Type the card number";
                            }
                            return null;
                          },
                          controller: number,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Card Number',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        24.verticalSpaceFromWidth,
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CreditcardData(),
                            LengthLimitingTextInputFormatter(5)
                          ],
                          controller: data,
                          validator: (s) {
                            if (s?.isEmpty ?? true) {
                              return "Please Type the Date";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Expiry date',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        24.verticalSpaceFromWidth,
                        TextFormField(
                          controller: cvv,
                          validator: (s) {
                            if (s?.isEmpty ?? true) {
                              return "Please Type the Cvv";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Cvv',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        25.verticalSpaceFromWidth,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Enter details',
                              style: CostumTextStyle(
                                fontSize: 14,
                                color: const Color(0xffFF9900),
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: Center(
                                child: SwitcherButton(
                                  offColor: Colors.black,
                                  onColor: Colors.orange,
                                  value: true,
                                  onChange: (value) {
                                    chek = true;
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {}
                    },
                    child: const Text("Sign Up"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// this class will be called, when their is change in textField
class CreditCardNumberFormater extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text; // get data enter by used in textField
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < enteredData.length; i++) {
      // add each character into String buffer
      buffer.write(enteredData[i]);
      int index = i + 1;
      if (index % 4 == 0 && enteredData.length != index) {
        // add space after 4th digit
        buffer.write(" - ");
      }
    }

    return TextEditingValue(
        text: buffer.toString(), // final generated credit card number
        selection: TextSelection.collapsed(
            offset: buffer.toString().length) // keep the cursor at end
        );
  }
}

// this class will be called, when their is change in textField
class CreditcardData extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text; // get data enter by used in textField
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < enteredData.length; i++) {
      // add each character into String buffer
      buffer.write(enteredData[i]);
      int index = i + 1;
      if (index % 2 == 0 && enteredData.length != index) {
        // add space after 4th digit
        buffer.write("/");
      }
    }

    return TextEditingValue(
        text: buffer.toString(), // final generated credit card number
        selection: TextSelection.collapsed(
            offset: buffer.toString().length) // keep the cursor at end
        );
  }
}
