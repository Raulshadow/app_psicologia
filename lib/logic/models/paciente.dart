

class Paciente {
  String? cpf,
      primeiroNome,
      segundoNome;
  int? id;

  Paciente(String cpf,int? id, String pn, String sn) {
    this.cpf = cpf;
    this.primeiroNome = pn;
    this.segundoNome = sn;
    this.id = id;
  }

  int? get getId {
    return id;
  }

  void set setId(int id) {
    this.id = id;
  }

  String? get getCpf {
    return cpf;
  }

  void set setCpf(String cpf) {
    this.cpf = cpf;
  }

  String? get getPN {
    return primeiroNome;
  }

  void set setPN(String primeiroNome) {
    this.primeiroNome = primeiroNome;
  }

  String? get getSN {
    return segundoNome;
  }

  void set setSN(String segundoNome) {
    this.segundoNome = segundoNome;
  }
}