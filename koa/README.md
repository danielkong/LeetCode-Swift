# Features:
	1. Procide a movie search results list or grid view.
	2. Each result should show movie name, director, year, brief intro, and poster.
	3. Show a detail view when search result is selected and be creative with display.
	4. Allow user to favortie movies from search results.
	5. Show all favorite movies in a second tab, and persist favorite across app launches.
	6. Show favorite status in search results if a moview has been added to favorites.
	7. Support all orientations on iPadd and portrait only for iPhone.
	8. Notify the user when unabble to perform a search.


# Solutions:
## Pairing to each requirement bullet:
	1. `MovieTableViewController` supports movie search results list view. It also support Favorite List since they are almost the same, expect search bar. 
	2.  `MovieTableViewCell` supports show all info about the movie and poster.
	3. `MovieDetailViewController` supports detail view when selects from result list.
	4. In `MovieDetailViewController` there is a favorite button support favorite function.
	5. `MovieTableViewController` supports show all favorites movies.
	6. Support show favorite status in search results via function `cellForRowAtIndexPath` in `MovieTableViewController`.
	7. Change `Supported interface orientations` in `info.plist` to support iPhone portrait only and all for iPad. 
	8. Notify user if there is no Internet, or no results for user's term.
## Extra work:
	1. Add Empty State View for table view, when no data in table view.
	2. Let network indicator activity spining in status bar during fetching search results.	
	3. Adaptive iPhone X layout.
	4. Do the caching for image loading.
## Summary:
	1. Use programmatically autolayout handle UI layer.
	2. Use memory cache to save image data, and save favorite data into File System. Since this is for interview project in short time, I use File System to do the Storage for the interview and taking the advantage the data is small, and image is small. What we could enhanced for this is when frequently save to file, we could do batch to reduce the IO operations. For larger data storage and long term project, I would prefer to use Core Data or SQLite to save the data since we are trying to avoid frequently read/write to IO.

