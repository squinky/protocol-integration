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

->END
