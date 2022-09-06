import 'package:flutter/material.dart';
import 'package:m_shopping/controller/providers/products_provider.dart';
import 'package:m_shopping/model/repository/products_repo.dart';
import 'package:m_shopping/view/app_data/app_colors.dart';
import 'package:m_shopping/view/app_data/app_text_style.dart';
import 'package:m_shopping/view/screens/cart.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late ProductsProvider productsProvider;
  List? productsList;
  List cartItems = [];
  void fetchData() async {
    productsList = await productsProvider.productsApi();
    print(productsList);
  }

  @override
  void initState() {
    productsProvider = Provider.of<ProductsProvider>(context, listen: false);
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cart(
                              cartItems: cartItems,
                            )));
              },
              icon: Icon(Icons.shopping_cart),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
          child:
              Consumer<ProductsProvider>(builder: (context, provider, child) {
            return provider.isLoaded
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 16 / 14,
                    ),
                    itemCount: provider.productsModel!.length,
                    itemBuilder: (context, index) => Card(
                      color: AppColors.white,
                      elevation: 5,
                      child: Stack(
                        children: [
                          Container(
                            // height: 50,
                            padding: EdgeInsets.all(8.0),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Image.network(
                              provider.productsModel![index]["image"],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            left: 5,
                            child: Text(
                              "\u20B9 ${provider.productsModel![index]["price"]}",
                              style:
                                  AppTextStyle.font12OpenSansBoldBlueTextStyle,
                            ),
                          ),
                          Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  print("Add to cart");
                                  cartItems.add(provider.productsModel![index]);
                                  final snackBar = SnackBar(
                                    content: Text(
                                      "Added to cart",
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle
                                          .font12OpenSansRegularRedTextStyle,
                                    ),
                                    backgroundColor: (AppColors.black),
                                    duration: const Duration(seconds: 1),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Icon(
                                  Icons.add_business_rounded,
                                  color: AppColors.deepBlue,
                                ),
                              )),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            right: 5,
                            child: Text(
                              provider.productsModel![index]["title"],
                              style:
                                  AppTextStyle.font12OpenSansBoldBlueTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          }),
        ));
  }
}



  // ElasticInDown(
  //       duration: context.durationSlow,
  //       child: GridView.builder(
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2),
  //         itemCount: viewModel.items.length,
  //         itemBuilder: (context, index) => Padding(
  //           padding: context.paddingLow,
  //           child: ItemCard(
  //             context: context,
  //             model: viewModel.items[index],
  //             viewModel: viewModel,
  //           ),
  //         ),
  //       ),
  //     )