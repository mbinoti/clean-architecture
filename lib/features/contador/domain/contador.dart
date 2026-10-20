// representar o contador e sua regra de incremento.
// Esse código tem uma única responsabilidade: representar um contador
// capaz de incrementar seu valor.
// Observe:
// - Não utiliza Flutter.
// - Não utiliza Provider.
// - Não conhece a tela.
// - Não conhece o banco de dados.
// Esse é o princípio de independência do Domain.

class Contador {
  final int valor;

  const Contador(this.valor);

  Contador incrementar() {
    return Contador(valor + 1);
  }
}
