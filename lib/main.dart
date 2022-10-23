import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    /*Exemplo 1, um container direto na tela
      * ao fazer isso, a tela possui uma constraint que diz
      * que todo widget que inserido nela deve ter o tamanho da tela
      *body: Container(color: Colors.red,)*/

    /*Exemplo 2
    * Container(
      color: Colors.red,
      width: 100,
      height: 100,
    );Só que a tela força o widget que está abaixo da tela a ter
    * a mesma dimensão da tela ignorando totalmente a dimensão do filho*/

    /*Exemplo 3
    * Center(
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
    );Isso acontece pq as constraints da tela foram aplicadas para o primeiro
    * widget, nesse caso o center, e o container só precisa se preocupar
    * em não ultrapassar as dimensões da tela*/

    /*Exemplo 4
    * Align(
      alignment: Alignment.bottomRight,
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
    );
    * O comportamento se manteve o mesmo e a posição é definida pelo pai*/

    /*Exemplo 5
    * Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.red,
        width: double.infinity,
        height: double.infinity,
      ),
    ); Nesse caso a largura e altura são infinitas e o que acontece é que
    * o center tem toda a tela a disposição e o o container está tentando
    * ir além das dimensões da tela. Mas o Center impede isso, pois
    * o filho SEMPRE vai respeitar a constraint imposta pelo pai, e nesse
    * caso vai fazer com que o container tenha apenas o tamanho da tela*/

    /*Exmeplo 6
    * Center(
      child: Container(
        color: Colors.red,
      ),
    ); Novamente o center vai adotar as constraints da tela, só que o container
    * não tem filho e nenhuma dimensão, ele vai adotar o maior tamanho possivel
    * isso acontece pq o container ele criado para ser dessa forma. CADA WIDGET
    * TEM UM COMPORTAMENTO ESPECIFICO*/

    /*Exemplo 7
    * Center(
      child: Container(
        color: Colors.red,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.green,
        ),
      ),
    );Nesse caso o Container verde de 50x50 vai definir a dimensão do container
    * vermelho. O Container vermelho ele viu que o filho dele tinha
    * dimensões especificadas e ele querer ser exatamente da mesma dimensão que
    * o filho e por conta do container vermelho ter exatamente o mesmo tamanho
    * container verde ele acaba ficando atrás*/

    /*Exemplo 8
    * Center(
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(20),
        child: Container(
          width: 50,
          height: 50,
          color: Colors.green,
        ),
      ),
    ); A mesma coisa do exemplo anterior mas agora com padding
    * Ou seja o vermelho vai ter exatamente a mesma dimensão do verde
    * só que vai ter espaço de 20 em todos lados por conta do padding*/
    return Center(
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(20),
        child: Container(
          width: 50,
          height: 50,
          color: Colors.green,
        ),
      ),
    );
  }
}
