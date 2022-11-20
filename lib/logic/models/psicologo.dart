
class Psicologo {
  String? crp = '',
      cpf ='',
      primeiroNome = '',
      segundoNome = '';
  int? id = -1;

  Psicologo(String? crp, int? id, String? cpf, String? pn, String? sn) {
    this.crp = crp;
    this.cpf = cpf;
    this.primeiroNome = pn;
    this.segundoNome = sn;
    this.id = id;
  }
}