# Project Proposal
By: Giovanni Mineo, Austin Ulfers, Anna Tegelberg, and Noah Thompson

## Project Description: Extinct Languages
The dataset that our group is working with is a compilation of different languages around the world that are or near extinction. For each language, the dataset tells us many things: degree of endangerment, number of speakers, and the exact coordinates to where the language originated. Giovanni found this dataset on kaggle and it can be found at the following link: https://www.kaggle.com/the-guardian/extinct-languages/data.

Our **target audience** are people from all over the world. We hope to shed light on how diverse our universe is, as well as show how cultures are becoming endangered or going extinct. We believe this data is relevant to society because language is a part of people’s identities, as we as people should help to prevent these languages from going extinct in order to preserve people’s cultures. From our research, people can discover where these languages originated, as well as where they are being spoken, so they can dig deeper into their own personal culture and identity.
Our audience will want to be able to visualize the history behind these languages. Where did it originate? Who speaks it? How endangered is it?

Some questions we plan to answer are:

1. *What is the languages level of endangerment?*
2. *How many people speak this language?*
3. *Where did this language originate?*
4. *Where is this language spoken?*

## Technical Description
This section of your proposal is an opportunity to think through the specific analytical steps you'll need to complete throughout the project.

*How will you be reading in your data?*

We will be reading data in from a static CSV from 2016.

*What types of data-wrangling (reshaping, reformatting, etc.) will you need to do to your data?*

We luckily don’t have to do much manipulating with the data since it is all already correctly formatted. However we will have to separate out the country names in the “Countries Spoken” column.
https://www.kaggle.com/the-guardian/extinct-languages/data

*What (major/new) libraries will be using in this project (no need to list common libraries that are used in many projects such as dplyr)?*

As of right now, it doesn’t look like we will be using any uncommon libraries for this project. However, this may change in the future if we find something that will better suit our needs. We will most likely use plotly and shiny for parts of this project.

*What major challenges do you anticipate?*

The biggest issue we are anticipating is creating a plotly graph that is interactive with our desired features.
