import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_hasura/app/modules/add_product/add_product_module.dart';
import 'package:mobx_hasura/app/modules/home/home_controller.dart';
import 'package:mobx_hasura/app/modules/home/home_module.dart';
import 'package:mobx_hasura/app/modules/home/widgets/product_card/product_card_widget.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);
  bool fetched = false;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeModule.to.get();
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();

    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    Future<Null> _onRefresh() async {
      setState(() {
        fetched = false;
        homeController.loadProducts();
        fetched = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        width: _screenWidth,
        decoration: BoxDecoration(color: Color(0xffdddddd)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Observer(
                builder: (_) => Scrollbar(
                  child: RefreshIndicator(
                    key: _refreshIndicatorKey,
                    onRefresh: _onRefresh,
                    child: Observer(builder: (_) {
                      if (homeController.productsList.error == true) {
                        return Text("erro");
                      }
                      if (homeController.productsList.value == null) {
                        return ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SkeletonAnimation(
                                shimmerColor: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffcdcdcd),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  height: 122,
                                  width: _screenWidth,
                                ),
                              ),
                            );
                          },
                        );
                      }
                      if (homeController.productsList.value != null) {
                        // WidgetsBinding.instance.addPostFrameCallback((_) {
                        //   _refreshController.refreshCompleted();
                        // });
                      }
                      return ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: (homeController.productsList.value.length),
                        itemBuilder: (BuildContext ctx, int index) {
                          final product =
                              homeController.productsList.value[index];
                          return ProductCardWidget(
                            screenWidth: _screenWidth,
                            productName: product.name,
                            productPrice: product.price,
                            mainCategory: product.productCategory.description,
                            secondaryCategory: product.productType.description,
                          );
                        },
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn1',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductModule()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
