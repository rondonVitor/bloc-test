import 'package:bloc_test/features/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  ProductPage({ Key? key }) : super(key: key);

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    var bloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Produto'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<ProductBloc, ProductState>(
            bloc: bloc,
            builder: (context, state) {
              var stateProduct = (state as ProductDefaultState);
              var product = stateProduct.product;
              return ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nome'
                    ),
                    onChanged: (name) => bloc.add(ProductEventUpdate(name: name)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Categoria'
                    ),
                    onChanged: (category) => bloc.add(ProductEventUpdate(category: category)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Imagem'
                    ),
                    onChanged: (image) => bloc.add(ProductEventUpdate(image: image)),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Valor'
                    ),
                    onChanged: (value) => bloc.add(ProductEventUpdate(value: double.parse(value))),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Código de Barras'
                    ),
                    onChanged: (barCode) => bloc.add(ProductEventUpdate(barCode: barCode)),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name),
                        Text(product.category),
                        Text(product.image),
                        Text(product.value.toString()),
                        Text(product.barCode),
                      ],
                    ),
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}