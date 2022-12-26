
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/const_colors.dart';
import '../../core/constants/const_text.dart';
class DefaultTextField extends StatefulWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPass;
  final Function(String val)? onChange;
  final Function(String? val)? onSave;
  final String type;

  const DefaultTextField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.label,
      required this.textInputType,
      this.type = 'other',
      this.isPass = false,
      this.onChange,
      this.onSave})
      : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool pass = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pass = widget.isPass;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          obscureText: pass,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          onChanged: widget.onChange,
          onSaved: widget.onSave,
          inputFormatters: widget.type == 'name'
              ? [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z_ ]")),
                ]
              : [],
          validator: widget.type == 'email'
              ? (val) {
                  return ConstText.emailValid.hasMatch(widget.controller.text)
                      ? null
                      : 'Your Email is Invalid';
                }
              : widget.type == 'password'
                  ? (val) {
                      return widget.controller.text.length >= 6
                          ? null
                          : 'Password must be at least 6 characters';
                    }
                  : widget.type == 'name'
                      ? (val) {
                          return ConstText.nameValid.hasMatch(widget.controller.text)
                              ? widget.controller.text.length>32
                              ?'Name can’t be longer than 32 characters'
                              :null
                              : 'Enter valid Name';
                        }
                      : widget.type == 'subject'
                          ? (val) {
                              return ConstText.nameValid.hasMatch(widget.controller.text)
                                  ? null
                                  : "Subject can't be empty";
                            }
                          : widget.type == 'message'
                              ? (val) {
                                  return ConstText.nameValid
                                          .hasMatch(widget.controller.text)
                                      ? null
                                      : "The minimum lengeth for this field is 5 characters.\n"
                                          "The maximum character limit is 250. ";
                                }
                              : null,
          decoration: InputDecoration(
            suffixIcon: widget.isPass
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        pass = !pass;
                      });
                    },
                    child: pass
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  )
                : null,
            fillColor: ConstColors.kPrimaryColor.withOpacity(.1),
            filled: true,
            labelText: widget.label,
            labelStyle: TextStyle(color: ConstColors.kPrimaryColor),
            hintText: widget.hint,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
        ),
      ],
    );
  }
}
