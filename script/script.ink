#----Audience actions are prefixed by @.
#----Caller actions are prefixed by /.

VAR agenda = "the third person"
VAR responseset = "Oh"
VAR tagset = "does that make sense?"

#Toggle
->Start

===Start
+[Confirm that you can see and hear one another]->Confirmation
+I'm not done getting ready{.|.| either.| either.} ->Fixappearance

===Confirmation
Hi, can you hear me? Can you see me?
#Toggle
->Confirmation.responses

=responses
+ Yes I can see and hear you #Toggle
    ->Greetings.Options
+ [Gesture silently] ->Greetings.Gesture

===Greetings
=Options
*[Hide]->Coverface
+How are you? #Toggle
    ->Reciprocation
+How's it hanging? #Toggle
    ->Reciprocation
+Good morning #Toggle
    ->Reciprocation

=Reciprocation
+/Repeat what they just said #Toggle
    ->Reciprocation
+I'm fine thank you, how are you? #Toggle
    {->Reciprocation | ->StartConclusion}
*Say nothing, hum agreeably #Toggle
    ->StartConclusion

=Gesture
*Smile and wave while still on mute #Toggle
    ->Confirmation
*Thumbs up #Toggle
    ->Greetings

=Coverface
Oh no, they can see and hear you!
*/Hide under the desk #Toggle
    ->Greetings
*/Cover your face with your hands #Toggle
    ->Greetings
*/Cover your face with a nearby object #Toggle
    ->Greetings


===Fixappearance
*/Move the camera around a bit #Toggle
    ->Start
*/Blow your nose #Toggle
    ->Start
*/Fiddle with your hair in the camera view #Toggle
    ->Start
*/Inspect your teeth in the camera view #Toggle
    ->Start
* ->Fixappearance.exit

=exit
But this is the best I can offer, face-wise. #Toggle 
    ->Greetings

===StartConclusion
#Toggle
Is it just us? Or are we waiting for someone else?

#Toggle
Yeah I'm expecting one more person to join us on this call. They said "yes" on the calendar invite anyway.

#Toggle
Okay well, let's just wait a while, I'm sure they're not far away...
*[Make small talk]->Smalltalk
*[Make big talk]->Bigtalk

#------END OF PART 1------------

===Smalltalk
* I've been loving your work lately
    ~ agenda = "somebody you admire"
    #Toggle
    ->response
* I've been working on a new project recently
    ~ agenda = "a cool project"
    #Toggle
    ->response
* We've sure been having some weather
    ~ agenda = "the current weather"
    #Toggle
    ->response
* [Talk about some random frivolous thing]
    ->Frivoloustopics

=response
+ ...{responseset}? #Toggle
->Expand
+ ...{responseset}. #Toggle
->Expand
+ ...{responseset}!
->Expand
+ ...{responseset},  {responseset}, {responseset}!!!
->Expand

