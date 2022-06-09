import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'model/Currency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as dev;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(
        fontFamily: "Robo",
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: "Robo",
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontFamily: "Robo",
            fontSize: 13,
            fontWeight: FontWeight.w100,
            color: Colors.black87,
          ),
          headline2: TextStyle(
            fontFamily: "Robo",
            fontSize: 14,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontFamily: "Robo",
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          headline4: TextStyle(
            fontFamily: "Robo",
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.red,
          ),
          headline5: TextStyle(
            fontFamily: "Robo",
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.green,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Currency> currency = [];

  getResponse(BuildContext context) {
    String url =
        "http://sasansafari.com/flutter/api.php?access_key=flutter123456";

    http.get(Uri.parse(url)).then(
      (value) {
        if (currency.isEmpty) {
          if (value.statusCode == 200) {
            List jsonList = convert.jsonDecode(value.body);

            // dev.log(value.body, name: "mamali");

            if (jsonList.isNotEmpty) {
              for (int i = 0; i < jsonList.length; i++) {
                setState(() {
                  currency.add(
                    Currency(
                      id: jsonList[i]["id"],
                      title: jsonList[i]["title"],
                      price: jsonList[i]["price"],
                      changes: jsonList[i]["changes"],
                      status: jsonList[i]["status"],
                    ),
                  );
                });
              }
            }
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // currency.add(Currency(
    //     id: "1", title: "USD", price: '1000', changes: "+5", status: 'p'));
    // currency.add(Currency(
    //     id: "1", title: "CAD", price: '1000', changes: "+2", status: 'n'));
    // currency.add(Currency(
    //     id: "1", title: "USD", price: '1000', changes: "+1", status: 'p'));
    // currency.add(Currency(
    //     id: "1", title: "USD", price: '1000', changes: "+4", status: 'p'));
    // currency.add(Currency(
    //     id: "1", title: "USD", price: '1000', changes: "+2", status: 'p'));
    getResponse(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          const SizedBox(
            width: 8,
          ),
          Image.asset("assets/images/icon.png"),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Crypto Price App",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset("assets/images/menu.png"),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 16.0),
            child: Row(
              children: [
                Image.asset("assets/images/faq.png"),
                const SizedBox(
                  width: 5,
                ),
                Text("Crypto Price",
                    style: Theme.of(context).textTheme.headline1),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "The prices are real and you should try and search in my app every minutes ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 35,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Color.fromARGB(255, 130, 130, 130),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Crypto Name",
                      style: Theme.of(context).textTheme.headline2),
                  Text("Price", style: Theme.of(context).textTheme.headline2),
                  Text("Changes", style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 350,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: currency.length,
              itemBuilder: (BuildContext ctx, int position) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                  child: ItemPriceRow(position, currency),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                if (index % 9 == 0) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                    child: adv(),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 232, 232, 232),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextButton.icon(
                      onPressed: () => _showSnackBar(context, 'success'),
                      icon: const Icon(
                        CupertinoIcons.refresh,
                        color: Colors.white,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          'Refresh',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 254, 0, 0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text("Last Update ${_getTime()}"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

String _getTime() {
  return "20:45";
}

void _showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg, style: Theme.of(context).textTheme.headline2),
      backgroundColor: Colors.green));
}

class ItemPriceRow extends StatelessWidget {
  int position;
  List<Currency> currency;

  ItemPriceRow(this.position, this.currency);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 1.0, color: Colors.grey)],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(currency[position].title!,
              style: Theme.of(context).textTheme.bodyText1),
          Text(currency[position].price!,
              style: Theme.of(context).textTheme.bodyText1),
          Text(currency[position].changes!,
              style: currency[position].status == "n"
                  ? Theme.of(context).textTheme.headline4
                  : Theme.of(context).textTheme.headline5),
        ],
      ),
    );
  }
}

class adv extends StatelessWidget {
  adv();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 1.0, color: Colors.grey)],
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("ADV", style: Theme.of(context).textTheme.headline2),
        ],
      ),
    );
  }
}
