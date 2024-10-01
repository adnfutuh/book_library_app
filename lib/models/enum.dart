enum Category {
  biografi(title: 'biografi'),
  fiksi(title: 'fiksi'),
  nonFiksi(title: 'nonFiksi'),
  sejarah(title: 'sejarah');

  final String title;
  const Category({required this.title});
}

enum Availability { available, borrowed }
