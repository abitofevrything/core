class ImageFormatter {
  String? id;

  ImageFormatter(this.id);

  String get url => 'https://cdn.discordapp.com/$id';

  String toBase64() {
     return ''; // todo
  }
  // todo refaire totalement ce fichier car pas clair
}