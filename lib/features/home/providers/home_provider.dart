import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_enorness/features/home/models/product.Item.dart';
import 'package:task_enorness/features/home/repository/home.repo.dart';

class DashboardProvider with ChangeNotifier {
  List<ProductItem>? _products;
  List<ProductItem>? get products => _products;
  String _productCount = '0';
  String get productCount => _productCount;
  String _totalSales = '0';
  String get totalSales => _totalSales;

  final HomeRepository _homeRepository = HomeRepository();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts(BuildContext context) async {
    _isLoading = true;
    await _homeRepository.getProducts(context).then((value) {
      _isLoading = false;
      debugPrint(value.toString());
      List<dynamic> productData = value['data']['new_orders'] as List;
      debugPrint(productData.toString());
      _productCount = value['data']['product_count'].toString();
      _totalSales = value['data']['total_sale'].toString();
      _products = List<ProductItem>.generate(
        productData.length,
        (index) => ProductItem(
          title: productData[index]['product_name'].toString(),
          subTitle: productData[index]['product_id'].toString(),
          date: productData[index]['booked'].toString(),
        ),
      );
      // _products = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      throw error.toString();
    });
  }
}
