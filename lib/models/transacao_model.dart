enum TipoTransacao { receita, despesa }

class Transacao {
  final String id;
  final String titulo;
  final double valor;
  final DateTime data;
  final TipoTransacao tipo;

  Transacao({
    required this.id,
    required this.titulo,
    required this.valor,
    required this.data,
    required this.tipo,
  });
}
