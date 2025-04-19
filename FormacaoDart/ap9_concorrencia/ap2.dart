import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

Future<void> baixarImagens(List<String> urls) async {
  print('Baixando imagens...');

  for (String url in urls) {
    try {
      final resposta = await http.get(Uri.parse(url));

      if (resposta.statusCode == 200) {
        final nomeArquivo = basename(url);
        //  library.
        print('Imagem $nomeArquivo baixada com sucesso (conteúdo):');
      } else {
        print(
          'Falha ao baixar ${basename(url)}: Status ${resposta.statusCode}',
        );
      }
    } catch (e) {
      print('Erro ao baixar ${basename(url)}: $e');
    }
  }

  print('Download concluído!');
}

Future<void> main() async {
  List<String> urls = [
    'https://www.easygifanimator.net/images/samples/video-to-gif-sample.gif',
    'https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif',
    'https://example.com/imagem3.jpg', // This will likely fail
  ];

  await baixarImagens(urls);
}
