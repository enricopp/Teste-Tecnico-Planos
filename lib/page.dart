import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'calculos.dart';

//Variavéis dos resultados e erro
String result = '';
String semFale = '';
String erro = '';

//Listas usadas no código
const List<Widget> plans = <Widget>[Text('30'), Text('60'), Text('120')];
List<bool> _selectedPlan = <bool>[true, false, false];
List<int> list = <int>[011, 016, 017, 018];
double total = 0;

//Começo do Stateful
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _PageState();
}

class _PageState extends State<HomePage> {
  //Vars do setState
  int dddOrigem = list.first;
  int dddDestino = list.first;
  var minutos = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: getBody(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text(
          "Simulação do valor com Fale +",
          style:
              TextStyle(color: Colors.black, fontFamily: 'Dosis', fontSize: 30),
        ),
      ),
    );
  }

//Começo do Body
  Widget getBody() {
    return SingleChildScrollView(
      child: (Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Escolha seu plano Fale +',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 40),
            ),
            const SizedBox(height: 5),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _selectedPlan.length; i++) {
                        _selectedPlan[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.red[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.orange[200],
                  color: Colors.black,
                  constraints: const BoxConstraints(
                    minHeight: 70.0,
                    minWidth: 70.0,
                  ),
                  isSelected: _selectedPlan,
                  children: plans,
                  textStyle:
                      const TextStyle(fontFamily: 'Roboto', fontSize: 30),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text(
                    'DDD Origem',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 30),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<int>(
                  value: dddOrigem,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Roboto', fontSize: 30),
                  underline: Container(
                    height: 2,
                    color: Colors.orange,
                  ),
                  onChanged: (int? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dddOrigem = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text(
                    'DDD Destino',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 30),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<int>(
                  value: dddDestino,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Roboto', fontSize: 30),
                  underline: Container(
                    height: 3,
                    color: Colors.orange,
                  ),
                  onChanged: (int? value) {
                    setState(() {
                      dddDestino = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 400,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black, fontFamily: 'Roboto', fontSize: 30),
                decoration: const InputDecoration(
                  hintText: 'Duração da Ligação',
                  helperText: 'Obrigatório em MIN *',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                controller: minutos,
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(200, 100),
                ),
                child: const Text(
                  'CALCULAR',
                  style: const TextStyle(fontFamily: 'Roboto', fontSize: 25),
                ),
                onPressed: () {
                  print(_selectedPlan.indexWhere((element) => element == true));
                  print(dddOrigem);
                  print(dddDestino);
                  print(int.parse(minutos.text));
                  setState(() {
                    erro = error(
                      dddOrigem: dddOrigem,
                      dddDestino: dddDestino,
                    );
                    result = calculateAmmountDue(
                      selectedPlan: _selectedPlan
                          .indexWhere((element) => element == true),
                      dddOrigem: dddOrigem,
                      dddDestino: dddDestino,
                      minutosFalados: int.parse(minutos.text),
                    )!
                        .toStringAsFixed(2);
                    semFale = calculateAmmountDueWh(
                      selectedPlan: _selectedPlan
                          .indexWhere((element) => element == true),
                      dddOrigem: dddOrigem,
                      dddDestino: dddDestino,
                      minutosFalados: int.parse(minutos.text),
                    )!
                        .toStringAsFixed(2);
                  });
                }),
            if (result.isNotEmpty)
              Container(
                child: Text(
                  erro,
                  style: const TextStyle(fontFamily: 'Roboto', fontSize: 30),
                ),
              ),
            const SizedBox(height: 25),
            Container(
              child: Text(
                'Com Fale mais você pagará: ' + result,
                style: const TextStyle(fontFamily: 'Roboto', fontSize: 25),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              child: Text(
                ' Sem fale mais Você Pagaria: ' + semFale,
                style: const TextStyle(fontFamily: 'Roboto', fontSize: 20),
              ),
            ),
            Container(
              child: Image.asset('images/Logo_Fale+.png'),
              width: 500,
              height: 500,
            )
          ],
        ),
      )),
    );
  }
}
