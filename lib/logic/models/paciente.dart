

class Paciente {
  String cpf ='',
      primeiroNome = '',
      segundoNome = '';
  int id = -1;

  Paciente(String cpf,int id, String pn, String sn) {
    this.cpf = cpf;
    this.primeiroNome = pn;
    this.segundoNome = sn;
    this.id = id;
  }
}