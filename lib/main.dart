import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
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
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(left: 20.0, top: 16.0),
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
          Container(
            width: double.infinity,
            height: 350,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (BuildContext ctx, int position) {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                  child: ItemPriceRow(),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                if (index % 9 == 0) {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                    child: adv(),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemPriceRow extends StatelessWidget {
  const ItemPriceRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 1.0, color: Colors.grey)],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("CAD", style: Theme.of(context).textTheme.bodyText1),
          Text("23.00", style: Theme.of(context).textTheme.bodyText1),
          Text("+3", style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}

class adv extends StatelessWidget {
  const adv({
    Key? key,
  }) : super(key: key);

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
