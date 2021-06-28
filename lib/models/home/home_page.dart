import 'package:flutter/material.dart';

import 'package:payflow/models/extract/extract_page.dart';
import 'package:payflow/models/home/home_controller.dart';
import 'package:payflow/models/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app-colors.dart';
import 'package:payflow/shared/themes/app-text-styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                  title: Text.rich(
                    TextSpan(
                        text: "Olá, ",
                        style: TextStyles.titleRegular,
                        children: [
                          TextSpan(
                              text: "${widget.user.name}",
                              style: TextStyles.buttonBoldBackground)
                        ]),
                  ),
                  subtitle: Text("Mantenha suas contas em dia",
                      style: TextStyles.captionShape),
                  trailing: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(widget.user.photoURL!)),
                    ),
                  )),
            )),
      ),
      body: [
        MeusBoletosPage(key: UniqueKey()),
        ExtractPage(key: UniqueKey()),
      ][controller.currentPage],
      bottomNavigationBar: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    controller.setPage(0);
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.home,
                    color: controller.currentPage == 0
                        ? AppColors.primary
                        : AppColors.body,
                  )),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                    onPressed: () async {
                      await Navigator.pushNamed(context, "/barcode_scanner");
                      setState(() {});
                    },
                    icon: Icon(Icons.add_box_outlined,
                        color: AppColors.background)),
              ),
              IconButton(
                onPressed: () {
                  controller.setPage(1);
                  setState(() {});
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: controller.currentPage == 1
                      ? AppColors.primary
                      : AppColors.body,
                ),
                color: AppColors.body,
              )
            ],
          )),
    );
  }
}
