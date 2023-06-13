import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Form을 사용하면 키를 설정해야 한다. Form의 상태를 가지고 있다.
  final _formKey = GlobalKey<FormState>();

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
                    if (_formKey.currentState?.validate() ?? false) {}
                  },
                  child: const Text('결과'),
                ),
              ],
            ),
          ),
        ));
  }
}
