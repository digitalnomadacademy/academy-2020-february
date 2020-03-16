#LESSON 5

Flutter beginning
https://flutter.dev/docs/development/ui/layout

## Row

horizontal layout
```
Row(
  children: <Widget<[

  .....

  ])
```

## Column

vertical layout
```
Row(
  children: <Widget<[

  .....

  ])
```
## Center

container for another widget that can be decorated
```
Center(
  height: 50,
  width: 50,
  color: Colors.red,
  child: Container() // any widget
)
```

##Homework

Clone lesson 5
https://github.com/digitalnomadacademy/lesson-5-row-column-container.git

1. Play with each Page
Learn what is
* mainAxisAlignment
* crossAxisAlignment
* mainAxisSize
* children
for Row and Column

 for Container
* height
* width
* color
* decoration
* child

for Scaffold
* body

more widgets to play with are
`Align` `Padding`

```
...
      ),
      home: ContainerPage(),
      // home: EmptyText(),
      ..... itd. Sve classe iz fileova
    );
...
```

2. Create a container with your own image inside
as decoration, and that container has a child with Text of
two first letters of your name and surname

3. Create chess board in flutter

ZAKZV

4. Create a drawing with `Stack` and with `Positioned` widgets.