=Frivoloustopics
~ agenda = "{~ the kind of music that our parents enjoy listening to | the football | dogs | gardening | staycationing | home renovation | craft beer | cryptocurrency | coffee | organic produce}"
Hey so, {what do you think about...|I've been thinking about|have we ever talked about|have you seen any good takes on|this weekend I had a remarkable experience with} um... {agenda}
#Toggle
->response

=Expand
~ responseset = "{~Hmm|OK|Well|Sure|Cool|Lovely|Oh|That's nice}"
* {response > 4} [Suggest giving up on the meeting] ->Ending.Giveup
* {response > 6} [Pretend to have technical issues so that this situation will end] ->Ending.Static
+ [Describe {agenda} in 10 words or less] ->tenwordchallenge
+ [Talk at length about {agenda}] ->showerchallenge
+ [Change the topic to some other random frivolous thing] ->Frivoloustopics

=flattered
Well thanks, that's very kind of you to say.
* I have been very impressed with your work lately as well, actually. It's very... what's the word... ->adjectivechallenge
+ [Say something politely self-effacing]
    ~ agenda = "self-esteem"
    ->selfeffacing
+ [Agree with their praise]
    ~ agenda = "being a bad-ass motherfucker"
    ->arrogance

=selfeffacing
+ I don't think what I'm doing is all that impressive[.], but it's nice that someone thinks about it like that. 
    #Toggle
    ->response
+ I think you're mistaken[.], everything I'm doing is utter shit really, I can't imagine why you like it. 
    #Toggle
    ->response
+ I've just been feeling like a gross little pajama gremlin[.] for months now, it's strange to hear someone talk about me like that. Like, I just spend most of my time watching youtube videos, scratching my bum, and eating frozen vegan schitzels in the shape of various dinosaurs.
    ~ agenda = "frozen dinosaur-shaped foods"
    #Toggle
    ->response

=arrogance
+ I've been working my ass off for years[.], and I'm proud to have gotten where I am.
    ->response
+ Not many people have the intellectual capacity to appreciate the kind of work I do[.], you must have very refined taste.
    ->response
+ I actually feel like it isn't me, it flows through me[.], like it all just comes from the universe and I am the conduit, like a 5G tower, I'm just bouncing different bits of consciousness around our culture, and not everybody understands things that are innovative like this, some people are afraid of it, but that's none of my business, I'm just a vessel for this energy.
    ->response

=tenwordchallenge
@Write a description of {agenda} in the chat, using ten words or less
/Perform an audience response from the chat. Choose quickly!

+[Phew, we did it!]
#Toggle
{agenda == "somebody you admire": ->flattered}
->response

=showerchallenge
@Write every thought you have about {agenda} in the chat
/Perform every audience response from the chat, in order, as an unfiltered stream of consciousness.

+...yeah, that's all I have to say about that
#Toggle
->response

=adjectivechallenge

@Write some very fancy-sounding adjectives in the chat
/Choose three adjectives from the chat that will make you sound very impressive

+...yeah, that's how I'd describe it
#Toggle
->flattered

#-------End of Part 2A-----------------------------

===Bigtalk
#Toggle
So, {how have you been?|how's it going?|what have you been up to?|what's it been like where you are?}


*[Share some feelings] 
#Toggle
->emotions
*[Share some insightful analysis]
#Toggle
->intellectualism
*[Share some creative musings]
#Toggle
->surrealism

=emotions
Actually, I've been feeling kind of...

*lonely
~ agenda = "loneliness"
->emotionchallenge
*hopeless
~ agenda = "hopelessness"
->emotionchallenge
*stressed
~ agenda = "stress"
->emotionchallenge
*frustrated
~ agenda = "frustration"
->emotionchallenge
*insecure
~ agenda = "insecurity"
->emotionchallenge
*dissociated
~ agenda = "dissociation"
->emotionchallenge
*scared
~ agenda = "fear"
->emotionchallenge
*angry at the world
~ agenda = "anger at the world"
->emotionchallenge
*numb
~ agenda = "numbness"
->emotionchallenge

=emotionchallenge
@Write every thought you have about {agenda} in the chat
/Perform every audience response from the chat, in order, as an unfiltered stream of consciousness.

+... {tagset}
#Toggle
->emotionresponse

=emotionresponse
~ tagset = "{~you know what I mean?|sorry was that a bit of an overshare?|and I just don't know what to do about all of this.|and I don't see how it's going to get better.|and I know this is temporary, but that's where I'm at right now.}"

+[Share a relatable anecdote]
->anecdote
+[Show that you are listening]
->activelistening

=anecdote
I've been experiencing something similar...

{agenda == "loneliness": Before all of this happened, I was telling a friend that I was fed up of people's drama, and just want everyone to FUCK OFF. I guess I got what I wanted. But I kind of miss people bothering me. I mean, I identify as solo polyamorous I guess, maybe relationship anarchist, I never wanted to build my life around a relationship, but I must admit I'm kind of jealous of all those people who have someone around all the time. Of course, the REAL answer is setting up a tiny house commune, so that I can sit in my little trailer and see all the lovely people coming and going but not have to actually interact with anyone.}

{agenda == "hopelessness": I spend hours and hours doomscrolling through social media every day. I know I shouldn't do this to myself, but there's some fresh hell almost every week that I must keep myself informed about. Pandemic, wildfires, floods, crypocurrencies, Jerusalem, TERFs, conversion therapy, the constant discovery of new sex crimes done by powerful men, the constant harassment of women and non-binary people who go public with this stuff, then there was that whole bean dad thing... I get so irritated by people who can stay optimistic right now. It's like, if you don't think the whole world is ending, are you even paying attention?}

{agenda == "stress": I wake up and immediately it's like, in my head, I'm screaming. All these thoughts of the things that I have to do, the things that I have to deal with, the things that I don't know about, they all come rushing in and within a few moments I already feel tired. Like, I want a nap again as soon as I've had my coffee. Why am I even trying to do anything? I wish I could just quit my entire life and reset it all to zero.}

{agenda == "frustration": Everything is so fucking frustrating right now. I feel like I can't rely on anyone to just fucking do the things that they say they are going to do. And I get it, I feel overwhelmed and I can't get to everything, but also, for that reason, I don't have the energy to chase people all the time and figure out what they're actually up for doing. And then everything is broken, everyone is off work because they're either sick or on leave, nothing arrives in good time, it's like the whole world has just stopped functioning. I just want ONE PERSON to answer ONE EMAIL in a reasonable time frame!}

{agenda == "insecurity": Like, I guess I didn't know that I needed so much validation from others? It's like I disappear if nobody is there to perceive me. Or like, if nobody has recently treated me like I matter, I sink further and further toward feeling like I really don't matter at all, and nothing I do is right. I realised the other day that my mind basically contains a massive encyclopedia of all the specific things that I have decided that particular people hate about me, even though we haven't spoken in years and I actually have no idea what they think of me.}

{agenda == "dissociation": I remember, the last time I was in a busy train station, I was already super overwhelmed, and then somebody walked past wearing Manx™ body spray and I just completely evacuated my body. I had to teleoperate myself from about ten feet up in the rafters of the train station, just to get myself to a Nando's and wait for the whole thing to pass. But I also had a train to catch, so I was like, okay, I better get this body in front of a big clock, because time has no meaning right now.}

{agenda == "fear": I'm so scared every time I leave the house right now. Like, I never really enjoyed people coming up into my personal space, or being in noisy or crowded spaces, and I always had to be careful about what parts of my identity I make visible to people, but now it's just so much more worrying. Like, I have to remember so many things now to stay safe. Do I have my mask? My cycle helmet? Am I dressed in a way that will make other people question whether I'm using the correct bathroom?}

{agenda == "anger at the world": It just absolutely blows my mind that almost everything that is happening right now, people made it this way. A lot of the time, we even knew that it was probably going to end up like this! We know full well that so much about how we've organised society is leading to apocalyptic levels of awful, and NOBODY is DOING ANYTHING!? Okay I guess that's not fair, there are people trying to do something but like, it seems like so much of it is just waving your arms about and yelling, trying to be heard by people in power who don't give a shit! The world is just becoming more and more hostile and dangerous, and it's unbearable. Sometimes I think, I just want it all to burn down. Then I remember that it probably will... so, yay for that I guess?}

{agenda == "numbness": Some of the time I just feel cold inside, like a rock. People as me how I'm doing and I'm like, I don't know? I'm ... okay? I'm alive, apparently? I sit there, and realise that my face feels like literally nothing, just this expressionless gray sludge dripping off my skull.}

#Toggle
+Thanks for sharing that[.], I feel a lot less alone. I just haven't really known what to do with all this {agenda}.
->Ending.Thirdperson
+Hmm, this isn't quite like that[.]... I don't know, maybe you've just never experienced {agenda} to quite the extent that I have.
->Ending.Thirdperson
+Way to make this all about you!
->Ending.Leaveinahuff

=activelistening
/Nod sympathetically

+That sounds really hard
#Toggle
->doyoufeelheard
+I hear you
#Toggle
->doyoufeelheard
+Gosh, that's a lot
#Toggle
->doyoufeelheard

=doyoufeelheard
*Sorry for going on and on like that[.], I just feel so trapped right now, stuck with this {agenda}.
#Toggle
->Ending.Thirdperson
*Thank you for listening, I really feel heard.
#Toggle
->heardresponse
* {Ending.Honesty>0} Are you just saying that because you learned somewhere that it was the right thing to say when someone is sad?
#Toggle
Yeah, okay. You're right.
->Ending.Honesty

=heardresponse
+I'm glad you feel heard
->Ending.Thirdperson
+But I didn't do anything[?], I just said the thing that you're supposed to say when someone is sad.
->Ending.Honesty

=intellectualism

->END

=surrealism

->END


===Ending
=Leaveinahuff

/Abruptly hang up
->END

=Giveup
Well, um, it doesn't seem like the other person is going to show up.
#Toggle
Yeah, maybe we should rearrange for another time? I hope they're okay.
#Toggle
Yeah, sure. I'll er, see you on the emails.
#Toggle
Yeah see you around.

->END

=Static
/Make static noises while sitting very still, so that it looks like the call has dropped and the video is frozen
#Toggle
Are you there?
#Toggle
/Continue to stay perfectly still
#Toggle
I think the call has dropped
#Toggle
/Hmm, can you read these instructions without moving your eyes?
#Toggle
I can see you moving, what's going on?
#Toggle
Sorry, I think I'm having some technical issues
#Toggle
Okay...
#Toggle
I'll have to go, my computer is breaking
#Toggle
Oh no, I'm sorry to hear that
#Toggle
I think I smell burning plastic
#Toggle
That does sound like it might be an issue
#Toggle
It was lovely talking to you, let's do this again some time.
->END

=Thirdperson
#-----The third person suddenly pops into the call. I don't know what happens then.
->END

=Honesty
The truth is, I feel awkward all of the time. 

* I guess a lot of people can just be themselves and go with the flow[...], but I've never done that. I'm constantly monitoring myself, and imagining how I could have done things differently...
#Toggle
->Start
* I manage all my social interactions by just following scripts and procedures[...] that I think represent the "right thing to do" - the thing that will stop me from messing everything up. I constantly ruminate on situations like this, because part of me thinks eventually I'll discipline myself into writing the perfect script.
#Toggle
->Start
* {Honesty>1} If I don't do this...
->HonestyExpand

=HonestyExpand
If I let go, and just say the first thing that comes to mind, I end up sounding strange, or going on and on for ages as I just empty out every thought in my head.

*I don't know what my other options are...
I can say the thing that I know you're supposed to say, and risk seeming insincere, or I can say the thing that comes to mind for me, and risk seeming arrogant or just not being understood.
->Whatifwedont

=Whatifwedont


->END