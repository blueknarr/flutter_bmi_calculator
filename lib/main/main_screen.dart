import 'package:bmi_calculator/result/result_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Form을 사용하면 키를 설정해야 한다. Form의 상태를 가지고 있다.
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() async {
    /// 화면이 닫히기 전에 값을 저장하겠다.
    save();

    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', double.parse(_heightController.text);
    await prefs.setDouble('weight', double.parse(_weightController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('비만도 계산기'),
        ),

        /// Form : TextField에 정보를 입력했을 때, 에러 처리를 도와준다.
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '키',
                  ),

                  /// TextFormField에 숫자판 표시
                  keyboardType: TextInputType.number,

                  /// TextFormField에 값이 입력되면
                  validator: (value) {
                    /// 입력값이 없다면
                    if (value == null || value.isEmpty) {
                      return '키를 입력하세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _weightController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '몸무게',
                  ),
                  keyboardType: TextInputType.number,

                  /// TextFormField에 값이 입력되면
                  validator: (value) {
                    /// 입력값이 없다면
                    if (value == null || value.isEmpty) {
                      return '몸무게를 입력하세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    /// formKey의 현재 상태가 null이면 false
                    if (_formKey.currentState?.validate() == false) {
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          height: double.parse(_heightController.text),
                          weight: double.parse(_weightController.text),
                        ),
                      ),
                    );
                  },
                  child: const Text('결과'),
                ),
              ],
            ),
          ),
        ));
  }
}
