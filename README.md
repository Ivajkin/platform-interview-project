# Spongecell Interview Project

## Overview

Among other things, we here at Spongecell build ads.  In this exercise, you're tasked with building a small application that produces an ad from a JSON input.  You should use the existing build system in this repository to run a server for local development.

For our purposes, ads have two constructs - screens and elements.  A screen is a container of elements and represents what is visible in the ad at a certain state.

An element is an object within the screen.  For this exercise, there will only be two types of elements - image and text.  As you can see in the JSON settings, the image has a masterAssetId property that corresponds to the assets in the response.


## Task
```http://live.spongecell.com/interview/ad_revision.json```

Your application must fetch JSON from the above URL and assemble a basic ad as HTML. The dimensions of the ad are specified in the JSON response under 'size'.  Elements must match the size and position in the settings (position is stored as a percentage in the JSON).  Image elements should load their corresponding assets and text should be displayed according to the style specified in the element settings.

## Requirements:
- npm
- node@6.3.0
- npm install -g bower
- npm install -g gulp-cli

## Setup
- npm i
- bower i
- gulp serve