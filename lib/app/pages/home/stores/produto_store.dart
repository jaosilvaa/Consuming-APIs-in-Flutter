import 'package:aula_consumo_apis/app/data/http/exceptions.dart';
import 'package:aula_consumo_apis/app/data/models/produto_models.dart';
import 'package:aula_consumo_apis/app/data/repositories/produto_repository.dart';
import 'package:flutter/material.dart';

class ProdutoStore {
  final IProdutoRepository repository;

  // Variável reativa para o estado de carregamento
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para armazenar os produtos
  final ValueNotifier<List<ProdutoModel>> state = ValueNotifier<List<ProdutoModel>>([]);

  // Variável reativa para armazenar erros
  final ValueNotifier<String> error = ValueNotifier<String>('');

  ProdutoStore({required this.repository});

  Future<void> getProdutos() async {
    isLoading.value = true;
    error.value = ''; // Resetando erro antes da requisição

    try {
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message ?? 'Erro: Produto não encontrado.';
    } catch (e) {
      error.value = 'Erro inesperado: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
