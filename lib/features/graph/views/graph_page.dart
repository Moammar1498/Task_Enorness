import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_enorness/features/graph/providers/sales.provider.dart';
import 'package:task_enorness/utils/utlils.dart';

import '../widgets/card_middle.dart';
import '../widgets/sales_report_chart.dart';
import '../widgets/sells_selector_widget.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  void initState() {
    final salesProvider = Provider.of<SalesProvider>(context, listen: false);
    salesProvider.fetchSales(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final salesProvider = Provider.of<SalesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Utils.mainAppNav.currentState?.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Sales Report',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SellsSelectorWidget(),
                          SellsSelectorWidget(),
                          SellsSelectorWidget(),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Booking Progress',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Oct 2023',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Center(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                              child: SalesReportChart(
                                  xData: salesProvider.xAxis,
                                  yData: salesProvider.yAxis)),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CardMiddle(
                              label: 'Status',
                              status: salesProvider.salesStatus?.status
                                      .toString() ??
                                  '',
                              icon: const Icon(null),
                              salesPercentage: salesProvider
                                  .salesStatus?.percentage
                                  .toString(),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CardMiddle(
                              label: 'Total Sales',
                              status: salesProvider.totalSales.toString(),
                              icon: const Icon(Icons.auto_graph),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CardMiddle(
                              label: 'Total Bookings',
                              icon: const Icon(Icons.check_box),
                              status: salesProvider.productBookings.toString(),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CardMiddle(
                              label: 'Total Products',
                              icon:
                                  const Icon(Icons.production_quantity_limits),
                              status: salesProvider.productCount.toString(),
                            ),
                          ],
                        ),
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Consumer<SalesProvider>(
                      builder: (context, weeklySales, child) {
                        return weeklySales.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                itemCount: weeklySales.weeklySales?.length,
                                itemBuilder: (context, index) {
                                  var item = weeklySales.weeklySales?[index];
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(item!.week.toString()),
                                          Text(item.bookings.toString()),
                                          Text('\$${item.sales.toString()}')
                                        ],
                                      ),
                                    ),
                                  );
                                });
                      },
                    ))
              ],
            )),
      ),
    );
  }
}
