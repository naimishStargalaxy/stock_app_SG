// ignore_for_file: use_function_type_syntax_for_parameters

class CurrencyData {
  String currencyName;
  String currency;
  String image;
  String from;
  String to;
  String fullname;

  CurrencyData({
    required this.currency,
    required this.currencyName,
    required this.image,
    required this.from,
    required this.to,
    required this.fullname,
  });
}

List<CurrencyData> currencyData = [
  CurrencyData(
    currency: "EURUSD",
    currencyName: "EUR to USD",
    image:
        "https://media.istockphoto.com/id/535455058/photo/flags-of-the-usa-and-the-european-union-american-flag.jpg?s=2048x2048&w=is&k=20&c=baYKbKt-KCVIRIuP1Wt8VcQTq34lnyIX8ptLB6rT-1Q=",
    from: "EUR",
    to: "USD",
    fullname: "Europion Euro Vs US Dollar",
  ),
  CurrencyData(
    currency: "GBPUSD",
    currencyName: "GBP to USD",
    image:
        "https://media.istockphoto.com/id/1024325286/photo/us-and-canada-on-crumpled-paper-difficult-policy-and-relations-concept.jpg?s=2048x2048&w=is&k=20&c=cAsytupSCFjinhVb5EiK7eNl100nCkyugEg-2AJitMM=",
    from: "GBP",
    to: "USD",
    fullname: "Great Britain Pound Vs US Dollar",
  ),
  CurrencyData(
    currency: "USDJPY",
    currencyName: "USD to JPY",
    image:
        "https://media.istockphoto.com/id/1150892900/photo/american-and-japanese-flags-standing-side-by-side.jpg?s=2048x2048&w=is&k=20&c=hh1IfniqnoRR7M1W8WPyZOvvmbFkjXs1S7iHV8q_KkI=",
    from: "USD",
    to: "JPY",
    fullname: "US Dollar Vs Japanese Yen",
  ),
  CurrencyData(
    currency: "USDCHF",
    currencyName: "USD to CHF",
    image:
        "https://media.istockphoto.com/id/475339764/photo/usa-and-georgia.jpg?s=2048x2048&w=is&k=20&c=xn1BuQFKDqyOnT8ZI3y8TuhnzwYfr15OnfIJr6405cg=",
    from: "USD",
    to: "CHF",
    fullname: "US Dollar Vs Swiss Francs",
  ),
  CurrencyData(
    currency: "USDCAD",
    currencyName: "USD to CAD",
    image:
        "https://media.istockphoto.com/id/1285275723/photo/flags-of-canada-and-usa-folded-together.jpg?s=2048x2048&w=is&k=20&c=72tuioOSvkGmue5b8WP8ch6AzXLUSQ8vOnpIomV8Isg=",
    from: "USD",
    to: "CAD",
    fullname: "US Dollar Vs Canadian Dollar",
  ),
  CurrencyData(
    currency: "XAUUSD",
    currencyName: "XAU to USD",
    image: "",
    from: "XAU",
    to: "USD",
    fullname: "No Data",
  ),
  CurrencyData(
    currency: "USOIL",
    currencyName: "US to OIL",
    image: "",
    from: "US",
    to: "OIL",
    fullname: "No Data",
  ),
  CurrencyData(
    currency: "US30",
    currencyName: "US30",
    image: "",
    from: "EUR",
    to: "USD",
    fullname: "No Data",
  ),
  CurrencyData(
    currency: "BTCUSD",
    currencyName: "BTC to USD",
    image: "",
    from: "BTC",
    to: "USD",
    fullname: "No Data",
  ),
];





// 1.10009, 1.23830, 152.52, 0.90803, 1.37062, 2405.8, 27.3, 81.7, 37497, 56513/
// 1.06131, 1.24061, 152.97, 0.90967, 1.37362, 2424.3, 27.66, 82.61, 37692, 59781/
// 1.06243, 1.24293, 153.43, 0.91131, 1.37662, 2442.8, 28.13, 83.53, 37887, 63149/
// 1.06455, 1.24524, 153.88, 0.91295, 1.37962, 2461.3, 28.39, 84.44, 38182, 63217/
// 1.06667, 1.24756, 154.34, 0.91459, 1.38261, 2479.8, 28.76, 85.36, 38277, 69584/
// 1.06879, 1.24987, 154.79, 0.91623, 1.38561, 2498.3, 29.12, 86.27, 38472, 72852/
// 1.07091, 1.25219, 155.35, 0.91787, 1.38861, 2624.145, 29.49, 87.19, 38667, 76120

// Api Url =  https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=USD&to_currency=JPY&apikey=52AOMWS2NTQQPYTL

// Api Key = 52AOMWS2NTQQPYTL

// Api Key = 39f3f3f7250955e93b0c6c76b560cc92




