import 'package:nullplex_test/const/consts.dart';

Widget customButton({name, onPress, color}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(double.infinity, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: () {
        onPress();
      },
      child: "$name".text.minFontSize(16).fontFamily(semibold).white.make());
}
