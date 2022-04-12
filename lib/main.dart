import 'package:crud_and_dialoguebox/components/delete_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'components/delete_snackbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: _appBar(),
          body: Column(children: <Widget>[
            Expanded(
              child: Builder(builder: (context) {
                return Observer(builder: (_) {
                  return ListView.builder(
                      itemCount: 5,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 0),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    style: TextStyle(fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'There are a total of ',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: '5',
                                          style: TextStyle(color: Colors.blue)),
                                      TextSpan(
                                          text: ' items.\n',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ),
                              _card()
                            ],
                          );
                        } else {
                          return _card();
                        }
                      });
                });
              }),
            )
          ])),
      debugShowCheckedModeBanner: false,
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      title: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              const Expanded(
                  child: Text(
                "ItemView and DialogueBox",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )),
              IconButton(
                  onPressed: () {
                    print('olá criar');
                  },
                  icon: const Icon(Icons.add),
                  alignment: Alignment.centerRight,
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ],
          )),
    );
  }

  _card() {
    return Card(
      elevation: 8,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    size: 12,
                    color: Colors.red,
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Título do card',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.2,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {},
                      child: IconButton(
                        onPressed: () {
                          showDialogBox(context);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  })
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.mail_outline,
                      size: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        ' Description: ',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: .2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Descrição do Card',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontSize: 15, letterSpacing: .2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.badge_outlined,
                      size: 16,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        ' ID: ',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: .2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Identidade',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontSize: 15, letterSpacing: .2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.calendar_today_sharp,
                      size: 16,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        ' Data de criação: ',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: .2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        '04/10/2021',
                        style: TextStyle(fontSize: 15, letterSpacing: .2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDialogBox(BuildContext context) {
    AlertDialog dialogue = AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: const Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Text(
              "Excluir item",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(0),
              child: Icon(
                Icons.warning_rounded,
                color: Color.fromRGBO(173, 42, 42, 1),
                size: 60,
              ),
            ),
            Observer(builder: (_) {
              return const Text(
                "Tem certeza que deseja deletar este item?",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              );
            }),
            Expanded(child: Container()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        },
                        child: const Text(
                          "Não",
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ))),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                          DeleteSnackBar.instance
                              .showDeleteSnackBar('Excluído com sucesso');
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                            primary: const Color.fromRGBO(173, 42, 42, 1)),
                        child: const Text("Sim",
                            style: TextStyle(fontSize: 18.0)))),
              ],
            ),
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialogue;
      },
    );
  }
}
