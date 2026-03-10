import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import './movie_detail_page.dart';
import './login_page.dart';

class MovieListPage extends StatelessWidget {
  final String username;
  const MovieListPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    /*
      implementasikan widget untuk menampilkan list movie yang sudah diambil dari dummy data
        - gunakan ListView.builder untuk menampilkan list movie
        - setiap item movie ditampilkan menggunakan Card widget yang berisi judul movie dan poster movie
        - ketika item movie ditekan, navigasikan ke halaman MovieDetailPage dengan membawa data movie yang dipilih
    */

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome, $username!',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return MovieListItem(movie: movieList[index]);
        },
      ),
    );
  }
}

class MovieListItem extends StatefulWidget {
  final MovieModel movie;
  const MovieListItem({super.key, required this.movie});

  @override
  State<MovieListItem> createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailPage(movie: widget.movie),
            ),
          );
        },
        child: Stack(
          children: [
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        widget.movie.imgUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Text(
                              '${widget.movie.title} (${widget.movie.year})',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(widget.movie.genre),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              Text('${widget.movie.rating}/10'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isBookmarked = !isBookmarked;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
