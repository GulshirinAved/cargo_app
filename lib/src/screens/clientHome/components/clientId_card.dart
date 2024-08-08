// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/auth/components/custom_text_fild.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';
import 'package:kargo_app/src/screens/clientHome/components/custom_button.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/getOneOrder_model.dart';
import 'package:kargo_app/src/screens/clientHome/data/services/getOneOrder_service.dart';

class ClientIdCard extends StatefulWidget {
  final User user;
  final int index;
  const ClientIdCard({
    required this.user,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<ClientIdCard> createState() => _ClientIdCardState();
}

class _ClientIdCardState extends State<ClientIdCard> {
  final ClientHomeController clientHomeController = Get.put(ClientHomeController());
  bool value = false;
  int _selectedIndex = -1;
  String tickedIDMine = '';
  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Text(
                  widget.user.userName ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                '${widget.user.totalDebt}',
                style: const TextStyle(
                  color: AppColors.redColor,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            height: 90,
            alignment: Alignment.center,
            width: Get.width,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.user.tickets!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  if (value == false) {
                    value = true;
                    _selectedIndex = index;
                    setState(() {});
                    clientHomeController.showOrderIDList.clear();
                    tickedIDMine = widget.user.tickets![index].id.toString();
                    await GetOneOrderService().fetchOneOrder(userId: clientHomeController.userId.value, ticketID: widget.user.tickets![index].id.toString()).then((a) {
                      final List<Datum> list = a;
                      clientHomeController.showOrderIDList.addAll(list);
                    });
                  } else {
                    _selectedIndex = -1;
                    value = false;
                    setState(() {});
                    clientHomeController.showOrderIDList.clear();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: _selectedIndex == index ? AppColors.blueColor.withOpacity(0.1) : Colors.transparent,
                    border: Border.all(
                      width: _selectedIndex == index ? 2 : 1,
                      color: _selectedIndex == index ? AppColors.blueColor : Colors.grey.shade200,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'ID: ${widget.user.tickets![index].code}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _selectedIndex == index ? AppColors.blueColor : AppColors.blackColor,
                      fontFamily: 'Roboto',
                      fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: CustomTextFildMINE(
              tickedID: tickedIDMine,
            ),
          ),
          Center(
            child: CustomButton(
              onTap: () {
                FlutterPhoneDirectCaller.callNumber(
                  '+993${widget.user.phone}',
                );
              },
              withIcon: true,
              backColor: AppColors.lightBlue1Color,
              textColor: AppColors.blueColor,
            ),
          ),
        ],
      ),
    );
  }
}
