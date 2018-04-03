---
title: Wedding aRtwoRk
author: Peter Hickey
date: '2018-04-02'
publishDate: '2018-04-03T16:00:00-04:00'
categories:
  - R
tags:
  - aRt
  - sentence drawing
  - same-sex marriage
  - dataviz
slug: wedding-artwork
header:
  caption: Kirsty and Kelly's wedding
  image: wedding_header.jpg
---

Over the Australian summer, I flew home from Baltimore to attend the wedding of 
two of my dearest friends, Kirsty and Kelly. I had the added excitement of 
helping officiate their ceremony and could not have been more thrilled. There's 
was to be the first legal same-sex marriage in Tasmania, the southernmost state 
of Australia. Needless to say, it was a bloody incredible day, as recorded in 
several media articles, including 
[The Advocate](http://www.theadvocate.com.au/story/5153850/the-historic-wedding-of-kelly-and-kirsty/), 
[PEDESTRIAN.TV](https://www.pedestrian.tv/dating/kirsty-and-kelly-albion/), 
and [The Mercury (paywalled)](https://www.themercury.com.au/lifestyle/kelly-mackenzie-and-kirsty-albion-say-wedding-in-tasmania-best-day-of-our-lives/news-story/baea7c3453679d478034bb151aaed78f).

{{< figure src="https://images.pixieset.com/05992701/bfe33d946d5eb9657bbe2e8885252a61-xlarge.jpg" title="Brides" link="https://images.pixieset.com/05992701/bfe33d946d5eb9657bbe2e8885252a61-xlarge.jpg" attr="Fern and Stone Photography" attrlink="https://fernandstonephotography.com/" alt="The brides">}}

But what gift do you get a couple to celebrate such a beautiful and historic 
occasion? I wanted to give them something personal and decided to create an 
artwork to celebrate their marriage. Unfortunately, I'm not much chop when it 
comes to pencil and paper or paint and canvas. But I do know R, so I created 
some wedding aRtwoRk!

I used a technique called _sentence drawing_ to create a visualisation of 
Kirsty and Kelly's entire wedding ceremony. Sentence drawings were pioneered by 
[Stefanie Posavec](https://www.stefanieposavec.com/writing-without-words/), but 
I was inspired by 
[this great article](https://htmlpreview.github.io/?https://github.com/halhen/viz-pub/blob/master/sentence-drawings/code.nb.html) 
by [Henrik Lindberg (@helhen)](https://github.com/halhen). Thanks, Henrik!

Using this technique, each sentence from the ceremony is visualised as a line, where the length of the 
line is determined by the number of words and the colour of the line is based 
on sentiment analysis. These lines are then connected end-to-end following the 
order of the ceremony. 

The final piece included nine variations of this sentence drawing; all that 
changes between each panel is the angle between adjacent lines. With this, 
I was trying to capture how in life we can end up with very different results depending on where and how we choose to make a change.

{{< figure src="/img/ceremony_sentence_plot_small.png" title="Wedding aRtwoRk" link="/img/ceremony_sentence_plot.png" caption="Nine sentence drawings of Kirsty and Kelly's wedding ceremony">}}

I'm really happy with how it turned out. More importantly, so are Kirsty and 
Kelly!

{{< figure src="https://images.pixieset.com/05992701/fa50381064e80c8279d90944c3d8b659-xlarge.jpg" title="Very happy and proud friends" link="https://images.pixieset.com/05992701/fa50381064e80c8279d90944c3d8b659-xlarge.jpg" attr="Fern and Stone Photography" attrlink="https://fernandstonephotography.com/" alt="Grangey">}}
