import 'dart:convert';

import 'package:aula_consumo_apis/app/data/http/exceptions.dart';
import 'package:aula_consumo_apis/app/data/http/http_client.dart';
import 'package:aula_consumo_apis/app/data/models/produto_models.dart';

abstract class IProdutoRepository{
  Future<List<ProdutoModel>> getProdutos();
}

class ProdutoRepository implements IProdutoRepository{
  final IHttpClient client;
  ProdutoRepository({required this.client});

  @override
  Future<List<ProdutoModel>> getProdutos() async{
    final response = await client.get(url: 'https://dummyjson.com/products');

    if(response.statusCode == 200){
      final List<ProdutoModel> produtos = [];
      final body = jsonDecode(response.body);

      for (var item in body['products']) {
        final ProdutoModel produto = ProdutoModel.fromMap(item);
        produtos.add(produto);
      }

      return produtos;
    }else if(response.statusCode == 404){
        throw NotFoundException('A Url INFORMADA NÃO É VÁLIDA');
    }else{
      throw Exception('Não foi possível carregar os produtos');
    }
    
  }
}