import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_hasura/app/modules/add_product/add_product_controller.dart';
import 'package:mobx_hasura/app/modules/add_product/add_product_module.dart';
import 'package:mobx_hasura/app/shared/widgets/label/label_widget.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class AddProductPage extends StatefulWidget {
  final String title;
  const AddProductPage({Key key, this.title = "AddProduct"}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  AddProductController addProductController = AddProductModule.to.get();
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          width: _screenWidth,
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  addProductController.loadProductsCategories();
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                child: Observer(
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        LabelWidget(text: 'Descrição'),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xffdddddd))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).primaryColor),
                            ),
                            hintText: 'Descrição do produto',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LabelWidget(text: 'Preço'),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xffdddddd))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).primaryColor),
                            ),
                            hintText: 'Preço do produto',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LabelWidget(text: 'Categoria'),
                        SizedBox(height: 16,),
                        addProductController.categoriesDropDownItems.value == null
                            ? Center(child: CircularProgressIndicator())
                            : SearchableDropdown(
                                isExpanded: true,
                                items: addProductController.categoriesDropDownItems.value,
                                value: addProductController.productCategoryDropdownValue == null 
                                ? addProductController.categoriesDropDownItems.value[0].value
                                :  addProductController.productCategoryDropdownValue,
                                hint: Text('Nome'),
                                searchHint: Text('Nome'),
                                onChanged: (val) {
                                  addProductController.setProductCategoryDropdownValue(val);
                                },
                              ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LabelWidget(text: 'Tipo'),
                        SizedBox(
                          height: 16,
                        ),
                        SearchableDropdown(
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                                child: Text('Fernando'), value: 'Fernando'),
                            DropdownMenuItem(
                                child: Text('Antonio'), value: 'Antonio'),
                          ],
                          value: 'Fernando',
                          hint: Text('Nome'),
                          searchHint: Text('Nome'),
                          onChanged: (val) {
                            print(val);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
