import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_architecture/resources/components/round_button.dart';
import 'package:mvvm_architecture/utils/Routes/routesname.dart';
import 'package:mvvm_architecture/utils/Routes/utils.dart';
import 'package:mvvm_architecture/view_model/auth_view.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  ValueNotifier<bool> obsecurepass = ValueNotifier<bool>(true);
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  FocusNode emailfocusnode = FocusNode();
  FocusNode passfocusnode = FocusNode();

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    emailfocusnode.dispose();
    passfocusnode.dispose();
    obsecurepass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewmode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: emailfocusnode,
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Email', prefixIcon: Icon(Icons.email)),
                onFieldSubmitted: (value) {
                  utils.fieldfocuschange(
                      context, emailfocusnode, passfocusnode);
                },
              ),
              const SizedBox(height: 15),
              ValueListenableBuilder(
                  valueListenable: obsecurepass,
                  builder: (context, value, child) {
                    return TextFormField(
                      focusNode: passfocusnode,
                      controller: passcontroller,
                      obscureText: obsecurepass.value,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock_open),
                          suffixIcon: InkWell(
                              onTap: () {
                                obsecurepass.value = !obsecurepass.value;
                              },
                              child: obsecurepass.value
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(Icons.visibility))),
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
              RoundButton(
                  title: 'Login',
                  loading: authviewmode.loading,
                  onpress: () {
                    if (emailcontroller.text.isEmpty) {
                      utils.flushbarmessage('Please enter email', context);
                    } else if (passcontroller.text.isEmpty) {
                      utils.flushbarmessage('Please enter password', context);
                    } else if (passcontroller.text.length < 6) {
                      utils.flushbarmessage(
                          'Please enter 6 digits password', context);
                    } else {
                      Map data = {
                        'email': 'eve.holt@reqress.in',
                        'password': 'cityslicka',
                      };
                      authviewmode.loginApi(data, context);
                      print('api hit');
                    }
                  }),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.Signup);
                },
                child: const Text("Don't ahve an account? Sign up"),
              )
            ],
          ),
        ));
  }
}
