import 'package:flutter/material.dart';

class CheckboxMy extends StatefulWidget {
  const CheckboxMy({super.key, required this.ans});
  final String ans;
  @override
  State<CheckboxMy> createState() {
    return _CheckboxMyState();
  }
}

class _CheckboxMyState extends State<CheckboxMy> {
  var checkboxvalue = false;
  List<String> arr = [];
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checkboxvalue,
      onChanged: (bool? value) {
        setState(() {
          checkboxvalue = value!;
          if (checkboxvalue == true) {
            arr.add("hi");
          }
          if (checkboxvalue == false) {
            arr.remove("hi");
          }
          print(arr);
        });
      },
      title: Text("sra"),
      subtitle: const Text('Supporting text'),
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
