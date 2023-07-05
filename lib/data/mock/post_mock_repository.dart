import 'package:el_carpintero_moderno_app/domain/entities/post.dart';
import 'package:el_carpintero_moderno_app/domain/entities/step.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/post_repository.dart';
import 'package:logging/logging.dart';

class PostMockRepository implements PostRepository {
  factory PostMockRepository() => _instance;
  Logger _logger;

  static final PostMockRepository _instance = PostMockRepository._internal();

  PostMockRepository._internal() : _logger = Logger('NewsMockRepository');

  @override
  Future<List<Post>> getPosts(int quantity) async {
    try {
      List<Post> posts = <Post>[];
      posts
        ..add(Post(
          title: "Mesa de Centro",
          description: "Mesa bonita",
          rating: 4.2,
          difficulty: "Facil",
          tools: ["Martillo", "Taladro"],
          materials: ["Lamina de madera 50x50"],
          steps: [
            Step(body: "Martillar lamina"),
            Step(body: "Taladrar lamina")
          ],
          previewImage:
              "https://images.lider.cl/wmtcl?source=url[file:/productos/1229585a.jpg]&sink",
        ))
        ..add(Post(
          title: "Silla gamer de madera",
          description:
              "Silla aumenta FPS brigidoooooooooooooooooooooooooooooo hola texto de ejemplo",
          rating: 1.2,
          difficulty: "Facil",
          tools: ["Martillo"],
          materials: ["Lamina de madera 50x50"],
          steps: [
            Step(body: "Martillar lamina"),
            Step(body: "Taladrar lamina")
          ],
          previewImage:
              "https://i.pinimg.com/736x/0b/29/ed/0b29ed7f5aaddc16536967240487cf04.jpg",
        ))
        ..add(Post(
          title: "Mesa de Centro",
          description: "Mesa bonita",
          rating: 4.2,
          difficulty: "Facil",
          tools: ["Martillo", "Taladro"],
          materials: ["Lamina de madera 50x50"],
          steps: [
            Step(body: "Martillar lamina"),
            Step(body: "Taladrar lamina")
          ],
          previewImage:
              "https://images.lider.cl/wmtcl?source=url[file:/productos/1229585a.jpg]&sink",
        ))
        ..add(Post(
          title: "Silla gamer de madera",
          description:
              "Silla aumenta FPS brigidoooooooooooooooooooooooooooooo hola texto de ejemplo",
          rating: 1.2,
          difficulty: "Facil",
          tools: ["Martillo"],
          materials: ["Lamina de madera 50x50"],
          steps: [
            Step(body: "Martillar lamina"),
            Step(body: "Taladrar lamina")
          ],
          previewImage:
              "https://i.pinimg.com/736x/0b/29/ed/0b29ed7f5aaddc16536967240487cf04.jpg",
        ));
      _logger.finest('PostMockRepository successful');
      return posts;
    } catch (e) {
      _logger.severe('PostMockRepository unsuccessful');
      rethrow;
    }
  }

  @override
  Future<bool> newPost(Post post, String token) {
    // TODO: implement newPost
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> searchWithText(String title) {
    // TODO: implement searchWithText
    throw UnimplementedError();
  }
}
