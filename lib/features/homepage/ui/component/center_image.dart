class CenterImage extends StatelessWidget {
  const name({Key key}) : super(key: key);
  String tag;
  String url;

  CenterImage({this.tag,this.url})

  @override
  Widget build(BuildContext context) {
    return Positioned(
                          top: 100,
                          height: 300,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Hero(
                              tag: tag  ,
                              child: Material(
                                borderRadius: BorderRadius.circular(12),
                                elevation: 6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                      width: 200,
                                      height: 300,
                                      color: Colors.red,
                                      child: Image.network(
                                        url,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                          ));
  }
}