import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:googlebooksi/src/core/constants/strings.dart';
import 'package:googlebooksi/src/core/utilities/validation_extensions.dart';
import 'package:googlebooksi/src/widgets/action_button.dart';
import 'package:googlebooksi/src/widgets/input_text_field.dart';
import 'package:googlebooksi/src/widgets/status_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Login extends HookConsumerWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailAddressController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Statusbar(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 48),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: FaIcon(
                          FontAwesomeIcons.book,
                          size: 81,
                          color: Colors.blue.shade700,
                        )),
                        const Spacer(flex: 1),
                        InputTextField(
                          hintText: AppStrings.emailAddress,
                          controller: emailAddressController,
                          keyboardType: TextInputType.emailAddress,
                          validator: context.validateEmailAddress,
                          prefixIcon: Icon(Icons.email_outlined,
                              color: Colors.blue.shade700, size: 24),
                        ),
                        InputTextField(
                          hintText: AppStrings.password,
                          controller: passwordController,
                          obscureText: true,
                          validator: context.validatePassword,
                          prefixIcon: Icon(CupertinoIcons.lock_circle,
                              color: Colors.blue.shade700, size: 24),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ActionButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          child: const Text(
                            AppStrings.login,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        ActionButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              FaIcon(FontAwesomeIcons.google),
                              SizedBox(width: 10),
                              Text(
                                AppStrings.signinWithGoogle,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(AppStrings.noAccount),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
