import 'package:app/features/contador/data/contador_repository_impl.dart';
import 'package:app/features/contador/presentation/contador_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/contador/presentation/contador_viewmodel.dart';

void main() {
  // Ponto de entrada do aplicativo: monta as dependências do contador
  // e inicia a interface. As operações do contador ficam nas classes responsáveis.

  // Cria o repositório que será utilizado pelo ViewModel.
  final repository = ContadorRepositoryImpl();

  // Inicia o Flutter com a árvore de widgets abaixo.
  runApp(
    // Disponibiliza o ViewModel aos widgets descendentes de MainApp.
    // Widgets que o observam podem reconstruir a interface quando ele
    // chama notifyListeners(). O Provider também gerencia seu descarte.
    ChangeNotifierProvider(
      // Cria o ViewModel quando ele é solicitado pela primeira vez.
      // Passar o repositório pelo construtor é uma injeção de dependência:
      // o ViewModel recebe o objeto de que precisa sem criá-lo internamente.
      create: (_) => ContadorViewModel(repository),
      // Define o widget raiz da interface, abaixo do Provider.
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: ContadorPage(),
    );
  }
}
