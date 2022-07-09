import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/controllers/product_controllers.dart';

class ProductScreen extends StatelessWidget {
  final productcontroller = Get.put(Productcontroller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("All Product List"),
        actions: [
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
                label:GetX<Productcontroller>(builder: ((controller) {
                  return  Text(productcontroller.count.toString());
                }))
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<Productcontroller>(
              builder: ((controller) {
                return ListView.builder(
                  itemCount: productcontroller.productdata.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 5,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 120,
                              width: double.infinity,
                              child: Image.asset(
                                productcontroller
                                    .productdata[index].productimage,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              height: 40,
                              width: double.infinity,
                              child: Text(
                                productcontroller
                                    .productdata[index].productname,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 80,
                              width: double.infinity,
                              child: Text(
                                productcontroller
                                    .productdata[index].productdescription,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price:${productcontroller.productdata[index].price}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      productcontroller.addtocard(productcontroller.productdata[index]);
                                    },
                                    child: Text(
                                      "Add to Card",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
         GetX<Productcontroller>(builder: ((controller) {
            return Text(
            "Total Amount:${productcontroller.totalprice}",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          );
         })
         ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
