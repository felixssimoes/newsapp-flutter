# News App

## Sections

- Home / For You
- Headlines
- Following
- Sources

## Features

### Home

- list news articles based on what the user has selected in the following section

## Folder structure

- core/

  - data/
    - api/
    - database/
  - presentation/
    - widgets/
    - navigation/
    - dialogs/
  - exceptions/
  - analytics/

- articles/

  - application/
    - articles notifiers
    - article service
  - domain/
    - article model
    - articles repository interface
    - saved articles repository interface
  - data/
    - articles remote repository
    - saved articles local repository
  - presentation/
    - widgets/
      - article list tile
      - article options/
        - article options icon button
        - article options menu?
    - details/
      - article details screen
      - article details controller

- home/

  - application/
    - home notifiers
  - presentation/
    - widgets/
      - top stories
      - highlights
    - home screen

- search/

  - application/
    - search notifiers
    - search service
  - domain/
    - search results model
    - previous search model
    - previous searches repository interface
  - data/
    - previous searches local repository
  - presentation/
    - widgets/
      - search app bar button
      - previous search list tile
      - search text field
    - search
      - search screen
      - search controller
    - results/
      - search results screen

- headlines/

  - application/
    - headlines notifiers
  - domain/
    - headline category model
    - headlines repository interface
  - data/
    - headlines remote repository
  - presentation/
    - widgets/
      - category selector
    - list/
      - headlines list screen

- following/

  - application/
    - following notifiers
  - presentation/
    - list/
      - following list screen
    - saved searches/
      - saved searches controller
      - saved searches screen
    - category/
      - category articles screen

- sources/ (include country selection)

  - application/
    - sources notifiers
    - sources service?
  - presentation/
    - list/
      - sources list screen
    - details/
      - source details screen
      - source details controller?
