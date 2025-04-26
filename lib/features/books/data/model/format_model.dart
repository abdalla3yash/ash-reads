
class Formats {
  String? textHtml;
  String? applicationEpubZip;
  String? applicationXMobipocketEbook;
  String? applicationRdfXml;
  String? imageJpeg;
  String? textPlainCharsetUsAscii;
  String? applicationOctetStream;
  String? textPlainCharsetUtf8;
  String? textHtmlCharsetUtf8;
  String? textPlainCharsetIso88591;
  String? textHtmlCharsetIso88591;

  Formats(
      {this.textHtml,
      this.applicationEpubZip,
      this.applicationXMobipocketEbook,
      this.applicationRdfXml,
      this.imageJpeg,
      this.textPlainCharsetUsAscii,
      this.applicationOctetStream,
      this.textPlainCharsetUtf8,
      this.textHtmlCharsetUtf8,
      this.textPlainCharsetIso88591,
      this.textHtmlCharsetIso88591});

  Formats.fromJson(Map<String, dynamic> json) {
    textHtml = json['text/html'];
    applicationEpubZip = json['application/epub+zip'];
    applicationXMobipocketEbook = json['application/x-mobipocket-ebook'];
    applicationRdfXml = json['application/rdf+xml'];
    imageJpeg = json['image/jpeg'];
    textPlainCharsetUsAscii = json['text/plain; charset=us-ascii'];
    applicationOctetStream = json['application/octet-stream'];
    textPlainCharsetUtf8 = json['text/plain; charset=utf-8'];
    textHtmlCharsetUtf8 = json['text/html; charset=utf-8'];
    textPlainCharsetIso88591 = json['text/plain; charset=iso-8859-1'];
    textHtmlCharsetIso88591 = json['text/html; charset=iso-8859-1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text/html'] = textHtml;
    data['application/epub+zip'] = applicationEpubZip;
    data['application/x-mobipocket-ebook'] = applicationXMobipocketEbook;
    data['application/rdf+xml'] = applicationRdfXml;
    data['image/jpeg'] = imageJpeg;
    data['text/plain; charset=us-ascii'] = textPlainCharsetUsAscii;
    data['application/octet-stream'] = applicationOctetStream;
    data['text/plain; charset=utf-8'] = textPlainCharsetUtf8;
    data['text/html; charset=utf-8'] = textHtmlCharsetUtf8;
    data['text/plain; charset=iso-8859-1'] = textPlainCharsetIso88591;
    data['text/html; charset=iso-8859-1'] = textHtmlCharsetIso88591;
    return data;
  }

  Map<String, dynamic> toMap() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['text/html'] = textHtml;
  data['application/epub+zip'] = applicationEpubZip;
  data['application/x-mobipocket-ebook'] = applicationXMobipocketEbook;
  data['application/rdf+xml'] = applicationRdfXml;
  data['image/jpeg'] = imageJpeg;
  data['text/plain; charset=us-ascii'] = textPlainCharsetUsAscii;
  data['application/octet-stream'] = applicationOctetStream;
  data['text/plain; charset=utf-8'] = textPlainCharsetUtf8;
  data['text/html; charset=utf-8'] = textHtmlCharsetUtf8;
  data['text/plain; charset=iso-8859-1'] = textPlainCharsetIso88591;
  data['text/html; charset=iso-8859-1'] = textHtmlCharsetIso88591;
  return data;
}
 factory Formats.fromMap(Map<String, dynamic> map) {
    return Formats(
      textHtml: map['text/html'],
      applicationEpubZip: map['application/epub+zip'],
      applicationXMobipocketEbook: map['application/x-mobipocket-ebook'],
      applicationRdfXml: map['application/rdf+xml'],
      imageJpeg: map['image/jpeg'],
      textPlainCharsetUsAscii: map['text/plain; charset=us-ascii'],
      applicationOctetStream: map['application/octet-stream'],
      textPlainCharsetUtf8: map['text/plain; charset=utf-8'],
      textHtmlCharsetUtf8: map['text/html; charset=utf-8'],
      textPlainCharsetIso88591: map['text/plain; charset=iso-8859-1'],
      textHtmlCharsetIso88591: map['text/html; charset=iso-8859-1'],
    );
  }

}