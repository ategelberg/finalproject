# Project Proposal
By: Giovanni Mineo, Austin Ulfers, Anna Tegelberg, and Noah Thompson

## Project Description: Police Force
The dataset that our group is working with is a compilation of Seattle police incidents where an officer used excessive force since 2014. For each incident, the dataset tells us many thing, including location, level of force used, victim race and gender, officer, and precinct. Anna found this dataset on the City of Seattle data records. It can be found at the following link: https://data.seattle.gov/Public-Safety/Use-Of-Force/ppi5-g2bj
Our **target audience** is civilians and police officers of Seattle, Washington. Predominantly, our target audience are civilians. We hope to shed light on the nature of police violence in Seattle, looking at where and who police force trends affect. We think this data is relevant currently in society with increased coverage on police force, and would like to see what Seattle looks like when it comes to police force. From our research, citizens of Seattle can become more informed about how police in our city are treating citizens.
Our audience will want to see who and what areas in Seattle are most affected by police force. Are there trends in race, neighborhood, police precinct?

Some questions we plan to answer are:

1. *What percentage of police force instances in Seattle occur against African Americans, and similarly all people of color?*
2. *What Seattle neighborhood faces the most police force?*
3. *What precinct is most likely to use force?*
4. *What force classification is most likely depending on different gender and race combinations?*

## Technical Description
This section of your proposal is an opportunity to think through the specific analytical steps you'll need to complete throughout the project.

*How will you be reading in your data?*

We will be reading data in from Seattle’s data API.

*What types of data-wrangling (reshaping, reformatting, etc.) will you need to do to your data?*

We will need to somehow figure out a location for each of the regions. As of right now, the regions don’t have any latitudes or longitudes. However, a beat is provided, which is a police method of tracking location. We can potentially join our dataframe with a dataframe from the following link to find locations associated with beat id’s. https://data.seattle.gov/Public-Safety/Seattle-Police-Department-Beats/nnxn-434b/data
Additionally, some columns should be formatted as integers but are currently formatted as text.

*What (major/new) libraries will be using in this project (no need to list common libraries that are used in many projects such as dplyr)?*

As of right now, it doesn’t look like we will be using any uncommon libraries for this project. However, this may change in the future if we find something that will better suit our needs. We will most likely use plotly and shiny for parts of this project.

*What major challenges do you anticipate?*

Determining what each column means in terms of what the row value means. There is some confusion regarding various terms used in the dataset.
