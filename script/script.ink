#----Audience actions are prefixed by @.
#----Caller actions are prefixed by /.

VAR agenda = "the third person"
VAR responseset = "Oh"
VAR tagset = "does that make sense?"

->Start


===Start
+[A: Confirm that you can see and hear one another] ->Confirmation
+A: I'm {|still} not done getting ready.
		->Fixappearance

===Confirmation
A: Hi, sorry I've had all kinds of technical issues lately.

A: Can you hear me? Can you see me?

A: So there might be a bit of lag. Or a lot of lag.

A: {If only the people at head office, in their infinite wisdom, could send us some decent work-from-home gear.|If only I'd been a theatre kid at school, maybe I would have learned a thing or two about how to set up the lighting here.|If only I'd gotten into videogame streaming before we moved to working from home, I might have learned how to use all this technology.|If only I'd moved to that Eastern European country with the amazingly fast internet.|If only all of this had happened just a little later, we might be using VR right now, teleconferencing in the actual matrix.|If only we were doing this the traditional way, in a fluorescent-lit corporate sky dungeon with patriarchal air conditioning settings.}

A: Am I right?

+B: Yes I can see and hear you
    ->Greetings.Options
+B: Haha, I know the feeling.
    ->Greetings.Options
+[B: Gesture silently] ->Greetings.Gesture

===Greetings
=Options
B: All seems to be working fine

B: Perhaps a little slow. But...

B: {I can hear and see you, and also I hear you on that head office thing.|I actually was a theatre kid, but I wasn't a lighting person. Lighting wrangler? Lampy clamper?|I would never stream a videogame. Who wants to see me fail over and over again at something? Sounds humiliating.|They may limit our bandwidth, but they will never limit our imaginations!|I certainly don't think my machine could handle VR right now.|But we must be grateful for the miracle of technology that connects us and binds us, like spider silk encompassing the whole world.}

*[A: Hide] ->Coverface
+A: How are you?
    ->Reciprocation
+A: How's it hanging?
    ->Reciprocation
+A: Good morning
    ->Reciprocation

=Reciprocation
B: Um...

B: Well...

B: You know...

+B: /Repeat what they just said
    ->Reciprocation
+B: I'm fine thank you, how are you?
    {->Reciprocation | ->StartConclusion}
*B: /Say nothing more, hum agreeably
    ->StartConclusion

=Gesture
B: /No need to actually use your voice just yet, right?

B: /You might have a long meeting ahead of you, got to conserve energy.

B: /Why use words to say what you can express with gestures?

B: /They say that actions speak louder than words after all.

B: /Though everyone who ever said that was speaking at the time... how ironic...

*B: /Smile and wave while still on mute
    ->Confirmation
*B: /Thumbs up
    ->Greetings

=Coverface
A: /Oh no, they can see and hear you!

A: /Suddenly this feels rather alarming.

A: /You weren't cut out for this... being seen and heard by people who aren't even really here...

A: /Surely there's some way you can avoid this?

*A: /Hide under the desk
    ->Greetings
*A: /Cover your face with your hands
    ->Greetings
*A: /Cover your face with a nearby object
    ->Greetings


===Fixappearance
A: {I didn't realise I looked like this until the camera came on|Maybe there's still time to sort a few things out first?|I just need to do a couple more things|It's been a rough day, sorry}

B: {~That's okay|You're fine|I get it|Sure|Alright|Yeah why not}

*A: /Move the camera around a bit
    ->Start
*A: /Blow your nose
    ->Start
*A: /Fiddle with your hair in the camera view
    ->Start
*A: /Inspect your teeth in the camera view
    ->Start
* ->Fixappearance.exit

=exit
A: You know what, I think this is the best I can offer, face-wise.
    ->StartConclusion

===StartConclusion
A: Is it just us? Or are we waiting for someone else?

B: Yeah I'm expecting one more person to join us on this call. They said "yes" on the calendar invite anyway.

A: Okay well, let's just wait a while, I'm sure they're not far away...

*[B: Make small talk]->Smalltalk
*[B: Make big talk]->Bigtalk

#------END OF PART 1------------

===Smalltalk
B: So yeah, um...

B: While we're here, we might as well just hang out...

B: And talk in a casual fashion, like people normally do.

*B: I've been loving your work lately
    ~ agenda = "how much I admire you"
    A: {...{responseset}? ->Expand.B | ...{responseset}. ->Expand.B | ...{responseset}! ->Expand.A | ...{responseset},  {responseset}, {responseset}!!! ->Expand.A}
*B: I've been working on a new project recently
    ~ agenda = "a cool project"
    A: {...{responseset}? ->Expand.B | ...{responseset}. ->Expand.B | ...{responseset}! ->Expand.A | ...{responseset},  {responseset}, {responseset}!!! ->Expand.A}
*B:  We've sure been having some weather
    ~ agenda = "the current weather"
    A: {...{responseset}? ->Expand.B | ...{responseset}. ->Expand.B | ...{responseset}! ->Expand.A | ...{responseset},  {responseset}, {responseset}!!! ->Expand.A}
*B: [Talk about some random frivolous thing]
	~ agenda = "{~ the kind of music that our parents enjoy listening to | the football | dogs | gardening | staycationing | home renovation | craft beer | cryptocurrency | coffee | organic produce}"
	B: Hey so, {what do you think about...|I've been thinking about|have we ever talked about|have you seen any good takes on|this weekend I had a remarkable experience with} um... {agenda}
    A: {...{responseset}? ->Expand.B | ...{responseset}. ->Expand.B | ...{responseset}! ->Expand.A | ...{responseset},  {responseset}, {responseset}!!! ->Expand.A}



===Expand
=A
~ responseset = "{~Hmm|OK|Well|Sure|Cool|Lovely|Oh|That's nice}"

A: {~I've actually been so surprised by {agenda} | Yeah I've been doing a lot of thinking about {agenda}! | Ah, thinking about {agenda} frequently keeps me up at night | Oh there's nothing that brings me more joy than {agenda} | I can't even imagine what my life would be were it not for {agenda}}

A: {~I have so much to say on this | I could definitely share some thoughts about this | It's nothing I can claim expertise on, but... | I'm so glad you asked me about this.}

A: {~Let me just search my brain... | It's right on the tip of my tongue... | How shall I put this... | Just to give one example... | I would love to hear your thoughts too, but for me...}

*A: {Expand > 4} [Suggest giving up on the meeting] ->Ending.Giveup
+[A: Describe {agenda} in 10 words or less] ->tenwordchallenge.A
+[A: Talk at length about {agenda}] ->showerchallenge.A
+[A: Change the topic to some other random frivolous thing]
	~ agenda = "{~ the kind of music that our parents enjoy listening to | the football | dogs | gardening | staycationing | home renovation | craft beer | cryptocurrency | coffee | organic produce}"
	A: Actually, {what do you think about...|I've been thinking about|have we ever talked about|have you seen any good takes on|this weekend I had a remarkable experience with} um... {agenda}
	->Expand.B

=B
~ responseset = "{~Hmm|OK|Well|Sure|Cool|Lovely|Oh|That's nice}"

B: {~Yeah I've been doing a lot of thinking about {agenda}! | Thinking about {agenda} frequently keeps me up at night | Oh there's nothing I like more than {agenda} | I mean, who hasn't spent many an evening trawling the wikis for information on, er, you know, {agenda} | I can't even imagine what my life would be without {agenda}}

B: {~I have so much to say on this | I could definitely share some thoughts about this | It's nothing I can claim expertise on, but... | I'm so glad you asked me about this.}

B: {~Let me just search my brain... | It's right on the tip of my tongue... | How shall I put this... | Just to give one example... | I would love to hear your thoughts too, but for me...}

*B: {Expand > 4} [Pretend to have technical issues so that this situation will end] ->Ending.Static
+[B: Describe {agenda} in 10 words or less] ->tenwordchallenge.B
+[B: Talk at length about {agenda}] ->showerchallenge.B
+[B: Change the topic to some other random frivolous thing]
	~ agenda = "{~ the kind of music that our parents enjoy listening to | the football | dogs | gardening | staycationing | home renovation | craft beer | cryptocurrency | coffee | organic produce}"
	B: Now that I think of it, {what do you think about...|I've been thinking about|have we ever talked about|have you seen any good takes on|this weekend I had a remarkable experience with} um... {agenda}
	->Expand.A

===tenwordchallenge
=A
A: @Write a description of "{agenda}" in the comments, using ten words or less

A: Okay um, let's see... Let me try to put it succinctly...

A: You know, I could go on and on about this, but I don't want to bore you.

A: You know what I mean?

A: It's so difficult to put it into words, but also I feel like one could write a book about just this topic alone.

A: I have so many thoughts about it, but if I had to say just one thing, then it would be...

A: /Perform an audience response from the comments. Choose quickly!

+B: ...{responseset}?
->Expand.A
+B: ...{responseset}.
->Expand.A
+B: ...{responseset}!
->Expand.B
+B: ...{responseset},  {responseset}, {responseset}!!!
->Expand.B

=B
B: @Write a description of "{agenda}" in the comments, using ten words or less

B: Okay um, let's see... Let me try to put it succinctly...

B: You know, I could go on and on about this, but I don't want to bore you.

B: You know what I mean?

B: It's so difficult to put it into words, but also I feel like one could write a book about just this topic alone.

B: I have so many thoughts about it, but if I had to say just one thing, then it would be...

B: /Perform an audience response from the comments. Choose quickly!

{agenda == "how much I admire you":

	A: Well thanks, that's very kind of you to say.
	+ [A: Say something politely self-effacing]
	    ~ agenda = "self-esteem"
	    ->adjectivechallenge.selfeffacing
	+ [A: Agree with their praise]
	   ~ agenda = "being a bad-ass motherfucker"
	   ->adjectivechallenge.arrogance
}

+A: ...{responseset}?
->Expand.B
+A: ...{responseset}.
->Expand.B
+A: ...{responseset}!
->Expand.A
+A: ...{responseset},  {responseset}, {responseset}!!!
->Expand.A

===showerchallenge
=A
A: @Write every thought you have about "{agenda}" in the comments

A: Well, to give you my brutally honest opinion

A: Completely unfiltered, you understand

A: I really think ...

A: /Perform every audience response from the comments, in order, as an unfiltered stream of consciousness.

+B: ...{responseset}?
->Expand.A
+B: ...{responseset}.
->Expand.A
+B: ...{responseset}!
->Expand.B
+B: ...{responseset},  {responseset}, {responseset}!!!
->Expand.B

=B
B: @Write every thought you have about "{agenda}" in the comments

B: Well, to give you my brutally honest opinion

B: Completely unfiltered, you understand

B: I really think ...

B: /Perform every audience response from the comments, in order, as an unfiltered stream of consciousness.

+A: ...{responseset}?
->Expand.B
+A: ...{responseset}.
->Expand.B
+A: ...{responseset}!
->Expand.A
+A: ...{responseset},  {responseset}, {responseset}!!!
->Expand.A

===adjectivechallenge
B: @Write some very fancy-sounding adjectives in the comments

B: I don't want to sound pretentious

B: But if I had to describe it, I'd have to say

B: For want of a better word, it's...

B: /Choose three adjectives from the comments that will make you sound very impressive

A: Well thanks, that's very kind of you to say.
+ [A: Say something politely self-effacing]
    ~ agenda = "self-esteem"
    ->selfeffacing
+ [A: Agree with their praise]
    ~ agenda = "being a bad-ass motherfucker"
    ->arrogance

=selfeffacing
A: But actually, I don't know if all that is true.

A: I feel a bit uncomfortable hearing that kind of thing.

A: Do you really mean that?

+ A: I don't think what I'm doing is all that impressive[.], but it's nice that someone thinks about it like that.
    ->Expand.B
+ A: I think you're mistaken[.], everything I'm doing is utter shit really, I can't imagine why you like it.
    ->Expand.B
+ A: I've just been feeling like a gross little pajama gremlin[.] for months now, it's strange to hear someone talk about me like that. Like, I just spend most of my time watching youtube videos, scratching my bum, and eating frozen vegan schitzels in the shape of various dinosaurs.
    ~ agenda = "frozen dinosaur-shaped foods"
    ->Expand.B

=arrogance
A: It's so good to hear that, especially coming from someone like you.

A: I'm sure you know how it is, in our line of work, so often your contributions go unacknowledged.

A: I really feel like this is something much bigger than most people realise.

+ A: I've been working my ass off for years[.], and I'm proud to have gotten where I am.
    ->Expand.A
+ A: Not many people have the intellectual capacity to appreciate the kind of work I do[.], you must have very refined taste.
    ->Expand.A
+ A: I actually feel like it isn't me, it flows through me[.], like it all just comes from the universe and I am the conduit, like a 5G tower, I'm just bouncing different bits of consciousness around our culture, and not everybody understands things that are innovative like this, some people are afraid of it, but that's none of my business, I'm just a vessel for this energy.
    ->Expand.A

#-------End of Part 2A-----------------------------

===Bigtalk

A: So, {how have you been?|how's it going?|what have you been up to?|what's it been like where you are?}


*[B: Share some feelings]
->emotions
*[B: Share some insightful analysis]
->intellectualism
*[B: Share some creative musings]
->surrealism

===emotions
B: Actually, it's funny you should ask that.

B: The truth is, things have been pretty difficult lately, with everything that's been going on.

B: I guess everybody is saying that these days. I dunno.

B: I guess I've been feeling kind of... um...

*B: lonely
~ agenda = "loneliness"
->emotionchallenge
*B: hopeless
~ agenda = "hopelessness"
->emotionchallenge
*B: stressed
~ agenda = "stress"
->emotionchallenge
*B: frustrated
~ agenda = "frustration"
->emotionchallenge
*B: insecure
~ agenda = "insecurity"
->emotionchallenge
*B: dissociated
~ agenda = "dissociation"
->emotionchallenge
*B: scared
~ agenda = "fear"
->emotionchallenge
*B: angry at the world
~ agenda = "anger at the world"
->emotionchallenge
*B: numb
~ agenda = "numbness"
->emotionchallenge

=emotionchallenge
~ tagset = "{~you know what I mean?|sorry was that a bit of an overshare?|and I just don't know what to do about all of this.|and I don't see how it's going to get better.|and I know this is temporary, but that's where I'm at right now.}"

A: Oh, I'm sorry to hear that.

A: Do you want to talk about it?

B: Yeah I guess, um, it's just that...

B: @Write every thought you have about {agenda} in the comments
B: /Perform every audience response from the comments, in order, as an unfiltered stream of consciousness.

B: ... {tagset}

+[A: Share a relatable anecdote]
->anecdote
+[A: Show that you are listening]
->activelistening

=anecdote
A: I know exactly what you mean.

A: It's so interesting that you brought this up, actually. It's been coming up a lot lately I think.

A: Like for example, I think I've been experiencing something similar...

{agenda == "loneliness": A: Before all of this happened, I was telling a friend that I was fed up of people's drama, and just want everyone to FUCK OFF. I guess I got what I wanted. But I kind of miss people bothering me. I mean, I identify as solo polyamorous I guess, maybe relationship anarchist, I never wanted to build my life around a relationship, but I must admit I'm kind of jealous of all those people who have someone around all the time. Of course, the REAL answer is setting up a tiny house commune, so that I can sit in my little trailer and see all the lovely people coming and going but not have to actually interact with anyone.}

{agenda == "hopelessness": A: I spend hours and hours doomscrolling through social media every day. I know I shouldn't do this to myself, but there's some fresh hell almost every week that I must keep myself informed about. Pandemic, wildfires, floods, crypocurrencies, Jerusalem, TERFs, conversion therapy, the constant discovery of new sex crimes done by powerful men, the constant harassment of women and non-binary people who go public with this stuff, then there was that whole bean dad thing... I get so irritated by people who can stay optimistic right now. It's like, if you don't think the whole world is ending, are you even paying attention?}

{agenda == "stress": A: I wake up and immediately it's like, in my head, I'm screaming. All these thoughts of the things that I have to do, the things that I have to deal with, the things that I don't know about, they all come rushing in and within a few moments I already feel tired. Like, I want a nap again as soon as I've had my coffee. Why am I even trying to do anything? I wish I could just quit my entire life and reset it all to zero.}

{agenda == "frustration": A: Everything is so fucking frustrating right now. I feel like I can't rely on anyone to just fucking do the things that they say they are going to do. And I get it, I feel overwhelmed and I can't get to everything, but also, for that reason, I don't have the energy to chase people all the time and figure out what they're actually up for doing. And then everything is broken, everyone is off work because they're either sick or on leave, nothing arrives in good time, it's like the whole world has just stopped functioning. I just want ONE PERSON to answer ONE EMAIL in a reasonable time frame!}

{agenda == "insecurity": A: Like, I guess I didn't know that I needed so much validation from others? It's like I disappear if nobody is there to perceive me. Or like, if nobody has recently treated me like I matter, I sink further and further toward feeling like I really don't matter at all, and nothing I do is right. I realised the other day that my mind basically contains a massive encyclopedia of all the specific things that I have decided that particular people hate about me, even though we haven't spoken in years and I actually have no idea what they think of me.}

{agenda == "dissociation": A: I remember, the last time I was in a busy train station, I was already super overwhelmed, and then somebody walked past wearing Manx™ body spray and I just completely evacuated my body. I had to teleoperate myself from about ten feet up in the rafters of the train station, just to get myself to a Nando's and wait for the whole thing to pass. But I also had a train to catch, so I was like, okay, I better get this body in front of a big clock, because time has no meaning right now.}

{agenda == "fear": A: I'm so scared every time I leave the house right now. Like, I never really enjoyed people coming up into my personal space, or being in noisy or crowded spaces, and I always had to be careful about what parts of my identity I make visible to people, but now it's just so much more worrying. Like, I have to remember so many things now to stay safe. Do I have my mask? My cycle helmet? Am I dressed in a way that will make other people question whether I'm using the correct bathroom?}

{agenda == "anger at the world": A: It just absolutely blows my mind that almost everything that is happening right now, people made it this way. A lot of the time, we even knew that it was probably going to end up like this! We know full well that so much about how we've organised society is leading to apocalyptic levels of awful, and NOBODY is DOING ANYTHING!? Okay I guess that's not fair, there are people trying to do something but like, it seems like so much of it is just waving your arms about and yelling, trying to be heard by people in power who don't give a shit! The world is just becoming more and more hostile and dangerous, and it's unbearable. Sometimes I think, I just want it all to burn down. Then I remember that it probably will... so, yay for that I guess?}

{agenda == "numbness": A: Some of the time I just feel cold inside, like a rock. People as me how I'm doing and I'm like, I don't know? I'm ... okay? I'm alive, apparently? I sit there, and realise that my face feels like literally nothing, just this expressionless gray sludge dripping off my skull.}


+B: Thanks for sharing that[.], I feel a lot less alone. I just haven't really known what to do with all this {agenda}.
->Ending.Thirdperson
+B: Hmm, this isn't quite like that[.]... I don't know, maybe you've just never experienced {agenda} to quite the extent that I have.
->Ending.Thirdperson
+B: Way to make this all about you!
->Ending.Leaveinahuff

=activelistening
A: /Nod sympathetically
+A: That sounds really hard
->doyoufeelheard

+A: I hear you
->doyoufeelheard

+A: Gosh, that's a lot
->doyoufeelheard

=doyoufeelheard
A: I'm so sorry that you're going through that.

A: Is there anything I can do to help?

*B: Sorry for going on and on like that[.], I just feel so trapped right now, stuck with this {agenda}.
->Ending.Thirdperson

*B: Thank you for listening, I really feel heard.
->heardresponse

*B: {Ending.Honesty>0} Are you just saying that because you learned somewhere that it was the right thing to say when someone is sad?
B: Yeah, okay. You're right.
->Ending.Honesty

=heardresponse
B: You're such a good listener, you know?

B: Not everybody will let me just offload like that.

B: It really does make everything better.

+A: I'm glad you feel heard
->Ending.Thirdperson
+A: But I didn't do anything[?], I just said the thing that you're supposed to say when someone is sad.
B: I know what you mean...
->Ending.Honesty

===intellectualism
~ responseset = "{~Hmm|OK|Well|Sure|Cool|Lovely|Oh|That's nice}"

B: I've been doing okay, thanks, all things considered.

B: In some ways, it's nice to be alone with my thoughts.

B: I was just rereading a favourite essay of mine.

A: {responseset}?

B: Yeah there's this bit where they say...

*B: "There's a saying that anything that could be destroyed by the truth should be destroyed.
~ agenda = "refusal"
->Autostraddle
*B: When we use an internet platform like this, we're contributing to actually building the thing
~ agenda = "imagining a different kind of society"
->Pipkin
*B: ... Actually, would you happen to have a rock or a stone to hand?
~ agenda = "materiality"
->Ingold

=Autostraddle
B: Which also suggests that anything that could be destroyed by your declining to break your back over it should be destroyed.

B: There is so much held together at the seams only by the worst kind of work..."

B: It's called "Toward an Applicable Theory of Just Not"

+A: Like Bullshit Jobs?->returndialogue
+A: Like marriage? ->inappropriate
+A: Like this conversation?
B: Um, okay.
B: I'm sorry... I don't really know what I did wrong there?
A: Well, you're making me work very hard to keep up with you.
A: Like maybe you're just flexing to show off the reading you've been doing?
->Ending.Honesty


=Pipkin
B: We're building these huge structures together, and then selling them back to ourselves.
B: Our private data has been monetised, our web traffic has been monetised, our content has been monetised, our attetion has been monetised, our so-called unusued wealth, such as it is...
B: These structures have power precisely because the world is inextricably tied to internet structures.
B: So now everything touches everything else, and we are both the producer and the consumer.
B: Inextricably linked to each other.
B: It's called "The slime mold is as good an economic model as any"

+A: So it's like an anarchist utopia?->returndialogue
+A: Wait, slime mold?
B: Yeah like, instead of bosses, we could have more self-organising kinds of structures.
->Ending.Thirdperson

=Ingold
A: A what?
B: A rock or a stone. The essay starts with you soaking a rock or a stone in water.
A: Why?
B: Well, it's hard to explain. But it's about how we perceive what makes a stone feel particularly... stony.
B: And like, instead of just saying "oh this sculpture really brings out the stoniness of the material" he asks how you can actually perceive that stoniness. Like, is there any way of making something out of stone that doesn't have a stony quality to it? What would that even mean?
B: It's by this guy Tim Ingold. I don't know if I really understand it properly yet.
B: But I think about it a lot when it comes to the internet. Like, what makes a digital thing feel more or less digital or computery?
B: At one point he says, "The surface of materiality, in short, is an illusion. We cannot touch it because it is not there."

+A: So it's like the matrix? Nothing is real? ->returndialogue
+A: You know what else is not there? My interest in this conversation.
B: Um, okay.
B: I'm sorry... I don't really know what I did wrong there?
A: Well, you're making me work very hard to keep up with you.
A: Like maybe you're just flexing to show off the reading you've been doing?
->Ending.Honesty

=returndialogue
B: Yeah it is related to that a bit I think.
B: The essay is about a lot of things.
B: It's hard to describe it succinctly, but I guess the main theme that stands out to me is {agenda}
A: {responseset}...

+A: Can we talk about something a bit less {~heady|intense|confusing|difficult|intellectual|pretentious}?
B: Oh, sure...
->Smalltalk
+A: [Expound on {agenda}]
->pretentiousshower
+A: Are you okay right now? What's this all really about? ->emotions

=inappropriate
B: Hmm.
B: I wouldn't know.
B: Is your marriage like that?
+A: Okay that was not appropriate...
A: I think I'm done with this.
A: Bye.
->Ending.Leaveinahuff
+A: We should just go with the flow.
A: People spend too much time thinking about what they should be doing differently.
A: Why not just feel into the flow of life, be more intuitive?
->Ending.Honesty

=pretentiousshower
A: @Write about "{agenda}" in the comments

A: Ah yes, I see what you mean

A: I've been thinking a great deal about {agenda} lately.

A: So much ink has been spilled on this topic of course. I could talk about it ad infinitum! Or ad nauseum you could say.

A: Wasn't it {~Aristotle|Plato|Foucault|Judith Butler|the Marquis de Sade|Thomas Aquinas|Lord Byron|Sara Ahmed|Karen Barad|Simone Weil|Emily Dickinson}

A: /Perform every audience response from the comments, in order, as an unfiltered stream of consciousness.

->Ending.Thirdperson

===surrealism
B: So, you know how there are all these stories about people who go to parallel universes or whatever?

B: And of all the different timelines or possible universes, this is the one we ended up in?

B: Do you ever think about how much of what we've accepted as just the way of the world is actually pretty much socially constructed...

B: Which means that it is something that we make the way it is by all deciding to act as though it is that way...

B: Like, we could in theory all decide tomorrow to role-play a completely different society, and it would basically be the same as going to a parallel universe where completely different things are true.

+A: [Why did we have to end up in the one with jobs?] ->jobs
+A: [Why did we have to end up in the one with gender]? ->gender
+A: [Could we enact an octopus supremacy instead?] ->octopus

=jobs
A: Yeah like, of all the societies for us to collectively construct together, why did we have to end up in the one with jobs?

A: Of all the ways that we could get things done, we chose the one that involves spending the majority of our waking hours doing boring shit that makes other people wealthy?

A: How has this kept on going for so long? You'd think we'd all just collectively quit by now.

+B: Because we have to make sure that unpleasant things get done.
B: If people just did things that they wanted to do, nobody would clean the sewers or work in meat processing.
A: Maybe that's a good thing! We don't even recognise the harm we cause by constructing a society with a meat processing industry.
B: Sure, maybe, but we still need sewers, right?
->strange

+B: Because most people can't survive without work.
B: We can't all just quit, because almost all of us need to pay rent. There's only so long a general strike can go on for, and when we're all exhausted, the state is still there.
B: What we need is to reorganise work itself and seize the means of production. We can't just not work, but we can work for each other instead of for billionaires.
A: I'm all for it! What do we do first?
B: Maybe start a workers cooperative? A company that we jointly own and run for ourselves.
->revolution

=gender
A: Yeah like, of all the societies for us to collectively construct together, why did we have to end up in the one with gender?

B: What?

A: Gender! It takes up so much time and energy, and it's mostly made up of totally arbitrary tasks that nobody should have to do.

A: It takes so much work to keep making gender a thing. What if we just didn't do that work anymore? We could just stop.

+B: I quite like my gender, I'm not sure I'd want to make a society without it.
B: I agree that nobody should have to "do gender", and certainly nobody should be obliged to perform a gender that isn't right for them.
B: But I think gender can be very beautiful! "The poetry we write with the language we have been taught". I want to be able to have fun with it.
->strange
+B: How do you stop gendering?
B: I don't think you can easily identify that some things that people do are gender, and others are not.
B: Like, is makeup gender? Or is it fundamentally just a fun thing that you get to do with your face?
B: Just deciding that we're not going to do gender anymore would probably result in making femininity even more stigmatised than it already is.
->strange

=octopus
A: I want to see the parallel universe where the octopus is the dominant species.

A: I mean, they're clearly smart enough. They could do it! They just choose not to make a civilisation, because they're too smart to make that same mistake that we did.

A: But that's the one thing that you can't change just by doing things differently. How do we change things that have nothing to do with humans?

A: Even if we did get to choose what humans in general do, we still wouldn't get to socially construct an octopus supremacy against their will.

+B: Not with that attitude we wouldn't!
B: Have we ever tried to actually give another species more power than us?
B: We have thousands of years of domesticating animals. We're good at changing them into beings we have power over.
B: What if we were to try something else? What if we were to domesticate ourselves, and designate some other species our keeper?
->strange

+B: Maybe a human-octopus alliance is possible?
B: Even if we can't make the octopus into the dominant species, perhaps we could try working with them?
B: Maybe we could start redesigning our society around what we think the octopus might want.
B: We could even develop ways of practising co-design with the octopus, gradually giving them more power in our own society.
->strange

+B: [I think the cuttlefish might have something to say about all this.]
B: Yeah I'm also a bit worried about what impact we would have by just choosing octopus as the species that gets to carry the torch of species dominance.
B: Why do we get to decide? Just because we like these particular tentacle boys.
B: I imagine if the cuttlefish were made aware of this they might be like, "hang on, why them and not us?"
->strange

=strange
A: This is a really strange conversation.

A: How did we get onto this topic?

B: I'm sorry, I didn't mean to make things awkward

A: No, not at all, you didn't...

B: No it's okay, I know I did.

A: It's just not the kind of conversation I would have with everyone.

->Ending.Honesty

=revolution
A: When should we start?
B: Right now! It looks like it's basically just us now anyway... why not just start our own company right now?
->Ending.Thirdperson


===Ending
=Leaveinahuff
A: /Abruptly walk away in a huff, until you are out of view of the camera
->END

=Giveup
A: Well, um, it doesn't seem like the other person is going to show up. Maybe we should rearrange for another time? I hope they're okay.

B: Yeah, sure. I'll er, see you on the emails.

A: Yeah see you around.

->END

=Static
B: /Make static noises while sitting very still, so that it looks like the call has dropped and the video is frozen

A: Are you there?

B: /Continue to stay perfectly still

A: I think the call has dropped

B: /Hmm, can you read these instructions without moving your eyes?

A: I can see you moving, what's going on?

B: Sorry, I think I'm having some technical issues

A: Okay...

B: I'll have to go, my computer is breaking

A: Oh no, I'm sorry to hear that

B: I think I smell burning plastic

A: That does sound like it might be an issue

B: It was lovely talking to you, let's do this again some time.
->END

=Thirdperson
#-----The third person suddenly pops into the call. I don't know what happens then.
->END

=Honesty
B: The truth is, I feel awkward all of the time.

B: I guess a lot of people can just be themselves and go with the flow[...], but I've never done that. I'm constantly monitoring myself, and imagining how I could have done things differently...

B: I manage all my social interactions by just following scripts and procedures[...] that I think represent the "right thing to do" - the thing that will stop me from messing everything up. I constantly ruminate on situations like this, because part of me thinks eventually I'll discipline myself into writing the perfect script. If I just go over it one more time, maybe I'll know what I should have done right...

{Honesty <1}->Start
{Honesty>1} B: If I don't do this...

B: If I let go, and just say the first thing that comes to mind, I end up sounding strange, or going on and on for ages as I just empty out every thought in my head.

B: I can say the thing that I know you're supposed to say, and risk seeming insincere, or I can say the thing that comes to mind for me, and risk seeming arrogant or just not being understood.

->END
