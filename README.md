# DS_DigItGames

This is a concentration (card matching) game for iOS, written in Objective-C. I followed Stanford's iPhone Application Development Online Course to get familiar with Objective-C and XCode environment.
I started to write the code based on Lecture 2 (http://web.stanford.edu/class/cs193p/cgi-bin/drupal/system/files/lectures/Lecture%202.pdf) and worked on top of it. 

###Third Party Plugins:
- CircleProgressBar (https://github.com/Eclair/CircleProgressBar)
- JTAlertView (https://github.com/kubatru/JTAlertView)

###Improvement Points
- Currently the matching system works as follows: 
Once you tap on a card, it becomes selected, if the following card matches with the first card, you score a match and you start over. If the second card doesn't match, then the second card becomes the first card and you try to match a card to this card.
This can be improved by having if no match, start over with a fresh card.
- Currently the cards layout is done by hand. I was not very familiar with the grid systems and anchoring in XCode, I laid them out by hand. This process can be optimized to add/remove cards easily.




