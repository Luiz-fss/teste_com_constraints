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

    /*Exemplo 9
    * ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 150,
        maxWidth: 150,
        minHeight: 70,
        minWidth: 70
      ),
      child: Container(
        color: Colors.green,
        width: 10,
        height: 10,
      ),
    );
    * Nesse caso a ConstrainedBox está ligada diretamente a tela e por isso
    * ela precisa obrigatoriamente ter as mesmas dimensões da tela.
    * Por isso as contraints que tem nela são totalmente ignoradas. Incluindo
    * o tamanho do filho (o container)*/
    /*Exemplo 10
    * Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 150,
          maxWidth: 150,
          minHeight: 70,
          minWidth: 70
        ),
        child: Container(
          color: Colors.green,
          width: 10,
          height: 10,
        ),
      ),
    );Fazendo isso, quem assume a responsabilidade de ter o tamanho maximo
    * da tela é o center assim o constrainedBox pode ter a dimensão que ele quiser
    * o container está falando que quer ter 10 de altura, ou seja, não
    * está respeitando as constraints impostas pelo pai. Nesse caso
    * como a dimensão do container é menor que o tamanho minimo da constraint.
    * Ele vai passar a ter o valor minimo imposto pela constraint(no caso 70)*/

    /*Exemplo 11
    * Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 150,
          maxWidth: 150,
          minHeight: 70,
          minWidth: 70
        ),
        child: Container(
          color: Colors.green,
          width: 1000,
          height: 1000,
        ),
      ),
    );Caso passe o valor máximo, ele vai ser limitado ao valor máximo dado na
    * constraint*/
    /*Exemplo 12
    * Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 150,
          maxWidth: 150,
          minHeight: 70,
          minWidth: 70
        ),
        child: Container(
          color: Colors.green,
          width: 100,
          height: 100,
        ),
      ),
    );
    *Agora está dentro dos limites */

    /*Exemplo 13
    * UnconstrainedBox(
      child: Container(
        color: Colors.green,
        width: 20,
        height: 50,
      ),
    );Com esse widget, é possivél ignorar as constraint do pai permitindo
    * que o widget ocupe qualquer tamanho que ele quiser*/

    /*Exemplo 14
    * UnconstrainedBox(
      child: Container(
        color: Colors.green,
        width: 4000,
        height: 50,
      ),
    );Largura gigante faz dar overflow. Ou seja, o filho pode ter o tamanho que quiser
    * desde que caiba*/

    /*Exemplo 15
    * OverflowBox(
      minWidth: 0,
      minHeight: 0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      child: Container(
        color: Colors.green,
        width: 4000,
        height: 50,
      ),
    );Tem o mesmo comportamento do unconstrainedBox. Só que no caso
    * ele vai colocar o que der para renderizar*/

    /*Exemplo 16
    * UnconstrainedBox(
      child: Container(
        color: Colors.green,
        width: double.infinity,
        height: 100,
      ),
    );Com a largura infinita, ele não vai renderizar nada na sua tela. Pq o
    * UnconstrainedBox vai dar a liberadade para o container ter
    * o tamnhho que quiser, só que o container disse que quer ser infinito
    * só que nesse caso, é impossivél o flutter renderizar um widget
    * de tamanho infinito*/

    /*Exemplo 17
    *  UnconstrainedBox(
      child: LimitedBox(
        maxWidth: 100,
        child: Container(
          color: Colors.green,
          width: double.infinity,
          height: 100,
        ),
      ),
    );Nesse caso o que vai acontecer é, se o Unconstrained der para o widget
    * uma dimensão infinita o LimitedBox vai ler essa dimensão infinita
    * e vai falar que não pode ser feito, e vai setar o valor que foi definido*/
    /*Exemplo 18
    * FittedBox(
      child: Text("Hello world. Hello World"),
    );
    *O FittedBox está diretamente na tela. A tela vai forçar o fittedBox
    * a ter exatamente as dimensões da tela. O texto ele vai definir
    * seu proprio tamanho baseado no tamanho do texto, na fonte,
    * peso da fonte e vai falar qual é o tamanho dele. O FittedBox ele vai
    * diminuir ou aumentar o tamanho do texto, vai dar o scale no tamanho para
    * que ele ocupe exatamente a largura do fittedBox. Se o texto for grande
    * ele vai ser encurtado até caber. E caso tenha só o "Hello" ele vai
    * aumentar até ocupar o espaço*/

    /*Exemplo 19
    * Center(
      child: FittedBox(
        child: Text("Hello world."),
      ),
    );
    * Agora o center ocupar a dimensão da tela. Portanto o fittedBox vai poder
    * ter o tamanho que quiser ter só que não maior que a tela. O fittedBox
    * vai perguntar o tamanho que o texto quer ter. E agora, caso o texto
    * não consiga ocupar o espaço por completo o FittedBox não vai fazer o scale
    * */
    /*Exemplo 20
    * Center(
      child: FittedBox(
        child: Text("Hello world.Hello world.Hello world.Hello world."),
      ),
    );
    * Nesse caso o FittedBox não pode deixar o texto crescer da forma que ele quiser
    * pq vai ultrapassar as dimensões estabelecidas pelo o pai*/
    /*Exemplo 21
    * Center(
      child: Text("Hello world.Hello world.Hello world.Hello world."),
    );Nesse o texto vai ser passado para linha debaixo sempre que passar
    * do limite */
    /*Exemplo 22
    * FittedBox(
      child: Container(
        height: 20,
        width: double.infinity,
      ),
    );O fitted box não é capaz de escalar widgts com tamanhos infinitos*/
    /*Exemplo 23
    * Row(
      children: [
        Container(
          color: Colors.red,
          child: Text("Hello"),
        ),
        Container(
          color: Colors.blueAccent,
          child: Text("World"),
        )
      ],
    ); A row tem o mesmo comportamento do UncsontrainedBox, ou seja ela fala
    * que os seus filhos podem ter o tamnho que quiserem*/
    /*Row(
      children: [
        Container(
          color: Colors.red,
          child: Text("Texto longo demais para não caber na largura da tela"),
        ),
        Container(
          color: Colors.blueAccent,
          child: Text("World"),
        )
      ],
    );Mesmo comportamento do unconstrained, vai dar overflow*/
    /*Exemplo 25
    * Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: Text("Texto longo demais para não caber na largura da tela"),
          ),
        ),
        Container(
          color: Colors.blueAccent,
          child: Text("World"),
        )
      ],
    );Nesse caso ele vai primeiro decidir a dimensão dos widgets sem expanded
    * e o espaço restante vai para o que tem o expanded. E se caso tivesse tamanho fixo
    * o expanded iria ignorar*/
    /*Exemplo 26
    * Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: Text("Texto longo demais para não caber na largura da tela"),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blueAccent,
            child: Text("World"),
          ),
        )
      ],
    );Vai considerar o parametro flex para definir as dimensões*/
    /*Exemplo 27
    * Row(
      children: [
        Flexible(
          child: Container(
            color: Colors.red,
            child: Text("Texto longo demais para não caber na largura da tela"),
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.blueAccent,
            child: Text("World"),
          ),
        )
      ],
    );Mesma coisa porém vai ser permitido que tenha o espaço necessário ou menos
    * */
    /*Exemplo 28
    * Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Text("Hello..."),
            Text("World!")
          ],
        ),
      ),
    );Scaffold está na tela, portanto a dimensão dele é a da tela.
    * O container vai poder ter o tamnho que quiser respeitando a constraint da tela
    * */
    /*Exemplo 29
    * Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: Colors.yellow,
          child: Column(
            children: [
              Text("Hello..."),
              Text("World!")
            ],
          ),
        ),
      ),
    );O sizedbox.expanded vai fazer com que o filho dele seja do mesmo tamnho
    * que o pai*/
    /*FractionallySizedBox(
      widthFactor: 0.5,
      heightFactor: 0.5,
      child: Container(color: Colors.green,),
    ); permite definir porcentagens para o widget filho com base no tamanho
    do pai*/

    /*Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(color: Colors.green,
        height: 200,
        width: 200,),
        Flexible(child: FractionallySizedBox(
          heightFactor: 0.2,
        )),
        Container(
          color: Colors.yellow,
        height: 200,
        width: 200,)
      ],
    );Exemplo de espaçamento baseado em porcentagens usando o fractionally
    */

    /*
    * Esse widget vai pegar o maior widget da Row, e vai definir o tamanho da row baseado na altura do maior widget
    * Center(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(color: Colors.green,child: Text("aa"),),
            Container(height: 300,width: 100,color: Colors.yellow,)
          ],
        ),
      ),
    );*/
    return Center(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(color: Colors.green,child: Text("aa"),),
            Container(height: 300,width: 100,color: Colors.yellow,)
          ],
        ),
      ),
    );
  }
}
