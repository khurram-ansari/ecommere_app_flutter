import 'dart:convert';
import 'package:ecommereapp/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:ecommereapp/models/category.dart';
class api{
  String url="https://demostore.sparktechsolutions.org";
  String consumer_key='ck_5737fee8dceb52b5bd9ae11210dddfc9e43e8ded';
  String consumer_secret='cs_263c2d81aa906d2f6f4eaf673619c60512ecdca2';
  var defaulticon='https://zenit.org/wp-content/uploads/2018/05/no-image-icon.png';

  Future<List<Category>> getcat() async{


    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$consumer_key:$consumer_secret'));
    http.Response response=await http.get(url+"/wp-json/wc/v3/products/categories",

        headers:{
          'authorization':basicAuth
        });
    var categories=List<Category>();
    var catData=json.decode(response.body);
    for (var categoryData in catData){
      Category cat=new Category(
          category: categoryData['name'],
          id: categoryData['id'],
          image: categoryData['image']!=null ? categoryData['image']['src'] : defaulticon
      );
      categories.add(cat);
    }
    return categories;
//	categories = catData.map((i)=>Category.fromJson(i)).toList();

  }
  Future<List<Product>> getfeaturedProd() async {
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$consumer_key:$consumer_secret'));
    http.Response response=await http.get(url+"/wp-json/wc/v3/products?featured=true",

        headers:{
          'authorization':basicAuth
        });
    var F_Products=List<Product>();
    var Fproddata=json.decode(response.body);
    for (var fprod in Fproddata){
      Product product=new Product(
        id: fprod['id'],
        name: fprod['name'],
        onsale: fprod['on_sale'],
        price: double.tryParse(fprod['price']),
        saleprice: double.tryParse(fprod['sale_price']),
          regularprice: double.tryParse(fprod['regular_price']),
          image: fprod['images']!=null ? fprod['images'][0]['src'] : defaulticon
      );
      F_Products.add(product);
    }
    return F_Products;
  }
}