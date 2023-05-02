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

Future<List<Map<String, dynamic>>> fetchData() async {
  final response = await http.get(Uri.parse(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false&locale=en'));

  if (response.statusCode != 200) {
    print('Failed to fetch data: ${response.statusCode}');
    return [];
  }

  final List<dynamic> rawData = json.decode(response.body);
  final List<Map<String, dynamic>> mappedData = rawData.map((coin) {
    return {
      'id': coin['id'],
      'symbol': coin['symbol'],
      'name': coin['name'],
      'image': coin['image'],
      'current_price': coin['current_price'],
      'market_cap': coin['market_cap'],
      'market_cap_rank': coin['market_cap_rank'],
      'fully_diluted_valuation': coin['fully_diluted_valuation'],
      'total_volume': coin['total_volume'],
      'high_24h': coin['high_24h'],
      'low_24h': coin['low_24h'],
      'price_change_24h': coin['price_change_24h'],
      'price_change_percentage_24h': coin['price_change_percentage_24h'],
      'market_cap_change_24h': coin['market_cap_change_24h'],
      'market_cap_change_percentage_24h':
          coin['market_cap_change_percentage_24h'],
      'circulating_supply': coin['circulating_supply'],
      'total_supply': coin['total_supply'],
      'max_supply': coin['max_supply'],
      'ath': coin['ath'],
      'ath_change_percentage': coin['ath_change_percentage'],
      'ath_date': coin['ath_date'],
      'atl': coin['atl'],
      'atl_change_percentage': coin['atl_change_percentage'],
      'atl_date': coin['atl_date'],
      'roi': coin['roi'],
      'last_updated': coin['last_updated'],
    };
  }).toList();

  return mappedData;
}
