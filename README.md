
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<br />
<p align="center">
  <a href="https://github.com/DouweHorsthuis/ICA_Practice/">
       <img src="images/logo.jpeg" alt="Logo" width="286" height="120">
  </a> 

<h3 align="center">Practice for deleting IC components</h3>

<h4 align="center">This project is build so that people can practice what components they should delete after doing an Independent Component Analysis (ICA).  It uses EEGLAB and it's IClabel toolbox. </h4>


**Table of Contents**
  
1. [About the project](#about-the-project)
    - [Built With](#built-with)
3. [Manual vs. IClabel](#manual-vs.-iclabel)
3. [Contact](#contact)
3. [Acknowledgement](#acknowledgement)
3. [Usage](#usage)




<!-- ABOUT THE PROJECT -->
## About The Project
[This is a video made by one of the creators of EEGlab that explains ICA.](https://youtu.be/kWAjhXr7pT4?list=PLXc9qfVbMMN2uDadxZ_OEsHjzcRtlLNxc)

We use ICA to clean our data, but we focus mainly on the eyecomponents. This is because these cause big artifacts in the data and are both identifiable by people that are trained experts and this IClabel toolbox. You can delete other "bad" components as well such as noisy channels or other noise types.  
However the main problem for all of these components is that they are a mixture of things. IClabel breaks every component down into 7 parts. 1 = Brain, 2 = muscle, 3= eye, 4 = Heart, 5 = Line Noise, 6 = channel noise, 7 = other. This means that an component with 70% eye, can still have 30% brain. Luckily this is very unlikely. There is always a mixture of these, but specifically for eye components it's works out that with the >70% eye and <10% brain threshold IClabel catches all the same components as the experts in our lab. 

However, we don't want to just blindly rely on a toolbox when we can do thing manually as well. By practicing we learn what components are bad and why. When running this script you are asked if you want to delete eye components only or also other noise components. You can do as you want to, but it's more difficult/no clear what the best thresholds and criteria are for deleting other components.

### Built With

* [EEGlab](https://github.com/sccn/eeglab)
* [IClabel](https://github.com/sccn/ICLabel)



<!-- ROADMAP -->
## Manual vs. IClabel

When delete eye components manually this is what people focused on:
1.  topoplots, as you can see in the figure underneath here each IC has a topo plot. When looking for eye components they look one of 2 ways. Either they look like component 1 (eye blink) or like component 22 (horizontal eye movement)  
[![topoplots](https://github.com/DouweHorsthuis/ICA_Practice/blob/main/testing/topoplots.PNG)]
2. when opening the components 
    - you look if there is any activity above 0 in the 0-50Hz range (depending where you low pass filter cuts it you should see a big drop, here at 45Hz)
    - since it's eye data, it should happen throughout the paradigm so in the continuous data, you should see activity in most/all of the trails.  
    [![Eye blink](https://github.com/DouweHorsthuis/ICA_Practice/blob/main/testing/IC1.PNG)] [![Eye movement](https://github.com/DouweHorsthuis/ICA_Practice/blob/main/testing/IC22.PNG)]   
 

IClabel is build using the input of a lot of users to train the program. This means that it's also based on the input of less expert humans. 

Similarities: when we tested it in our lab we noticed that for eye components if we set the threshold to >70% eye and <10% brain the toolbox would exclude the same amount of eye components as we would. 
Differences: when we tested what other components to delete (we decided to not delete "other" and "brain") it became impossible for anyone to delete the same components as the toolbox would. 

Potential conclusion: Eye components are well spotted by both experienced people in our lab as well as the toolbox. However when it comes to other components this becomes less the case.



## Contact

Douwe Horsthuis - douwehorsthuis@gmail.com


<!-- ACKNOWLEDGEMENTS -->
## Made possible by

* [Ana Francisco](https://github.com/anafrancisco)
* [Douwe Horsthuis](https://github.com/DouweHorsthuis)
* [Filip De Sanctis](https://github.com/pdesanctis)
* Sophie Molholm
* [Seyda Tikir](https://github.com/tikirs)


[contributors-shield]: https://img.shields.io/github/contributors/DouweHorsthuis/ICA_Practice.svg?style=for-the-badge
[contributors-url]: https://github.com/DouweHorsthuis/ICA_Practice/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/DouweHorsthuis/ICA_Practice.svg?style=for-the-badge
[forks-url]: https://github.com/DouweHorsthuis/ICA_Practice/network/members
[stars-shield]: https://img.shields.io/github/stars/DouweHorsthuis/ICA_Practice.svg?style=for-the-badge
[stars-url]: https://github.com/DouweHorsthuis/ICA_Practice/stargazers
[issues-shield]: https://img.shields.io/github/issues/DouweHorsthuis/ICA_Practice.svg?style=for-the-badge
[issues-url]: https://github.com/DouweHorsthuis/ICA_Practice/issues
[license-shield]: https://img.shields.io/github/license/DouweHorsthuis/ICA_Practice.svg?style=for-the-badge
[license-url]: https://github.com/DouweHorsthuis/ICA_Practice/blob/master/LICENSE.txt

