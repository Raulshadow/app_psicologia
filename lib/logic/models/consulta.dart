
class Consulta {
  String?
      PacPrimeiroNome = '',
      PacSegundoNome = '',
      PsiPrimeiroNome = '',
      PsiSegundoNome = '';
  int? id = -1;

  Consulta(int? id, String? PsiPrimeiroNome, String? PsiSegundoNome, String? PacPrimeiroNome, String? PacSegundoNome) {
    this.PacPrimeiroNome = PacPrimeiroNome;
    this.PacSegundoNome = PacSegundoNome;
    this.PsiPrimeiroNome = PsiPrimeiroNome;
    this.PsiSegundoNome = PsiSegundoNome;
    this.id = id;
  }
}