import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;
import '../interfaces/cart.dart';
import '../interfaces/products.dart';
import 'dart:math';

import 'cart.dart';
import 'connection.dart';
import 'mappers.dart';

class HttpsCalls {
  final Mapper mapper = Mapper();
  final String baseUrl = 'fakestoreapi.com';
  final Client client = HttpConnection().getClient();

  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      Response response =
          await makeHttpCall('/products/category/$category', null);

      var jsonResponse = convert.jsonDecode(response.body);
      List<Product> mappedResponse = mapper.getMappedResponse(jsonResponse);
      return mappedResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>> getAllProductsLimit(int limit) async {
    try {
      Response response =
          await makeHttpCall('/products', {'limit': limit.toString()});

      var jsonResponse = convert.jsonDecode(response.body);
      List<Product> mappedResponse = mapper.getMappedResponse(jsonResponse);
      return mappedResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> getRandomProducts(String id) async {
    try {
      Response response = await makeHttpCall('/products/$id', null);
      var jsonResponse = convert.jsonDecode(response.body);
      Product mappedResponse = mapper.getSingleMappedResponse(jsonResponse);
      return mappedResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<CartItems> addToCart(CartItems cart) async {
    try {
      Response response = await makePostHttpCall('/carts', cart);
      var jsonResponse = convert.jsonDecode(response.body);

      var t = jsonResponse['products'];
      var products = mapper.getMappedAllCartProductResponse(t);
      jsonResponse['products'] = products;

      print(mapper.getMappedCartResponse(jsonResponse));
      return mapper.getMappedCartResponse(jsonResponse);
    } catch (e) {
      rethrow;
    }
  }

  Future<CartItems> getCart(String userId) async {
    try {
      Response response = await makeHttpCall('carts/user/$userId', null);

      var jsonResponse = convert.jsonDecode(response.body);

      if (jsonResponse.length == 0) {
        Map<String, dynamic> res = {};
        return mapper.getMappedCartResponse(res);
      } else {
        var t = jsonResponse[0]['products'];
        var products = mapper.getMappedAllCartProductResponse(t);
        CartItems mappedResponse =
            mapper.getMappedCartResponse(jsonResponse[0]);
        return mappedResponse;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> makePostHttpCall(
      String cartUrl, CartItems requestBody) async {
    var uri = Uri.https(baseUrl, cartUrl);
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var s = requestBody.toJson();
    var t = requestBody.products.map((element) => element.toJson()).toList();
    s['products'] = t;
    var body = jsonEncode(s);
    Response response = await client.post(uri, headers: header, body: body);
    print('response');
    print(response.body);
    return response;
  }

  Future<http.Response> makeHttpCall(
      String productUrl, Map<String, String>? queryParams) async {
    Uri uri;
    if (queryParams == null)
      uri = Uri.https(baseUrl, productUrl);
    else
      uri = Uri.https(baseUrl, productUrl, queryParams);
    try {
      Response response = await client.get(uri);
      if (response.statusCode != 200) {
        print(response.statusCode);
        throw response.body;
      }
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
