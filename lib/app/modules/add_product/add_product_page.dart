import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
  bool hasFocusedDescription = false;
  bool hasFocusedPrice = false;
  bool hasFocusedCategory = false;
  bool hasFocusedType = false;

  final descriptionValidator = MultiValidator([
    RequiredValidator(errorText: 'Descrição é obrigatória'),
    MinLengthValidator(10, errorText: 'Mínimo 10 caracteres'),
    MaxLengthValidator(255, errorText: 'Máximo 255 caracteres')
  ]);

  AddProductController addProductController = AddProductModule.to.get();

  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
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
          height: _screenHeight,
          width: _screenWidth,
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
            child: Observer(
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            addProductController.loadProductsCategories();
                          },
                        ),
                        LabelWidget(text: 'Descrição'),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _descriptionController,
                          onChanged: (val) {
                            setState(() {
                              hasFocusedDescription = true;
                            });
                            addProductController.setProductDescription(val);
                          },
                          decoration: InputDecoration(
                            errorText: addProductController
                                            .productDescription.length <
                                        10 &&
                                    hasFocusedDescription
                                ? 'A descrição deve ter no mínimo 10 caracteres'
                                : null,
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
                          onTap: () => setState(() {
                            hasFocusedPrice = true;
                          }),
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            addProductController
                                .setProductPrice(double.parse(val));
                            print(val.length);
                          },
                          decoration: InputDecoration(
                            errorText: addProductController.productPrice <= 0 &&
                                    hasFocusedPrice
                                ? 'O preço precisa ser maior que zero'
                                : null,
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
                          height: 10,
                        ),
                        Divider(color: Colors.grey),
                        SizedBox(
                          height: 10,
                        ),
                        LabelWidget(text: 'Categoria'),
                        SizedBox(
                          height: 16,
                        ),
                        addProductController.categoriesDropDownItems.value ==
                                null
                            ? Center(child: CircularProgressIndicator())
                            : DropdownButton(
                                isExpanded: true,
                                items: addProductController
                                    .categoriesDropDownItems.value,
                                value: addProductController
                                    .productCategoryDropdownValue,
                                hint: Text('Categoria'),
                                // searchHint: Text('Nome'),
                                onChanged: (val) {
                                  addProductController
                                      .setProductCategoryDropdownValue(val);
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
                        addProductController.typesDropdownItems.value == null
                            ? Center(child: CircularProgressIndicator())
                            : DropdownButton(
                                isExpanded: true,
                                items: addProductController
                                    .typesDropdownItems.value,
                                value: addProductController
                                    .productTypeDropdownValue,
                                hint: Text('Tipo'),
                                onChanged: (val) {
                                  addProductController
                                      .setProductTypeDropdownValue(val);
                                },
                              ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Divider(
                          color: Colors.grey,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.all(12),
                            width: _screenWidth,
                            decoration: BoxDecoration(
                                color: addProductController.isValid()
                                    ? Theme.of(context).primaryColor
                                    : Color(0xffdddddd),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Text(
                              'Adicionar Produto'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: addProductController.isValid()
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
