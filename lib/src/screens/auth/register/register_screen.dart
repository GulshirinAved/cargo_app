import 'package:flutter/material.dart';
import 'package:kargo_app/src/screens/auth/register/repository_register.dart';

import '../../../design/app_colors.dart';
import '../components/custom_text_fild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberntroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  bool _isHidden = true;
  bool _isHidden2 = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
    } else {}
  }

  String errorText = '';
  String errorText2 = '';
  String errorText3 = '';
  String errorText4 = '';
  String errorText5 = '';
  String errorText6 = '';

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 40, right: 20, left: 20, top: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Center(
                            child: Text(
                              'Akkaunt döret',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 20),
                            child: CustomTextFild(
                                hint: 'Ady', controller: nameController)),
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 5.0),
                            child: Text(errorText,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.red[700]))),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: CustomTextFild(
                                hint: 'Familiýasy',
                                controller: lastNameController)),
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 5.0),
                            child: Text(errorText2,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.red[700]))),
                        const SizedBox(
                          height: 10.0,
                        ),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //       left: 15,
                        //       right: 15,
                        //     ),
                        //     child: CustomTextFild(
                        //         hint: 'Ulanyjy ady',
                        //         controller: userNameController)),
                        // Padding(
                        //     padding:
                        //         const EdgeInsets.only(left: 20.0, top: 5.0),
                        //     child: Text(errorText3,
                        //         style: TextStyle(
                        //             fontSize: 12.0, color: Colors.red[700]))),
                        // const SizedBox(
                        //   height: 10.0,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppColors.textFildColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 6, bottom: 6),
                                    child: Text(
                                      '+993',
                                      style: TextStyle(
                                          color: AppColors.authTextColor,
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: AppColors.authTextColor,
                                    height: 20,
                                    width: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.8,
                                    child: TextFormField(
                                      controller: phoneNumberntroller,
                                      maxLines: 1,
                                      keyboardType: TextInputType.phone,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 5.0),
                            child: Text(errorText4,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.red[700]))),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.textFildColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Center(
                                child: TextFormField(
                                  controller: passwordController,
                                  maxLines: 1,
                                  obscureText: _isHidden,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: 'Açar sözi',
                                      hintStyle: const TextStyle(
                                          color: AppColors.authTextColor,
                                          fontSize: 18,
                                          fontFamily: 'Roboto',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isHidden = !_isHidden;
                                          });
                                        },
                                        child: _isHidden
                                            ? const Icon(
                                                Icons.visibility_outlined)
                                            : const Icon(
                                                Icons.visibility_off_outlined),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 5.0),
                            child: Text(errorText5,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.red[700]))),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.textFildColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Center(
                                child: TextFormField(
                                  controller: passwordConfirmController,
                                  maxLines: 1,
                                  obscureText: _isHidden2,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: 'Açar sözi tassykla',
                                      hintStyle: const TextStyle(
                                          color: AppColors.authTextColor,
                                          fontSize: 18,
                                          fontFamily: 'Roboto',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isHidden2 = !_isHidden2;
                                          });
                                        },
                                        child: _isHidden2
                                            ? const Icon(
                                                Icons.visibility_outlined)
                                            : const Icon(
                                                Icons.visibility_off_outlined),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 5.0),
                            child: Text(errorText6,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.red[700]))),
                        InkWell(
                          onTap: () {
                            if (lastNameController.text.isEmpty) {
                              setState(() {
                                errorText2 = 'Last name is empty.';
                              });
                            }
                            if (userNameController.text.isEmpty) {
                              setState(() {
                                errorText3 = 'User name is empty.';
                              });
                            }
                            if (phoneNumberntroller.text.isEmpty) {
                              setState(() {
                                errorText4 = 'Phone number is empty.';
                              });
                            }
                            if (phoneNumberntroller.text.isEmpty) {
                              setState(() {
                                errorText5 = 'Password is empty.';
                              });
                            }
                            if (passwordConfirmController.text.isEmpty) {
                              setState(() {
                                errorText6 = 'Password confirmation is empty.';
                              });
                            }
                            if (nameController.text.isEmpty) {
                              errorText = 'Name is empty.';
                            }
                            if (passwordController.text.isNotEmpty &&
                                phoneNumberntroller.text.isNotEmpty) {
                              RegisterRepository().register(
                                context,
                                nameController.text,
                                lastNameController.text,
                                phoneNumberntroller.text,
                                passwordController.text,
                                passwordConfirmController.text,
                              );
                            } else {}
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 40, right: 20, left: 20, bottom: 30),
                            child: Container(
                              height: 65,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  'Ulgama gir',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
