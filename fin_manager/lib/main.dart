import 'package:fin_manager/estimated_taxes.dart';
import 'package:fin_manager/income_expense_button.dart';
import 'package:fin_manager/line_graph.dart';
import 'package:fin_manager/models.dart';
import 'package:fin_manager/news.dart';
import 'package:fin_manager/panel.dart';
import 'package:fin_manager/pie_chart.dart';
import 'package:fin_manager/profile.dart';
import 'package:fin_manager/stocks_crypto.dart';
import 'package:fin_manager/wealth.dart';
import 'package:flutter/material.dart';
import 'package:fin_manager/auth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'FinManager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.user,}) : super(key: key);

  final User user;

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 5, 46, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.425,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Panel(
                      width: MediaQuery.of(context).size.height * 0.425,
                      height: MediaQuery.of(context).size.height * 0.425,
                      child: const Center(
                        child: PieChartWidget(),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95 - MediaQuery.of(context).size.height * 0.425 - MediaQuery.of(context).size.width * 0.07,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Panel(
                                height: MediaQuery.of(context).size.height * 0.1875,
                                width: MediaQuery.of(context).size.height * 0.1875,
                                child: const IncomeExpenseButton(
                                  type: "Income"
                                )
                              ),
                              Panel(
                                height: MediaQuery.of(context).size.height * 0.1875,
                                width: MediaQuery.of(context).size.width * 0.275,
                                child: Center(
                                  child: News(
                                    title: "Nano-X Stock Rising After Recent Merger",
                                    preview: "After the announcement of FDA approval on the Nano-X (NNOX) Cloud II, the stock is rising. Earlier on Saturday, the announcement was made about the new exciting technology.",
                                    icon: Image.asset(
                                      'images/MotleyFoolLogo.png',
                                      cacheWidth: (MediaQuery.of(context).size.height * 0.1).toInt(),
                                    )
                                  )
                                ),
                              ),
                              Panel(
                                height: MediaQuery.of(context).size.height * 0.1875,
                                width: MediaQuery.of(context).size.width * 0.175,
                                child: ProfileWidget(user: widget.user),
                              )
                            ]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Panel(
                                height: MediaQuery.of(context).size.height * 0.1875,
                                width: MediaQuery.of(context).size.width * 0.275,
                                child: Wealth(user: widget.user),
                              ),
                              Panel(
                                height: MediaQuery.of(context).size.height * 0.1875,
                                width: MediaQuery.of(context).size.width * 0.175,
                                child: EstTaxes(wealth: widget.user.wealth),
                              ),
                              Panel(
                                height: MediaQuery.of(context).size.height * 0.1875,
                                width: MediaQuery.of(context).size.height * 0.1875,
                                child: const IncomeExpenseButton(
                                  type: "Expense"
                                )
                              )
                            ]
                          ),
                        ],
                      )
                    )
                  ],
                )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.425,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Panel(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.425,
                      child: StocksCrypto(user: widget.user)
                    ),
                    Panel(
                      width: MediaQuery.of(context).size.width * 0.73,
                      height: MediaQuery.of(context).size.height * 0.425,
                      child: const LineGraphWidget()
                    ),
                  ],
                )
              ),
            ]
          )
        )
      )
    );
  }
}