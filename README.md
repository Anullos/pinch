# pinch

Flutter assignment

## Flutter assignment

This assignment is a starting point for to see my level.

### DESCRIPTION:

Your client has requested you build a new app to showcase popular games from IGDB. He’d
like you to create a simple app containing at least two screens: a list of games and a detail
screen with more information that can be opened by clicking an item in the list.
List of games
Each item in the list should at least contain an image and the name of the game. Adding more
information is up to you, as long as the UI doesn’t become too cluttered. We’d like a pull to
refresh in this view to update the data, and clicking on an item should navigate to the detail
view of the clicked game. Being able to see more content as you keep scrolling down, is a
bonus.
Game detail
The detail screen of the game should contain one image as a header, and more information
like title, description, rating etc below that. Displaying other information is - of course - not
only allowed but also encouraged. Go nuts!

### REQUIREMENTS

A must-have for the client is to be able to use the app while offline. That means: when the
game data has been acquired once, it should be available without having a working network
connection later on, also after restarting the app.
The client expects you to follow well-known practises of modern Flutter development, and
has instructed you to architect the application using the BLoC pattern. They’re making use of
the bloc_provider package at the moment, but are also open to make use of the actual bloc
package. Although you are free to choose your own packages, at least use the following:

- [Dio] (https://pub.dev/packages/dio)
- [Bloc] (https://pub.dev/packages/bloc)
- Dependency injection (of your choice)
- [Floor] (https://pub.dev/packages/floor)

#### Notes by Daniel Aranda Maestro

Need use the generator database with

```
flutter packages pub run build_runner build
```
