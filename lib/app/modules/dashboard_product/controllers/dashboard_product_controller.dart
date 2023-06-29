import 'package:get/get.dart';
import 'package:test_abersoft/app/data/models/product/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardProductController extends GetxController {
  //TODO: Implement DashboardProductController

  final count = 0.obs;

  void increment() => count.value++;

  Future<List<Product>> getAllProduct() async {
    Uri uri = Uri.parse(
        "https://2e3d13cc-3d6d-4911-b94c-ba23cf332933.mock.pstmn.io/api/v1/products");
    var response = await http.get(uri); //future utk mendapatkan responsenya

    //print(response.body);

    //ambil ["data"] nya
    //merupbah dari string decodenya dynamic, set ke mapping dynamicnya
    //tipe datanya List, bukan var, ? artinya blm tent ada
    List? data = (json.decode(response.body) as Map<String, dynamic>)["data"];

    //print(data);

    if (data == null || data.isEmpty) {
      return [];
    } else {
      //kalau ada, muncul semua datanya di console
      //e nya rubah dari API ke dalam bentuk json (bentuknya List)
      return data.map((e) => Product.fromJson(e)).toList();

      // SurahModel surahAllFalaq = SurahModel.fromJson(data[112]);

      //pasang list of model
    }
  }
}
