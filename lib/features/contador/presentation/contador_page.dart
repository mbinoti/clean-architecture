import 'package:flutter/material.dart';

import 'contador_viewmodel.dart';

import 'package:provider/provider.dart';

/// Exibe o valor do contador e um botão para incrementá-lo.
///
/// Delega as ações ao [ContadorViewModel], observado pelo Provider.
class ContadorPage extends StatelessWidget {
  /// Cria a tela do contador.
  const ContadorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // watch observa o ViewModel e reconstrói a tela após suas notificações.
    final viewModel = context.watch<ContadorViewModel>();
    // Organiza a tela com barra de título, conteúdo e botão flutuante.
    return Scaffold(
      appBar: AppBar(title: const Text('Contador')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Você pressionou o botão tantas vezes:'),
            // Exibe o valor atual fornecido pelo ViewModel.
            Text('${viewModel.valor}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Delega o incremento ao ViewModel.
          viewModel.incrementar();
        },
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
