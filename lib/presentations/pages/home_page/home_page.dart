import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/presentations/pages/home_page/widgets/category_view.dart';
import 'package:test_task/presentations/pages/home_page/widgets/products_view.dart';
import 'package:test_task/presentations/pages/profil_page/profil_page.dart';
import 'package:test_task/utilities/extensions/navigation_extension.dart';
import 'package:test_task/utilities/helpers/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () => context.to(MultiProvider(
                    providers: [
                      ChangeNotifierProvider(create: (_) => UserProvider()),
                    ],
                    child: ProfilPage(),
                  )),
              icon: const Icon(Icons.person))
        ],
      ),
      body: Column(
        children: [
          CategoryView(),
          const Expanded(
            child: ProductsView(),
          ),
        ],
      ),
    );
  }
}
