import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<double> getPrice(String id) async {
//   try {
//     var apiUrl =
//         "https://api.coingecko.com/api/v3/simple/price?ids=$id&vs_currencies=inr";
//     print(apiUrl);
//     final Uri url = Uri.parse(apiUrl);
//     var response = await http.get(url);
//     var json = jsonDecode(response.body);
//     print(id);
//     var value = json[id]['inr'].toString();
//     print(value);
//     return double.parse(value);
//   } catch (e) {
//     print(e.toString());
//     return 0.0;
//   }
// }

// Future<List<Map<String, dynamic>>> fetchData() async {
//   final response = await http.get(Uri.parse(
//       'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false&locale=en'));

//   if (response.statusCode != 200) {
//     print('Failed to fetch data: ${response.statusCode}');
//     return [];
//   }

//   final List<dynamic> rawData = json.decode(response.body);
//   final List<Map<String, dynamic>> mappedData = rawData.map((coin) {
//     return {
//       'id': coin['id'],
//       'symbol': coin['symbol'],
//       'name': coin['name'],
//       'image': coin['image'],
//       'current_price': coin['current_price'],
//       'market_cap': coin['market_cap'],
//       'market_cap_rank': coin['market_cap_rank'],
//       'fully_diluted_valuation': coin['fully_diluted_valuation'],
//       'total_volume': coin['total_volume'],
//       'high_24h': coin['high_24h'],
//       'low_24h': coin['low_24h'],
//       'price_change_24h': coin['price_change_24h'],
//       'price_change_percentage_24h': coin['price_change_percentage_24h'],
//       'market_cap_change_24h': coin['market_cap_change_24h'],
//       'market_cap_change_percentage_24h':
//           coin['market_cap_change_percentage_24h'],
//       'circulating_supply': coin['circulating_supply'],
//       'total_supply': coin['total_supply'],
//       'max_supply': coin['max_supply'],
//       'ath': coin['ath'],
//       'ath_change_percentage': coin['ath_change_percentage'],
//       'ath_date': coin['ath_date'],
//       'atl': coin['atl'],
//       'atl_change_percentage': coin['atl_change_percentage'],
//       'atl_date': coin['atl_date'],
//       'roi': coin['roi'],
//       'last_updated': coin['last_updated'],
//     };
//   }).toList();

//   return mappedData;
// }

//coin market cap api
// Future<List<dynamic>> makeAPICall() async {
//   var url = Uri.parse("https://pro-api.coinmarketcap.com/v1/cryptocurrency/map"
//       // "https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
//       );

//   var queryParams = {
//     'start': '1', 'limit': '20',
//     // 'convert': 'USD'
//   };
//   url = Uri.https(url.authority, url.path, queryParams);

//   var headers = {
//     'X-CMC_PRO_API_KEY': "7608fd61-7a82-4c08-8acc-24d8de875799",
//     // 'Accepts': 'application/json'
//   };

//   var response = await http.get(url, headers: headers);
//   if (response.statusCode == 200) {
//     var data = json.decode(response.body)['data'];
//     return data;
//   } else {
//     throw Exception('Failed to make API call');
//   }
// }
Future<List<dynamic>> makeAPICall(String symbol) async {
  var url = Uri.https("pro-api.coinmarketcap.com", "/v1/cryptocurrency/map", {
    // 'start': '1',
    // 'limit': '5000',
    'symbol': symbol
  });

  var headers = {
    'X-CMC_PRO_API_KEY': "7608fd61-7a82-4c08-8acc-24d8de875799",
  };

  var response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    var data = json.decode(response.body)['data'];
    return data;
  } else {
    throw Exception('Failed to make API call');
  }
}

List<Cryptocurrency> cryptocurrencies(String str) => List<Cryptocurrency>.from(
    json.decode(str)["data"].map((x) => Cryptocurrency.fromJson(x)));

class Cryptocurrency {
  Cryptocurrency({
    required this.id,
    required this.rank,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.isActive,
    required this.firstHistoricalData,
    required this.lastHistoricalData,
    required this.platform,
  });

  int id;
  int rank;
  String name;
  String symbol;
  String slug;
  int isActive;
  String firstHistoricalData;
  String lastHistoricalData;
  dynamic platform;

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) => Cryptocurrency(
        id: json["id"],
        rank: json["rank"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        isActive: json["is_active"],
        firstHistoricalData: json["first_historical_data"],
        lastHistoricalData: json["last_historical_data"],
        platform: json["platform"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "is_active": isActive,
        "first_historical_data": firstHistoricalData,
        "last_historical_data": lastHistoricalData,
        "platform": platform,
      };
}


// class Coin {
//   final int id;
//   final String name;
//   final String symbol;
//   final String category;
//   final String description;
//   final String slug;
//   final String logo;

//   Coin({
//     required this.id,
//     required this.name,
//     required this.symbol,
//     required this.category,
//     required this.description,
//     required this.slug,
//     required this.logo,
//   });

//   factory Coin.fromJson(Map<String, dynamic> json) {
//     return Coin(
//       id: json['id'],
//       name: json['name'],
//       symbol: json['symbol'],
//       category: json['category'],
//       description: json['description'],
//       slug: json['slug'],
//       logo: json['logo'],
//     );
//   }
// }

// Future<List<Coin>> fetchCoins() async {
//   final response = await http.get(Uri.parse('https://api.example.com/coins'));

//   if (response.statusCode == 200) {
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);

//     List<Coin> coins = [];

//     for (final coinJson in jsonResponse['data'].values) {
//       coins.add(Coin.fromJson(coinJson));
//     }

//     return coins;
//   } else {
//     throw Exception('Failed to load coins');
//   }
// }
