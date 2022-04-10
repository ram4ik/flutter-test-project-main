# Flutter Test

Flutter application for tMDB data fetch.

## Getting Started

To run the project:

- Get TMDB key from [here](https://developers.themoviedb.org/3/getting-started/introduction)
- Open the project in your IDE.
- Create a [.evn ](https://pub.dev/packages/flutter_dotenv) file at the project root and add `TMDB_KEY= <<your key here>>`. 
- Run this command `flutter pub get` in the terminal.


## Requirements
This app has one screen i.e Main Screen:

Main screen have the following:

- Vertical List with collapsible toolbar, with first image from popular movies
- Vertical list has 4 collapsible sections, each with title and horizontally scrollable list
- The first two sections are populated when user lands on the Main screen keeping other two in collapsed state but showing the section titles. 
- Each item in the horizontal list have movie image and the movie title.
- Data is fetched for third and fourth section only if user clicks to expand any of those sections.
- User is be able to collapse, expanded section and vice versa from the section title bar.
- Latest Movies API is Polled every 30 seconds to fetch the latest data and update the view. 

<img src="https://user-images.githubusercontent.com/80252481/161983927-1d40faa3-afea-46c5-bd02-054928a57537.png" alt="drawing" width="200"/>








