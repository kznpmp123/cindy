import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/model/purchase.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: scaffoldBackground,
        appBar: AppBar(
          title: Text(
            "Begonia Clothing Brand",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          elevation: 5,
          backgroundColor: detailBackgroundColor,
          leading: IconButton(
            onPressed: Get.back,
            icon: Icon(
              Icons.arrow_back,
              color: appBarTitleColor,
            ),
          ),
          bottom: TabBar(
              unselectedLabelColor: Colors.grey.shade400,
              labelColor: Colors.grey.shade700,
              tabs: [
                Tab(
                  text: "Cash On Delivery",
                ),
                Tab(text: "Pre-Pay"),
              ]),
        ),
        body: TabBarView(
          children: [
            cashOnDeliveryCustomer(),
            prePayCustomer(),
          ],
        ),
      ),
    );
  }

  Widget cashOnDeliveryCustomer() {
    HomeController controller = Get.find();
    return ListView.builder(
      itemCount: controller.purchcasesCashOn().length,
      itemBuilder: (_, i) => ListTile(
        title: Text(
            "${controller.purchcasesCashOn()[i].name} 0${controller.purchcasesCashOn()[i].phone}"),
        subtitle: Text(
            "${controller.purchcasesCashOn()[i].dateTime?.day}/${controller.purchcasesCashOn()[i].dateTime?.month}/${controller.purchcasesCashOn()[i].dateTime?.year}"),
        trailing: IconButton(
          onPressed: () {
            int total = 0;
            int shipping = 2500;

            for (var item in controller.purchcasesCashOn()[i].items) {
              total += controller
                      .getItem(
                        item.toString().split(',')[0],
                      )
                      .price *
                  int.parse(item.toString().split(',').last);
            }

            print(controller.purchcasesCashOn()[i].items.length);
            Get.defaultDialog(
              title: "Customer ၀ယ်ယူခဲ့သော အချက်အလက်များ",
              titleStyle: TextStyle(fontSize: 12),
              radius: 5,
              content: purchaseDialogBox(
                  i: i,
                  total: total,
                  shipping: shipping,
                  list: controller.purchcasesPrePay()),
            );
          },
          icon: Icon(Icons.info),
        ),
      ),
    );
  }

  Widget prePayCustomer() {
    HomeController controller = Get.find();
    return ListView.builder(
      itemCount: controller.purchcasesPrePay().length,
      itemBuilder: (_, i) => ListTile(
        title: Text(
            "${controller.purchcasesPrePay()[i].name} 0${controller.purchcasesPrePay()[i].phone}"),
        subtitle: Text(
            "${controller.purchcasesPrePay()[i].dateTime?.day}/${controller.purchcasesPrePay()[i].dateTime?.month}/${controller.purchcasesPrePay()[i].dateTime?.year}"),
        trailing: !(controller.purchcasesPrePay()[i].bankSlipImage == null)
            ? InkWell(
                onTap: () {
                  int total = 0;
                  int shipping = int.parse(controller.shippingFee!);

                  for (var item in controller.purchcasesPrePay()[i].items) {
                    total += controller
                            .getItem(
                              item.toString().split(',')[0],
                            )
                            .price *
                        int.parse(item.toString().split(',').last);
                  }

                  print(controller.purchcasesPrePay()[i].items.length);
                  Get.defaultDialog(
                    title: "Customer ၀ယ်ယူခဲ့သော အချက်အလက်များ",
                    titleStyle: TextStyle(fontSize: 12),
                    radius: 5,
                    content: purchaseDialogBox(
                        i: i,
                        total: total,
                        shipping: shipping,
                        list: controller.purchcasesPrePay()),
                  );
                },
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl:
                        controller.purchcasesPrePay()[i].bankSlipImage ?? "",
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, status) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            value: status.progress,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              )
            : IconButton(
                onPressed: () {
                  int total = 0;
                  int shipping = 2500;

                  for (var item in controller.purchcasesPrePay()[i].items) {
                    total += controller
                            .getItem(
                              item.toString().split(',')[0],
                            )
                            .price *
                        int.parse(item.toString().split(',').last);
                  }

                  print(controller.purchcasesPrePay()[i].items.length);
                  Get.defaultDialog(
                    title: "Customer ၀ယ်ယူခဲ့သော အချက်အလက်များ",
                    titleStyle: TextStyle(fontSize: 12),
                    radius: 5,
                    content: purchaseDialogBox(
                        i: i,
                        total: total,
                        shipping: shipping,
                        list: controller.purchcasesPrePay()),
                  );
                },
                icon: Icon(Icons.info),
              ),
      ),
    );
  }

  Widget purchaseDialogBox({
    required int i,
    required int total,
    required int shipping,
    required List<PurchaseModel> list,
  }) {
    HomeController controller = Get.find();
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text("Invoice Id"),
        //     Text("${list[i].id}"),
        //   ],
        // ),
        // SizedBox(
        //   height: 5,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Purchase Date"),
            Text(
              "၀ယ်ယူခဲ့သော နေ့ရက် - ${list[i].dateTime?.day}/${list[i].dateTime?.month}/${list[i].dateTime?.year}",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Name"),
            Text(
              list[i].name,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Ph No."),
            Text(
              "0${list[i].phone}",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Email"),
            Text(
              list[i].email,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),

        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Address"),
            Expanded(
                child: Text(
              list[i].address,
              style: TextStyle(fontSize: 14),
            )),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          width: 400,
          height: 150,
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: list[i].items.length,
            itemBuilder: (_, o) => Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${o + 1}. ${controller.getItem(
                          list[i].items[o].toString().split(',')[0],
                        ).name}",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${list[i].items[o].toString().split(',')[1]}",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "${list[i].items[o].toString().split(',')[2]}",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "${controller.getItem(
                          list[i].items[o].toString().split(',')[0],
                        ).price} x ${list[i].items[o].toString().split(',').last} ထည်",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "စုစုပေါင်း",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "$total + Deli $shipping Ks",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
