// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';
import 'package:kargo_app/src/screens/clientHome/components/custom_button.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/region_model.dart';
import 'package:kargo_app/src/screens/clientHome/data/services/region_service.dart';
import 'package:kargo_app/src/screens/clientHome/orders_screen.dart';

class ClientInfoCardSlider extends StatelessWidget {
  const ClientInfoCardSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientHomeController clientHomeController =
        Get.put(ClientHomeController());
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 70),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Obx(
            () => FutureBuilder<List<Datum>>(
              future: RegionService()
                  .fetchRegion(id: clientHomeController.locationId.value),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error fetching data: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Text(
                                  snapshot.data![index].userName ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColors.mainTextColor,
                                    fontFamily: 'ALSHauss',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Text(
                                '${snapshot.data![index].debt} TMT',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.redColor,
                                  fontFamily: 'ALSHauss',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(onTap: () {
                                clientHomeController.selectUserId(
                                    value: snapshot.data![index].id.toString(),);
                                Get.to(() => OrdersScreen(
                                      index: index,
                                    ),);
                              },),
                              CustomButton(
                                onTap: () =>
                                    FlutterPhoneDirectCaller.callNumber(
                                  '+993${snapshot.data![index].phone}',
                                ),
                                withIcon: true,
                                backColor: AppColors.lightBlue1Color,
                                textColor: AppColors.blueColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.grey2Color,
                    ),
                    itemCount: snapshot.data!.length,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
