import 'package:app/auth/model/Definicao.dart';
import 'package:app/auth/model/Sinonimos.dart';
import 'package:app/auth/view/widgets/auth_field.dart';
import 'package:app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class quickDefinitionApp extends StatefulWidget {
  const quickDefinitionApp({super.key});

  @override
  State<quickDefinitionApp> createState() => _quickDefinitionAppState();
}

class _quickDefinitionAppState extends State<quickDefinitionApp> {
  final _inputcontroller = TextEditingController();

  String _response = '';

  List<String> _sinonimos = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _buscarDefinicao() async {
    final definicao = Definicao(input: _inputcontroller.text);
    final resultado = await definicao.getDefinicao();

    Sinonimos sin = Sinonimos(input: _inputcontroller.text);
    final sinonimos = await sin.listaSinonimos();

    // Aqui usamos o setState para atualizar a resposta na interface
    setState(() {
      _response = resultado;
      _sinonimos = sinonimos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  const Text(
                    'Termo Fácil',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  authField(
                    controller: _inputcontroller,
                    hintText: 'Escreva um termo',
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // botão
                  ElevatedButton(
                    // o metodo vai ser colocado aqui
                    onPressed: _buscarDefinicao,

                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(130, 55),
                        backgroundColor: AppPallete.colorButton,
                        shadowColor: Colors.white),
                    child: const Text(
                      'Pesquisar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Container - a resposta da definição

                  _response.isEmpty
                      ? SizedBox.shrink()
                      : Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: _response.isEmpty
                                  ? Colors.transparent
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 3.0)),
                          child: Text(
                            _response.isEmpty ? '' : 'Definição: $_response',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Novo container para os botões de sinônimos

                  // testar o scroll view
                  _sinonimos.isEmpty
                      ? SizedBox.shrink()
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: _sinonimos.map((sinonimo) {
                                return ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _inputcontroller.text = sinonimo;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppPallete.colorButton,
                                  ),
                                  child: Text(
                                    sinonimo,
                                    style: TextStyle(color: Colors.white),
                                  ),  
                                );
                              }).toList(), 
                            ),
                          ),
                        ),
                ],
              ),
            )));
  }
}
