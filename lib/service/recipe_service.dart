import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_ecipe/model/recipe_model.dart';

class RecipeService {
  Future<List<RecipeModel>> getRecipe() async {
    var uri = Uri.https("https://yummly2.p.rapidapi.com", "/feeds/list",
        {"limit": "18", "start": "0"});

    var respone = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'b6fc63c85bmsh5228c9c7e7785f7p1c8a4djsn8643cf1359f1',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
    });
    print(respone.statusCode);
    if (respone.statusCode == 200) {
      var data = jsonDecode(respone.body)["feed"];
      return (data["content"]["details"] as List)
          .map((data) => RecipeModel.formJson(data))
          .toList();
    } else {
      throw Exception();
    }
  }
}
