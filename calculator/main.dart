import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Button_ids
{
  BUTTON_0,
  BUTTON_1,
  BUTTON_2,
  BUTTON_3,
  BUTTON_4,
  BUTTON_5,
  BUTTON_6,
  BUTTON_7,
  BUTTON_8,
  BUTTON_9,
  BUTTON_BACK,
  BUTTON_CLEAR,
  BUTTON_EQUALS,
  BUTTON_ADD,
  BUTTON_SUB,
  BUTTON_DIV,
  BUTTON_MUL,

}

enum Calculation_state
{
  number1_entering,
  number1_entered,
  operation_entered,
  number2_entering,
  number2_entered,
  pressed_equals
}

class _MyHomePageState extends State<MyHomePage> {
  String final_result = "0";
  String number1 = "";
  String number2 = "";
  String operation = "";
  String calc_result = "";

  Calculation_state calculation_state = Calculation_state.number1_entering;

  void update_state() {

    setState((){});
  }

  button_pressed(Button_ids id)
  {
    print("pressed $id state $calculation_state" );

    if (is_button_clear(id)){
      print("clearing");
      number1 = "";
      number2 = "";
      operation = "";
      calc_result = "";
      calculation_state = Calculation_state.number1_entering;
    }
    
    if (is_button_back(id)){
      if (calculation_state == Calculation_state.number1_entering) {
        if (number1.isNotEmpty) {
          number1 = number1.substring(0, number1.length - 1);
        }
      }
      if (calculation_state == Calculation_state.number2_entering) {
        if (number2.isNotEmpty) {
          number2 = number2.substring(0, number2.length - 1);
        }
      }
    }

    if (is_button_operation(id)){
      if (calculation_state == Calculation_state.number1_entering ) {
        calculation_state = Calculation_state.operation_entered;
        operation = get_id_string(id);
        calculation_state = Calculation_state.number2_entering;
      }
    }

    if (id == Button_ids.BUTTON_EQUALS){
      if (calculation_state == Calculation_state.number2_entering) {
        calculation_state = Calculation_state.pressed_equals;
      }
    }

    if (is_button_digit(id) ) {
      if (calculation_state == Calculation_state.number1_entering) {
        number1 += get_id_string(id);
      } else if (calculation_state == Calculation_state.number2_entering) {
        number2 += get_id_string(id);
      } else {
        print("Invalid State");
      }
    }
    bool isInteger(num value) => (value % 1) == 0;

    if (calculation_state == Calculation_state.pressed_equals) {
      double result = 0;

      if (operation == "+") {
        result = double.parse(number1) + double.parse(number2);
        if (isInteger(result)) {
          calc_result = result.toInt().toString();
        } else {
          calc_result = result.toString();
        }
      }

      if (operation == "-") {
        result = double.parse(number1) - double.parse(number2);
        if (isInteger(result)) {
          calc_result = result.toInt().toString();
        } else {
          calc_result = result.toString();
        }
      }

      if (operation == "X") {
        result = double.parse(number1) * double.parse(number2);
        if (isInteger(result)) {
          calc_result = result.toInt().toString();
        } else {
          calc_result = result.toString();
        }
      }

      if (operation == "/") {
        result = double.parse(number1) / double.parse(number2);
        if (isInteger(result)) {
          calc_result = result.toInt().toString();
        } else {
          calc_result = result.toString();
        }
      }


      final_result = "$number1 $operation  $number2  = $calc_result";
    }else {
      final_result = "$number1 $operation  $number2";
      print("getting final resul $final_result");
    }

    update_state();
  }

  bool is_button_digit(Button_ids id) {
    if (id == Button_ids.BUTTON_0 ||
        id == Button_ids.BUTTON_1 ||
        id == Button_ids.BUTTON_2 ||
        id == Button_ids.BUTTON_3 ||
        id == Button_ids.BUTTON_4 ||
        id == Button_ids.BUTTON_5 ||
        id == Button_ids.BUTTON_6 ||
        id == Button_ids.BUTTON_7 ||
        id == Button_ids.BUTTON_8 ||
        id == Button_ids.BUTTON_9) {
      return true;
    }
    else {
      return false;
    }
  }

