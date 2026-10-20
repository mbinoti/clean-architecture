import 'package:app/features/contador/domain/contador.dart';

// Aqui definimos um contrato.
// Estamos dizendo que qualquer classe que implemente ContadorRepository deverá disponibilizar os métodos obter() e salvar().
// Mas não estamos dizendo como essas operações serão realizadas.
// Essa é uma distinção essencial.

abstract class ContadorRepository {
  Contador obter();
  void salvar(Contador contador);
}
