// Importa o contrato do repositório definido na camada de domínio.
import 'package:app/features/contador/domain/contador_repository.dart';
// Disponibiliza ChangeNotifier, que permite notificar quem observa mudanças.
import 'package:flutter/foundation.dart';

/// Coordena as ações da tela e disponibiliza o valor atual do contador.
///
/// Faz parte da camada de apresentação e acessa os dados pelo contrato
/// [ContadorRepository]. Assim, não precisa conhecer a implementação que
/// armazena o contador. A regra de incremento permanece no objeto de domínio.
///
/// Ao herdar de [ChangeNotifier], permite que a interface observe as mudanças
/// e atualize os widgets que estiverem escutando suas notificações.
class ContadorViewModel extends ChangeNotifier {
  /// Repositório utilizado para consultar e salvar o contador.
  ///
  /// O modificador `final` impede trocar essa referência após a construção;
  /// ele não impede que o repositório atualize os dados armazenados.
  final ContadorRepository repository;

  /// Recebe de fora o repositório utilizado pela apresentação.
  ///
  /// `this.repository` atribui o argumento diretamente ao campo [repository].
  /// Essa passagem da dependência pelo construtor é a injeção de dependência.
  ContadorViewModel(this.repository);

  /// Valor atual do contador consultado no repositório.
  ///
  /// `get` permite ler `viewModel.valor` como uma propriedade, sem parênteses.
  /// A expressão após `=>` é retornada: `obter()` busca o contador e `.valor`
  /// acessa seu número. A consulta acontece a cada leitura deste getter.
  int get valor => repository.obter().valor;

  /// Solicita o incremento, salva o resultado e notifica os observadores.
  ///
  /// A interface pode chamar esta ação quando o usuário tocar no botão de
  /// incremento. O retorno `void` indica que a ação não devolve um valor.
  void incrementar() {
    // Obtém o objeto de domínio que representa o estado atual do contador.
    final contador = repository.obter();
    // Delega a regra ao domínio, que cria um novo contador com o valor + 1.
    // O objeto anterior não é alterado; a variável recebe o novo objeto.
    final atualizado = contador.incrementar();

    // Salva o novo contador para que as próximas consultas retornem esse estado.
    repository.salvar(atualizado);
    // Avisa os observadores somente depois de salvar o novo estado.
    // Widgets que escutam este ViewModel podem então reconstruir a exibição.
    notifyListeners();
  }
}
