import 'package:get/get.dart';
import 'package:state_management/models/products_models.dart';

class Productcontroller extends GetxController {
  List<Product> productdata = [];

  List<Product> carditem = List<Product>.empty().obs;

  addtocard(Product item){
    carditem.add(item);
  }

  int get count => carditem.length;
  double get totalprice => carditem.fold(0, (sum, item) => sum+item.price);
  
  @override
  void onInit() {
    super.onInit();
    fatchproductdata();
  }

  fatchproductdata() async {
    await Future.delayed(
      Duration(
        seconds: 5,
      ),
    );

    List<Product> serverresponse = [
      Product(
        id: 1,
        productname: "Red T-Shirt",
        productimage: "assets/images/shirt.jpg",
        productdescription:
            "A T-shirt, or tee, is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally, it has short sleeves and a round neckline, known as a crew neck, which lacks a collar. T-shirts are generally made of a stretchy, light, and inexpensive fabric and are easy to clean.",
        price: 500,
      ),
      Product(
        id: 2,
        productname: "Car",
        productimage: "assets/images/car.jpg",
        productdescription:
            "Getting a car gives you the freedom to commute anywhere you need to. If you need to take a quick grocery trip you don't need to worry about the weather bogging down public transport. A car can help you facilitate many daily tasks. If you lead a busy life, a car can make your life so much easier.",
        price: 500,
      ),
      Product(
        id: 3,
        productname: "Bus",
        productimage: "assets/images/bus.jpg",
        productdescription:
            "noun, plural bus·es, bus·ses. a large motor vehicle, having a long body, equipped with seats or benches for passengers, usually operating as part of a scheduled service; omnibus. a similar horse-drawn vehicle. a passenger automobile or airplane used in a manner resembling that of a bus.",
        price: 500,
      ),
      Product(
        id: 4,
        productname: "Aeroplan",
        productimage: "assets/images/aeroplan.jpg",
        productdescription:
            "1, I've never flown in an aeroplane. 2, An aeroplane is roaring overhead. 3, The guerrillas shot down one aeroplane and captured the pilot. 4, The aeroplane had to make a forced landing because one of the engines cut out.",
        price: 500,
      ),
    ];
    productdata.assignAll(serverresponse);
    update();
  }
}
