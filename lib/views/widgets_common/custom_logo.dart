import 'package:nullplex_test/const/consts.dart';

Widget customLogo({context, title, hint, pass, onPress}) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        width: MediaQuery.of(context).size.width - 90,
        height: MediaQuery.of(context).size.height * 0.28,
        decoration: BoxDecoration(
            color: signUpBox3, borderRadius: BorderRadius.circular(40)),
      ),
      Container(
        width: MediaQuery.of(context).size.width - 45,
        height: MediaQuery.of(context).size.height * 0.265,
        decoration: BoxDecoration(
            color: signUpBox2, borderRadius: BorderRadius.circular(40)),
      ),
      Container(
        padding: EdgeInsets.only(top: 50, left: 20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            color: signUpBox1,
            borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              sLogo,
              width: MediaQuery.of(context).size.width * 0.55,
            ),
            25.heightBox,
            //title
            "$title".text.white.minFontSize(24).fontFamily(semibold).make(),
            5.heightBox,
            Row(
              children: [
                //hint
                "$hint".text.white.fontFamily(regular).minFontSize(18).make(),
                TextButton(
                  onPressed: () {
                    onPress();
                  },
                  child:
                      //pass
                      "$pass"
                          .text
                          .color(yellowText)
                          .minFontSize(18)
                          .fontFamily(medium)
                          .make(),
                )
              ],
            )
          ],
        ),
      ),
      Positioned(
          top: -10,
          right: -20,
          child: CircleAvatar(
            backgroundColor: signUpBox2,
            radius: 55,
          ))
    ],
  );
}
