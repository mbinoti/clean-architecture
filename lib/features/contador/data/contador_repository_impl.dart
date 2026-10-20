import 'package:app/features/contador/domain/contador.dart';
import 'package:app/features/contador/domain/contador_repository.dart';

// Nossa implementação guarda o contador na memória.
// Por enquanto, não precisamos de SQLite, Firebase ou PostgreSQL.

class ContadorRepositoryImpl implements ContadorRepository {
  // Isso significa que nossa classe concreta segue o contrato definido pelo Domain.
  // O Data depende do Domain, mas o Domain não depende do Data.
  // Essa é uma aplicação do princípio de inversão de dependência.

  Contador _contador = const Contador(0);

  @override
  Contador obter() {
    return _contador;
  }

  @override
  void salvar(Contador contador) {
    _contador = contador;
  }
}