  bool is_button_operation(Button_ids id)
  {
    if (id == Button_ids.BUTTON_MUL ||
        id == Button_ids.BUTTON_DIV ||
        id == Button_ids.BUTTON_ADD ||
        id == Button_ids.BUTTON_SUB) {
      return true;
    }
    else {
      return false;
    }
  }

  bool is_button_clear(Button_ids id)
  {
    if (id == Button_ids.BUTTON_CLEAR){
      return true;
    }
    else {
      return false;
    }
  }

  bool is_button_back(Button_ids id)
  {
    if (id == Button_ids.BUTTON_BACK){
      return true;
    }
    else {
      return false;
    }
  }

  String get_id_string(Button_ids id)
  {

    if (id == Button_ids.BUTTON_0){
      return "0";
    } else if (id == Button_ids.BUTTON_1){
      return "1";
    } else if (id == Button_ids.BUTTON_2){
    return "2";
    } else if (id == Button_ids.BUTTON_3){
    return "3";
    } else if (id == Button_ids.BUTTON_4){
    return "4";
    } else if (id == Button_ids.BUTTON_5){
    return "5";
    } else if (id == Button_ids.BUTTON_6){
    return "6";
    } else if (id == Button_ids.BUTTON_7){
    return "7";
    } else if (id == Button_ids.BUTTON_8){
    return "8";
    } else if (id == Button_ids.BUTTON_9){
    return "9";
    } else if (id == Button_ids.BUTTON_ADD){
      return "+";
    } else if (id == Button_ids.BUTTON_SUB){
      return "-";
    } else if (id == Button_ids.BUTTON_MUL){
      return "X";
    } else if (id == Button_ids.BUTTON_DIV){
      return "/";
    } else {
      return "0";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
                Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                width: 400,
                child: Center(
                  child:Text(
                    "Gurnoor's Calculator",
                    style: TextStyle(fontSize: 40.0, color: Colors.pink),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.pink,
                ),

              ),
              child: Text(
                final_result,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget> [
              ElevatedButton(
                onPressed: () { button_pressed(Button_ids.BUTTON_BACK);},
                child: const Text('BACK'),
            ),
            ElevatedButton(
              onPressed: () { button_pressed(Button_ids.BUTTON_CLEAR);},
              child: const Text('CLEAR'),
            ),
                ]
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_1);},
                    child: const Text('1'),
                  ),
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_2);},
                    child: const Text('2'),
                  ),
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_3);},
                    child: const Text('3'),
                  ),
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_4);},
                    child: const Text('4'),
                  ),
                ]
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_5);},
                    child: const Text('5'),
                  ),
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_6);},
                    child: const Text('6'),
                  ),
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_7);},
                    child: const Text('7'),
                  ),
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_8);},
                    child: const Text('8'),
                  ),
                ]
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_9);},
                    child: const Text('9'),
                  ),
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_0);},
                    child: const Text('0'),
                  ),

                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_ADD);},
                    child: const Text('+'),
                  ),
                  Opacity(
                      opacity: 0.0,
                      child:  ElevatedButton(
                          onPressed: () { },
                          child: const Opacity(
                            opacity: 0.5,
                            child: Text('aaa'),
                          )
                      )
                  ),
                ]
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_MUL);},
                    child: const Text('X'),
                  ),
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_SUB);},
                    child: const Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_DIV);},
                    child: const Text('/'),
                  ),
                  ElevatedButton(
                    onPressed: () { button_pressed(Button_ids.BUTTON_EQUALS);},
                    child: const Text('='),
                  ),
                ]
            )
        ]
      )
    );
  }
}
