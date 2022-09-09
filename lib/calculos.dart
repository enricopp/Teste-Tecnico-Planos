double? calculateAmmountDue(
    {required int selectedPlan,
    required int dddOrigem,
    required int dddDestino,
    required final minutosFalados}) {
  //FaleMais 30 Cálculo
  if (selectedPlan == 0 &&
      dddOrigem == 11 &&
      dddDestino == 16 &&
      minutosFalados > 30) {
    return (minutosFalados - 30) * 2.09;
  } else if (selectedPlan == 0 &&
      dddOrigem == 16 &&
      dddDestino == 11 &&
      minutosFalados > 30) {
    return (minutosFalados - 30) * 3.19;
  } else if (selectedPlan == 0 &&
      dddOrigem == 11 &&
      dddDestino == 17 &&
      minutosFalados > 30) {
    return (minutosFalados - 30) * 1.87;
  } else if (selectedPlan == 0 &&
      dddOrigem == 17 &&
      dddDestino == 11 &&
      minutosFalados > 30) {
    return (minutosFalados - 30) * 2.97;
  } else if (selectedPlan == 0 &&
      dddOrigem == 11 &&
      dddDestino == 18 &&
      minutosFalados > 30) {
    return (minutosFalados - 30) * 0.99;
  } else if (selectedPlan == 0 &&
      dddOrigem == 18 &&
      dddDestino == 11 &&
      minutosFalados > 30) {
    return (minutosFalados - 30) * 2.09;
  } else if (minutosFalados <= 30 && selectedPlan == 0) {
    return 0;
    //FaleMais 60 Cálculo
  } else if (selectedPlan == 1 &&
      dddOrigem == 11 &&
      dddDestino == 16 &&
      minutosFalados > 60) {
    return (minutosFalados - 60) * 2.09;
  } else if (selectedPlan == 1 &&
      dddOrigem == 16 &&
      dddDestino == 11 &&
      minutosFalados > 60) {
    return (minutosFalados - 60) * 3.19;
  } else if (selectedPlan == 1 &&
      dddOrigem == 11 &&
      dddDestino == 17 &&
      minutosFalados > 60) {
    return (minutosFalados - 60) * 1.87;
  } else if (selectedPlan == 1 &&
      dddOrigem == 17 &&
      dddDestino == 11 &&
      minutosFalados > 60) {
    return (minutosFalados - 60) * 2.97;
  } else if (selectedPlan == 1 &&
      dddOrigem == 11 &&
      dddDestino == 18 &&
      minutosFalados > 60) {
    return (minutosFalados - 60) * 0.99;
  } else if (selectedPlan == 1 &&
      dddOrigem == 18 &&
      dddDestino == 11 &&
      minutosFalados > 60) {
    return (minutosFalados - 60) * 2.09;
  } else if (minutosFalados <= 60 && selectedPlan == 1) {
    return 0;
    //FaleMais 120 Cálculo
  } else if (selectedPlan == 2 &&
      dddOrigem == 11 &&
      dddDestino == 16 &&
      minutosFalados >= 120) {
    return (minutosFalados - 120) * 2.09;
  } else if (selectedPlan == 2 &&
      dddOrigem == 16 &&
      dddDestino == 11 &&
      minutosFalados > 120) {
    return (minutosFalados - 120) * 3.19;
  } else if (selectedPlan == 2 &&
      dddOrigem == 11 &&
      dddDestino == 17 &&
      minutosFalados > 120) {
    return (minutosFalados - 120) * 1.87;
  } else if (selectedPlan == 2 &&
      dddOrigem == 17 &&
      dddDestino == 11 &&
      minutosFalados > 120) {
    return (minutosFalados - 120) * 2.97;
  } else if (selectedPlan == 2 &&
      dddOrigem == 11 &&
      dddDestino == 18 &&
      minutosFalados > 120) {
    return (minutosFalados - 120) * 0.99;
  } else if (selectedPlan == 2 &&
      dddOrigem == 18 &&
      dddDestino == 11 &&
      minutosFalados > 120) {
    return (minutosFalados - 120) * 2.09;
  } else if (minutosFalados <= 120 && selectedPlan == 2) {
    return 0;
  } else {
    return 0;
  }
}

//Função cálculo dos valores sem o plano
double? calculateAmmountDueWh(
    {required int selectedPlan,
    required int dddOrigem,
    required int dddDestino,
    required final minutosFalados}) {
  if (dddOrigem == 11 && dddDestino == 16) {
    return minutosFalados * 1.9;
  } else if (dddOrigem == 16 && dddDestino == 11) {
    return minutosFalados * 2.9;
  } else if (dddOrigem == 11 && dddDestino == 17) {
    return minutosFalados * 1.7;
  } else if (dddOrigem == 17 && dddDestino == 11) {
    return minutosFalados * 2.7;
  } else if (dddOrigem == 11 && dddDestino == 18) {
    return minutosFalados * 0.9;
  } else if (dddOrigem == 18 && dddDestino == 11) {
    return minutosFalados * 1.9;
  } else {
    return 0;
  }
}

//Função para exibir os erros
String error({required int dddOrigem, required int dddDestino}) {
  if (dddOrigem == dddDestino) {
    return 'Selecione DDDs diferentes';
  } else if (dddOrigem == 16 && dddDestino == 17) {
    return 'o DDD 16 só realiza ligações para o DDD 11';
  } else if (dddOrigem == 16 && dddDestino == 18) {
    return 'o DDD 16 só realiza ligações para o DDD 11';
  } else if (dddOrigem == 17 && dddDestino == 16) {
    return 'o DDD 17 só realiza ligações para o DDD 11';
  } else if (dddOrigem == 17 && dddDestino == 18) {
    return 'o DDD 17 só realiza ligações para o DDD 11';
  } else if (dddOrigem == 18 && dddDestino == 16) {
    return 'o DDD 18 só realiza ligações para o DDD 11';
  } else if (dddOrigem == 18 && dddDestino == 17) {
    return 'o DDD 18 só realiza ligações para o DDD 11';
  } else {
    return 'Veja quanto você economiza com nosso plano:';
  }
}
