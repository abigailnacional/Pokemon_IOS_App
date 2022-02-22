# CS 290 Final Project
Spring 2022

Overview of Project
 
**1. Description of app**

We plan to develop a Pokemon Inventory app, in which the user can select a customized cohort of Pokemon and add it to their inventory. The app will use the Pokemon API to generate information about the Pokemon, allow the user to favorite or dislike Pokemon, and create different groups of Pokemon (e.g. “Pokemon I Would Like to Go On a Picnic With” or “Pokemon That Could be My Best Friend”) for whom they can see collective analytics, like the group’s collective strength or weakness in battle. If time permits, we also plan to build functionality so the user can log the location where they found a particular Pokemon (for instance, a map view displaying where and when a user “found” Pikachu). 
 
**2. Specific iOS/API technologies we will use**

Poke API (Pokemon API)
[Gets data about Pokemon and the Pokemon Universe
https://english.api.rakuten.net/stefan.skliarov/api/Poke/endpoints]
 
MVVM: Pokemon List View, Detail View of the Pokemon selected showing info, TabView to navigate to a list of personal inventories and their respective strength or weakness in battle. Buttons to select and add Pokemon to the inventory.
 
**3. Potential sources of complexity and difficulty**

We think it may be difficult to rate the strength of the group of Pokemon selected, since we have to combine multiple Pokemon to do this. It may also prove difficult to deal with abundance of items, since we have to organize 850 different Pokemon in the view. If we create a map view for the Pokemon, it will potentially prove challenging to display the points on a map and coordinate with a map API. Finally, we may face bugs with regards to subscribing changes to the data store and calling the API when generating the group of Pokemon.
