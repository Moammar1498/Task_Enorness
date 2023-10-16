import 'package:flutter/material.dart';
import 'package:task_enorness/features/graph/models/sale.model.dart';
import 'package:task_enorness/features/graph/repository/sales.repository.dart';

class SalesProvider with ChangeNotifier {
  List<WeekSale>? _weeklySales;
  List<WeekSale>? get weeklySales => _weeklySales;

  List<double>? _xAxis = [];
  List<double>? get xAxis => _xAxis;

  List<String>? _yAxis = [];
  List<String>? get yAxis => _yAxis;

  SalesStatus? _salesStatus;
  SalesStatus? get salesStatus => _salesStatus;

  String _productCount = '0';
  String get productCount => _productCount;

  String _productBookings = '0';
  String get productBookings => _productBookings;

  String _totalSales = '0';
  String get totalSales => _totalSales;

  final SalesRepository _salesRepository = SalesRepository();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchSales(BuildContext context) async {
    _isLoading = true;
    await _salesRepository.getSalesData(context).then((value) {
      _isLoading = false;
      debugPrint(value.toString());
      List<dynamic> weeklySales = value['data'] as List;
      _weeklySales = List<WeekSale>.generate(
          weeklySales.length,
          (index) => WeekSale(
                week: weeklySales[index]['type'].toString(),
                bookings: weeklySales[index]['booking_count'].toString(),
                sales: weeklySales[index]['sales_total'].toString(),
              ));

      debugPrint('${weeklySales.toString()} ${_weeklySales.toString()}');
      final xAxis = value['x-axis'] as List;

      _xAxis = List<double>.generate(xAxis.length, (i) => xAxis[i].toDouble());
      final yAxis = value['y-axis'] as List;
      _yAxis = List<String>.generate(yAxis.length, (i) => yAxis[i].toString());

      debugPrint('$_xAxis $_yAxis');

      _productCount = value['total_product'].toString();
      _totalSales = value['total_sales'].toString();
      _productBookings = value['total_booking'].toString();

      _salesStatus = SalesStatus(
        percentage: value['sales_status']['percentage'].toString(),
        status: value['sales_status']['status'].toString(),
      );
      debugPrint(_salesStatus.toString());
      notifyListeners();
    }).onError((error, stackTrace) {
      throw error.toString();
    });
  }
}
