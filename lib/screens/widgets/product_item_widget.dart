import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/product_model.dart';
import '../update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  Future<void> deleteProduct(BuildContext context, String productId) async {
    final url = 'https://crud.teamrabbil.com/api/v1/DeleteProduct/$productId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product deleted successfully'),
          ),
        );
      } else {
        // Failure: Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Failed to delete product: ${response.statusCode}')),
        );
      }
    } catch (e) {
      // Handle exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: product.image != null && product.image!.isNotEmpty
          ? Image.network(
              product.image!,
              width: 40,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image, size: 40);
              },
            )
          : const Icon(Icons.image_not_supported, size: 40),
      title: Text(product.productName ?? 'Unknown Product'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode ?? 'Unknown'}'),
          Text('Quantity: ${product.quantity ?? 'Unknown'}'),
          Text('Price: ${product.unitPrice ?? 'Unknown'}'),
          Text('Total Price: ${product.totalPrice ?? 'Unknown'}'),
        ],
      ),
      trailing: Wrap(
        spacing: 8, // Space between buttons
        children: [
          IconButton(
            onPressed: () {
              deleteProduct(context, product.id ?? '');
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                UpdateProductScreen.name,
                arguments: product,
              );
            },
            icon: const Icon(Icons.edit, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
