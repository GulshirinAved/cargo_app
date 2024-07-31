import 'package:flutter/material.dart';
import 'package:kargo_app/src/design/custom_icon.dart';

import '../../../design/app_colors.dart';
import '../../auth/components/custom_text_fild.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberntroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 70,
            elevation: 0,
            centerTitle: true,
            iconTheme:
                const IconThemeData(color: AppColors.profilColor, size: 30),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            title: const Text(
              'Profil',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 40, right: 20, left: 20, top: 40,),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 30),
                        child: CustomTextFild(
                            hint: 'Ady', controller: nameController,),),
                    Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                        child: Text(errorText,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.red[700],),),),
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
                            controller: lastNameController,),),
                    Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                        child: Text(errorText2,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.red[700],),),),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: CustomTextFild(
                            hint: 'Ulanyjy ady',
                            controller: userNameController,),),
                    Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                        child: Text(errorText3,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.red[700],),),),
                    const SizedBox(
                      height: 10.0,
                    ),
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
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 6, bottom: 6,),
                                child: Text(
                                  '+993',
                                  style: TextStyle(
                                      color: AppColors.authTextColor,
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,),
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
                                width: MediaQuery.of(context).size.width / 1.8,
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
                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                        child: Text(errorText4,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.red[700],),),),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 22,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'ID',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDalog();
                                },
                                icon: const Icon(
                                  Icons.info_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Container(
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.mainColor,),
                              child: const Center(
                                  child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.textFildColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Center(
                            child: TextFormField(
                              controller: idController,
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: 'ID',
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      showDalogdDelet();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CustomIcon(
                                          title: 'assets/icons/x.svg',
                                          height: 0,
                                          width: 0,
                                          color: AppColors.authTextColor,),
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
                                      color: AppColors.authTextColor,
                                      fontSize: 18,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,),),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                          // _onLoginButtonPressed();
                        } else {}
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40, right: 20, left: 20, bottom: 30,),
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(20),),
                          child: const Center(
                            child: Text(
                              'Ýatda sakla',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,),
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
    );
  }

  Future showDalog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ID',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Harydy  yzarlamak üçin ID kod girizmeli. Bir ulanyjynyň birnäçe ID kody bolup biler',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future showDalogdDelet() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Siz D45 ID koduny pozmak isleýärsiňizmi?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3 - 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[100],),
                      child: const Center(
                        child: Text(
                          'Hawa',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3 - 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.mainColor,),
                      child: const Center(
                        child: Text(
                          'Ýok',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
