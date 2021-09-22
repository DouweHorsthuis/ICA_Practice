
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
3. [Contributing](#contributing)
3. [License](#license)
3. [Contact](#contact)
3. [Acknowledgement](#acknowledgement)
3. [Usage](#usage)




<!-- ABOUT THE PROJECT -->
## About The Project
[![ICA Video](https://youtu.be/kWAjhXr7pT4?list=PLXc9qfVbMMN2uDadxZ_OEsHjzcRtlLNxc)](https://youtu.be/kWAjhXr7pT4?list=PLXc9qfVbMMN2uDadxZ_OEsHjzcRtlLNxc)




### Built With

* [EEGlab](https://github.com/sccn/eeglab)
* [IClabel](https://github.com/sccn/ICLabel)



<!-- ROADMAP -->
## Manual vs. IClabel

When delete components manually this is what people focused on:



IClabel is build using the input of a lot of users to train the program. This means that it's also based on the input of less expert humans. 

Similarities: when we tested it in our lab we noticed that for eye components if we set the threshold to >70% eye and <10% brain the toolbox would exclude the same amount of eyecomponents as we would. 
Differences: when we tested what other components to delete (we decided to not delete "other" and "brain") it became impossible for anyone to delete the same components as the toolbox would. 

Potential conclusion: Eye components are well spotted by both experienced people in our lab as well as the toolbox. However when it comes to other components this becomes less the case.



<!-- CONTRIBUTING -->
## IC components explained

Put here the eyecomponents



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Douwe Horsthuis - douwehorsthuis@gmail.com
Project Link: [https://github.com/DouweHorsthuis/ICA_Practice/](https://github.com/DouweHorsthuis/ICA_Practice/)



<!-- ACKNOWLEDGEMENTS -->
## Made possible by

* [Ana Francisco](https://github.com/anafrancisco)
* [Douwe Horsthuis](https://github.com/DouweHorsthuis)
* [Filip De Sanctis](https://github.com/pdesanctis)
* Sophie Molholm
* [Seyda Tikir](https://github.com/tikirs)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
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

