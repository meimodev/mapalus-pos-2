class Branch {
  final String name;
  final String address;

  Branch({
    required this.name,
    required this.address,
  });

  @override
  String toString() {
    return 'Branch{name: $name, address: $address}';
  }
}
