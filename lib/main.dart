import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const gstCalc(),
    ),
  );
}

/*Orange = #FF6B00
DARK GRAY =#252427
BACKGROUND & Light font= #EEEEEE
*/
class gstCalc extends StatefulWidget {
  const gstCalc({Key? key}) : super(key: key);

  @override
  State<gstCalc> createState() => _gstCalcState();
}

class _gstCalcState extends State<gstCalc> {
  // String o_value = "0";
  //List a = [3, 5, 12, 18, 28];
  // List b = [7, 4, 1, 00];
  // double f_value = 0;
  // double gst_value = 0;
  // String dtext = "Ac";
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 60.0;
  // Color f_color = const Color(0XFFf5f5f5);
  //Color s_color = const Color(0xffFF6B00);

  Color? c1 = null;
  Color? c2 = null;
  Color? c3 = null;
  Color? c4 = null;
  Color? c5 = null;
  Color tc1 = Colors.black87;
  Color tc2 = Colors.black87;
  Color tc3 = Colors.black87;
  Color tc4 = Colors.black87;
  Color tc5 = Colors.black87;

  double CSGST = 00.00;
  double GSTrate = 0.0;
  //String OP = "0.0";
  double FP = 00.00;
  buttonPressed(String dtext) {
    setState(() {
      if (dtext == "AC") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 60.0;
      } else if (dtext == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
        ;
      } else if (dtext == "=") {
        equationFontSize = 38.0;
        resultFontSize = 60.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = dtext;
        } else {
          equationFontSize = 60.0;
          resultFontSize = 38.0;
          equation = equation + dtext;
        }
      }
    });
  }

  Widget calcbutton(String dtext, Color dcolor, Color tcolor, double a) {
    return Container(
//margin: EdgeInsets.only(left: 20),
      height: a,
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: dcolor,
      ),
      child: InkWell(
        onTap: () => buttonPressed(dtext),
        child: Ink(
          child: Text(
            dtext,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 26, color: tcolor, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  var myDecor = const TextStyle(color: Colors.black, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xffeeeeee),
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    const Text(
                      "ORIGINAL PRICE",
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const SizedBox(width: 100),
                    Text(
                      equation,
                      style: const TextStyle(
                          color: const Color(0xff252427), fontSize: 18),
                    ),
                    const Text(
                      ".00 Rs",
                      style: const TextStyle(
                          color: const Color(0xff252427), fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
//

//
          const SizedBox(
            height: 18,
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xffeeeeee),
            child: const Center(
              child: Text(
                "Gst",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xffeeeeee),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    c1 = const Color(0xffff6b00);
                    setState(() {
                      GSTrate = 3.00;
                      CSGST = (double.parse(equation) * GSTrate) / 200;
                      FP = double.parse(equation) + CSGST * 2;
                      c4 = const Color(0xffeeeeee);
                      tc4 = Colors.black;
                      c2 = const Color(0xffeeeeee);
                      tc2 = Colors.black;

                      c3 = const Color(0xffeeeeee);
                      tc3 = Colors.black;
                      c5 = const Color(0xffeeeeee);
                      tc5 = Colors.black;
                      c1 = const Color(0xffff6b00);
                      tc1 = Colors.white;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 85,
                    height: 50,
                    child: Text(
                      "3%",
                      style: TextStyle(
                          color: tc1,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    decoration: BoxDecoration(
                      color: c1,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      GSTrate = 5.00;
                      CSGST = (double.parse(equation) * GSTrate) / 200;
                      FP = double.parse(equation) + CSGST * 2;
                      c4 = const Color(0xffeeeeee);
                      tc4 = Colors.black;
                      c1 = const Color(0xffeeeeee);
                      tc1 = Colors.black;
                      c3 = const Color(0xffeeeeee);
                      tc3 = Colors.black;
                      c3 = const Color(0xffeeeeee);
                      tc3 = Colors.black;
                      c5 = const Color(0xffeeeeee);
                      tc5 = Colors.black;

                      c2 = const Color(0xffff6b00);
                      tc2 = Colors.white;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 85,
                    height: 50,
                    child: Text(
                      "5%",
                      style: TextStyle(
                          color: tc2,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    decoration: BoxDecoration(
                      color: c2,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      GSTrate = 12.00;
                      CSGST = (double.parse(equation) * GSTrate) / 200;
                      FP = double.parse(equation) + CSGST * 2;

                      c4 = const Color(0xffeeeeee);
                      tc4 = Colors.black;
                      c1 = const Color(0xffeeeeee);
                      tc1 = Colors.black;
                      c2 = const Color(0xffeeeeee);
                      tc2 = Colors.black;
                      c3 = const Color(0xffeeeeee);
                      tc3 = Colors.black;
                      c5 = const Color(0xffeeeeee);
                      tc5 = Colors.black;
                      c3 = const Color(0xffff6b00);
                      tc3 = Colors.white;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 85,
                    height: 50,
                    child: Text(
                      "12%",
                      style: TextStyle(
                          color: tc3,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    decoration: BoxDecoration(
                      color: c3,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      GSTrate = 18.00;
                      CSGST = (double.parse(equation) * GSTrate) / 200;
                      FP = double.parse(equation) + CSGST * 2;

                      c1 = const Color(0xffeeeeee);
                      tc1 = Colors.black;
                      c2 = const Color(0xffeeeeee);
                      tc2 = Colors.black;
                      c3 = const Color(0xffeeeeee);
                      tc3 = Colors.black;
                      c5 = const Color(0xffeeeeee);
                      tc5 = Colors.black;
                      c4 = const Color(0xffff6b00);
                      tc4 = Colors.white;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 85,
                    height: 50,
                    child: Text(
                      "18%",
                      style: TextStyle(
                          color: tc4,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    decoration: BoxDecoration(
                      color: c4,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      GSTrate = 28.00;
                      CSGST = (double.parse(equation) * GSTrate) / 200;
                      FP = double.parse(equation) + CSGST * 2;
                      c1 = const Color(0xffeeeeee);
                      tc1 = Colors.black;
                      c2 = const Color(0xffeeeeee);
                      tc2 = Colors.black;
                      c3 = const Color(0xffeeeeee);
                      tc3 = Colors.black;
                      c4 = const Color(0xffeeeeee);
                      tc4 = Colors.black;
                      c5 = const Color(0xffff6b00);
                      tc5 = Colors.white;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 85,
                    height: 50,
                    child: Text(
                      "28%",
                      style: TextStyle(
                          color: tc5,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    decoration: BoxDecoration(
                      color: c5,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 18,
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xffeeeeee),
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    const Text(
                      "FINAL PRICE",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 150),
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Text(
                        "$FP",
                        style: const TextStyle(
                            color: const Color(0xff252427), fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            height: 80,
            width: 300,
            decoration: BoxDecoration(
              color: const Color(0xffeeeeee),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "CGST/SGST",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Text(
                        "$CSGST",
                        style: const TextStyle(
                            color: Color(0xff252427), fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              Column(
                children: [
                  calcbutton('7', const Color(0xfffafafa), Colors.black, 75),
                  const SizedBox(height: 10),
                  calcbutton('4', const Color(0xfffafafa), Colors.black, 75),
                  const SizedBox(height: 10),
                  calcbutton('1', const Color(0xfffafafa), Colors.black, 75),
                  const SizedBox(height: 10),
                  calcbutton('00', const Color(0xfffafafa), Colors.black, 75),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  calcbutton('8', const Color(0xfffafafa), Colors.black, 75),
                  const SizedBox(height: 10),
                  calcbutton('5', const Color(0xfffafafa), Colors.black, 75),
                  const SizedBox(height: 10),
                  calcbutton('2', const Color(0xfffafafa), Colors.black, 75),
                  const SizedBox(height: 10),
                  calcbutton('0', const Color(0xfffafafa), Colors.black, 75),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  calcbutton('9', const Color(0xfffafafa), Colors.black, 75),
                  const SizedBox(height: 10),
                  calcbutton('6', const Color(0xfffafafa), Colors.black, 75),
                  const SizedBox(height: 10),
                  calcbutton('3', const Color(0xfffafafa), Colors.black, 75),
                  const SizedBox(height: 10),
                  calcbutton('.', const Color(0xfffafafa), Colors.black, 75),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  calcbutton('AC', const Color(0xffFF6B00), Colors.white, 170),
                  const SizedBox(height: 5),
                  calcbutton('⌫', const Color(0xffFF6B00), Colors.white, 170),
                ],
              ),
              const SizedBox(width: 15),
            ],
          ),
        ],
      ),
    );
  }
}
