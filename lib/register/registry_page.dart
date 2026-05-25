import 'package:flutter/material.dart';
import 'registry_service.dart';

class RegistryPage extends StatefulWidget {
  const RegistryPage({super.key});

  @override
  State<RegistryPage> createState() => _RegistryPageState();
}

class _RegistryPageState extends State<RegistryPage> {
  final TextEditingController controller = TextEditingController(
    text: 'http://192.168.100.250:5000',
  );

  final RegistryService service = RegistryService();

  List<String> repositories = [];

  bool loading = false;

  Future<void> loadCatalog() async {
    setState(() {
      loading = true;
    });

    try {
      final result = await service.catalog(controller.text);

      setState(() {
        repositories = result;
      });
    } catch (e) {
      debugPrint(e.toString());

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('请求失败: $e')));
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registry Client')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Registry URL',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loadCatalog,
                child: const Text('获取镜像列表'),
              ),
            ),

            const SizedBox(height: 12),

            if (loading) const CircularProgressIndicator(),

            Expanded(
              child: ListView.builder(
                itemCount: repositories.length,
                itemBuilder: (context, index) {
                  final repo = repositories[index];

                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.inventory),
                      title: Text(repo),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
