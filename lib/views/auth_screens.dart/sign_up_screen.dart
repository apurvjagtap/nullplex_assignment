import 'package:nullplex_test/const/consts.dart';
import 'package:nullplex_test/controllers/auth_controller.dart';
import 'package:flutter/services.dart';
import 'package:nullplex_test/views/home/home.dart';
import 'package:nullplex_test/views/widgets_common/custom_button.dart';
import 'package:nullplex_test/views/widgets_common/custom_logo.dart';
import 'package:nullplex_test/views/widgets_common/custom_textfield.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: [
            //Logo Container
            customLogo(
                context: context,
                title: signUp,
                hint: alreadyHaveAnAccount,
                pass: signIn,
                onPress: () {
                  Navigator.pop(context);
                }),

            HeightBox(context.screenHeight * 0.1),
            //welcome
            welcome.text
                .fontFamily(semibold)
                .minFontSize(26)
                .color(blackText)
                .make(),
            letsSignUp.text.minFontSize(18).fontFamily(medium).make(),

            //form
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    15.heightBox,
                    customTextField(
                        title: fullName,
                        isPass: false,
                        controller: name,
                        keyboardType: TextInputType.name),
                    15.heightBox,
                    customTextField(
                      title: mobileNo,
                      isPass: false,
                      controller: phone,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(10)
                      ],
                    ),
                    15.heightBox,
                    customTextField(
                        title: password,
                        isPass: true,
                        controller: pass,
                        keyboardType: TextInputType.text),
                    30.heightBox,
                    Consumer<AuthController>(
                        builder: (context, controller, bbb) {
                      return controller.loading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(primary),
                            )
                          : customButton(
                              name: continueToSignUp,
                              color: primary,
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  controller
                                      .userSignUp(context,
                                          phone: phone.text,
                                          pass: pass.text,
                                          name: name.text)
                                      .then((value) {
                                    print(value);
                                    if (value) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    }
                                  });
                                }
                              });
                    })
                  ],
                ).box.padding(EdgeInsets.all(20)).make(),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
