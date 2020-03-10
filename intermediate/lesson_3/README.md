#LESSON 3

## Async programming

What to use to react to asynchronous events

* Streams
* Futures

## Streams

Streams are messengers that emit data.

https://api.flutter.dev/flutter/dart-async/Stream-class.html

What we will use a lot in flutter are StreamBuilders

https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html

```
StreamBuilder<DateTime>(
            stream: model.timeStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('There is error');
              }
              return Text(
                snapshot.data.toString(),

//        Predefined styles from theme. There is more!
                style: Theme.of(context).textTheme.display3,
              );
            }),
```

## Futures

Futures are async way of programming code to background thread.

If everything would be run on the main thread, we would have problems.

https://api.flutter.dev/flutter/dart-async/Future-class.html

```
Future<bool> asyncFunction () async {
  await someOtherAsyncFunction();
  return true;
}
There is future builder as well
https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html


Homework

1. Install flutter gallery `flutter/examples/flutter_gallery`
2. Play with different clock options
3. Continue with your own app
4. [Check Almas Tic Tac Toe](https://github.com/almasmajic/tictactoe)


5. https://flutter.dev/docs/codelabs#firebase-for-flutter