import 'package:nullplex_test/const/consts.dart';

Widget customTextField(
    {title, controller, isPass, keyboardType, inputFormatters}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "$title".text.color(blackText).fontFamily(semibold).size(16).make(),
      10.heightBox,
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "please enter the $title";
          }
          return null;
        },
        obscureText: isPass,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: "$title",
          isDense: true,
          fillColor: textboxBG,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: textboxBorder),
              borderRadius: BorderRadius.circular(25)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: textboxBorder),
              borderRadius: BorderRadius.circular(25)),
        ),
        inputFormatters: inputFormatters,
      )
    ],
  );
}
