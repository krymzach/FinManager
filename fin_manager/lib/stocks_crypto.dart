import 'package:fin_manager/models.dart';
import 'package:flutter/material.dart';
import 'package:yahoofin/yahoofin.dart';

class StocksCrypto extends StatefulWidget {
  const StocksCrypto({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<StocksCrypto> createState() => StocksCryptoState();
}

class StocksCryptoState extends State<StocksCrypto> {

  @override
  Widget build(BuildContext context) {
    if(widget.user.tickers.isNotEmpty) {
      return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            for(int i = 0; i <  widget.user.tickers.length; i++)
              if(((24 + MediaQuery.of(context).size.height * 0.01) * (i + 1)) < (MediaQuery.of(context).size.height * 0.425 - MediaQuery.of(context).size.width * 0.04))
                TickerPercentage(ticker: widget.user.tickers[i])
          ],
        )
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(35),
              child: Text(
                "You Have No Stock Tickers Set Up, Press Here to Add a Ticker:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                )
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
              height: MediaQuery.of(context).size.width * 0.05,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(53, 173, 87, 1)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.025)
                  ))
                ),
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.02,
                )
              )
            ),
          ],
        )
      );
    }
  }
}




class TickerPercentage extends StatefulWidget {
  const TickerPercentage({Key? key, required this.ticker}) : super(key: key);

  final String ticker;

  @override
  State<TickerPercentage> createState() => TickerPercentageState();
}

class TickerPercentageState extends State<TickerPercentage> {

  Future<String> getPercentageChange() async {
    final yfin = YahooFin();
    StockInfo info = yfin.getStockInfo(ticker: widget.ticker.toLowerCase());
    StockQuote change = await info.getStockPriceChange();
    return (change.regularMarketChangePercent)!.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          widget.ticker,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        FutureBuilder<String>(
          future: getPercentageChange(),
          builder:(context, snapshot) {
            if(snapshot.hasData) {
              if(double.parse(snapshot.data!) > 0) {
                return Text(
                  snapshot.data! + "%",
                  style: const TextStyle(
                    color: Color.fromRGBO(53, 173, 87, 1),
                    fontSize: 24
                  ),
                );
              } else if(double.parse(snapshot.data!) < 0) {
                return Text(
                  snapshot.data! + "%",
                  style: const TextStyle(
                    color: Color.fromRGBO(237, 93, 93, 1),
                    fontSize: 24
                  ),
                );
              } else {
                return Text(
                  snapshot.data! + "%",
                  style: const TextStyle(
                    color: Color.fromRGBO(229, 229, 229, 1),
                    fontSize: 24
                  ),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          }
        )
      ],
    );
  }
}