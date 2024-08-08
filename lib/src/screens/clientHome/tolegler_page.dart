import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/auth/components/custom_text_fild.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';
import 'package:kargo_app/src/screens/clientHome/components/custom_button.dart';
import 'package:kargo_app/src/screens/clientHome/data/services/getOneOrder_service.dart';
import 'package:kargo_app/src/screens/custom_widgets/widgets.dart';

class Tolegler extends StatelessWidget {
  Tolegler({required this.totalDebt, super.key});
  final String totalDebt;
  TextEditingController seneController = TextEditingController();
  TextEditingController seneController1 = TextEditingController();
  TextEditingController ulagController = TextEditingController();
  TextEditingController ulagController1 = TextEditingController();
  TextEditingController idController = TextEditingController();
  final ClientHomeController clientHomeController = Get.put(ClientHomeController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        topCard(),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.grey5Color),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.4),
                offset: const Offset(3, 3),
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            children: [
              topText(),
              Obx(
                () {
                  return Center(
                    child: clientHomeController.paymentHistory.isNotEmpty
                        ? page()
                        : const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              child: Text(
                                'Gozleg maglumatlary doldurun',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  ListView page() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: clientHomeController.paymentHistory.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      clientHomeController.paymentHistory[index].id.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      clientHomeController.paymentHistory[index].transport.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      clientHomeController.paymentHistory[index].paid.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyLight.delete,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: AppColors.authRegisterColor,
        );
      },
    );
  }

  Row topText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'ID',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          'Ulag No',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          'Toleg',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(),
      ],
    );
  }

  Container topCard() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.grey5Color),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.4),
            offset: const Offset(3, 3),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width / 2.2,
                child: const Text(
                  'Jemi',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                totalDebt,
                style: const TextStyle(
                  color: AppColors.redColor,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFildWithText(
                  hint: DateTime.now().toString().substring(0, 10),
                  text: 'Sene',
                  controller: seneController,
                ),
              ),
              Expanded(
                child: CustomTextFildWithText(
                  hint: DateTime.now().toString().substring(0, 10),
                  text: 'Sene',
                  controller: seneController1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFildWithText(
                  hint: '110',
                  text: 'Ulag No',
                  controller: ulagController,
                ),
              ),
              Expanded(
                child: CustomTextFildWithText(
                  hint: '90',
                  text: 'Ulag No',
                  controller: ulagController1,
                ),
              ),
            ],
          ),
          CustomTextFildWithText(
            hint: '1470',
            text: 'ID',
            controller: idController,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButtonWithText(
            text: 'Gozle',
            onTap: () async {
              if (seneController.text.isEmpty && seneController1.text.isEmpty && idController.text.isEmpty && ulagController.text.isEmpty && ulagController1.text.isEmpty) {
                showSnackBar('Ýalňyşlyk', 'Maglumatlary doldurun', Colors.red);
              } else {
                clientHomeController.paymentHistory.clear();
                await GetOneOrderService().getPaymentMethod(
                  dateFrom: seneController.text,
                  dateTo: seneController1.text,
                  ticket_search: idController.text,
                  from_transport_id: ulagController.text,
                  to_transport_id: ulagController1.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
