import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/expaned_widget.dart';
import 'home_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      backgroundColor: detailTextBackgroundColor,
      appBar: AppBar(
        title: Text(controller.selectedItem.value.name,
          style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16),),
        elevation: 0,
        backgroundColor: detailBackgroundColor,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),),
              child: Hero(
                tag: controller.selectedItem.value.photo,
                child: CarouselSlider(
                  items: [
                    CachedNetworkImage(
                      imageUrl: controller.selectedItem.value.photo,
                      // "$baseUrl$itemUrl${controller.selectedItem.value.photo}/get",
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    CachedNetworkImage(
                      imageUrl: controller.selectedItem.value.photo2,
                      // "$baseUrl$itemUrl${controller.selectedItem.value.photo}/get",
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    CachedNetworkImage(
                      imageUrl: controller.selectedItem.value.photo3,
                      // "$baseUrl$itemUrl${controller.selectedItem.value.photo}/get",
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],

                    options: CarouselOptions(
                      height: 400,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    )

                ),
              ),
            ),

          Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: detailTextBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),

                Text(controller.selectedItem.value.name,
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),),

                SizedBox(height: 20),

                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      size: 20,
                      color: index <= controller.selectedItem.value.star
                          ? homeIndicatorColor
                          : Colors.grey,
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Category    : ",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),),




                    Text(
                      controller.selectedItem.value.category,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),),
                  ],),

                SizedBox(
                  height: 20,
                ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Sale Price   : ",
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),),

                Text(
                  "${controller.selectedItem.value.discountprice} ကျပ်",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),

                Text("${controller.selectedItem.value.price} ကျပ်",
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),


                ],
            ),

                SizedBox(
                  height: 10,
                ),

                ExpandedWidget(text: controller.selectedItem.value.desc,),

                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "⏰ Delivery Time",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.selectedItem.value.deliverytime,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "👚 Brand",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.selectedItem.value.brand,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "📞 Contact Phone ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "     09 7777 0 222 8",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: controller.selectedItem.value.photo2,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: controller.selectedItem.value.photo3,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "🏠 Shop - 1  ( Thanlyin )",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'အမှတ် 116 ၊ သတိပဌာန်လမ်း ၊ မြို့မတောင်ရပ်ကွက် ၊ သန်လျင်မြို့နယ် ၊ ရန်ကုန်မြို့။',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),

                SizedBox(
                  height: 20,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "🏠 Shop - 2  ( Dawbon )",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'အမှတ် 192 ၊ ယမုံနာလမ်း ၊ ဇေယျာသီရိရပ်ကွက်, ဒေါပုံမြို့နယ် ။ (မာန်ပြေကားဂိတ်နားမရောက်ခင်...ဇေယျာသီရိ ၈ လမ်းထိပ်)',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                  ],
                ),
          )
        ],
      ),
      bottomNavigationBar:
      Container(

        width: double.infinity,
        height: 65,
        // decoration: BoxDecoration(
        //   color: detailBackgroundColor,
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(20),
        //     topRight: Radius.circular(20),
        //   ),
        // ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            Get.defaultDialog(
              titlePadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              radius: 0,
              title: '',
              content: AddToCart(),
            );
          },
          child: Text("၀ယ်ယူရန်"),
        ),
      ),
    );
  }
}

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key? key,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  String? colorValue;
  String? sizeValue;
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Column(
      children: [
        DropdownButtonFormField(
          value: colorValue,
          hint: Text('Color', style: TextStyle(fontSize: 12),),
          onChanged: (String? e) {
            colorValue = e;
          },
          items: controller.selectedItem.value.color
              .split(',')
              .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e, style: TextStyle(fontSize: 12),),
          ))
              .toList(),
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButtonFormField(
          value: sizeValue,
          hint: Text("Size", style: TextStyle(fontSize: 12),),
          onChanged: (String? e) {
            sizeValue = e;
          },
          items: controller.selectedItem.value.size
              .split(',')
              .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e, style: TextStyle(fontSize: 12),),
          ))
              .toList(),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
            style: buttonStyle,
            onPressed: () {
              if (colorValue != null && sizeValue != null) {
                controller.addToCart(
                    controller.selectedItem.value, colorValue!, sizeValue!);
                Get.to(HomeScreen());
              }
            },
            child: Text("၀ယ်ယူရန်"),
          ),
        )
      ],
    );

  }
}
