#Toggle
->Start

===Start
+[Confirm that you can see and hear one another]->Confirmation
+I'm not done getting ready{.|.| either.| either.} ->Fixappearance

===Confirmation
Hi, can you hear me? Can you see me?
#Toggle
->Confirmationresponses

===Confirmationresponses
+ Yes I can see and hear you #Toggle
    ->Greetings
+ [Gesture silently] ->Gesture

===Greetings
*[Hide]->Coverface
+How are you? #Toggle
    ->Reciprocation
+How's it hanging? #Toggle
    ->Reciprocation
+Good morning #Toggle
    ->Reciprocation

===Reciprocation
+/Repeat what they just said #Toggle
    ->Reciprocation
+I'm fine thank you, how are you? #Toggle
    {->Reciprocation | ->Conclusion}
*Say nothing, hum agreeably #Toggle
    ->Conclusion

===Gesture
*Smile and wave while still on mute #Toggle
    ->Confirmation
*Thumbs up #Toggle
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
* ->Fixappearanceexit

==Fixappearanceexit
But this is the best I can offer, face-wise. #Toggle 
    ->Greetings

===Coverface
Oh no, they can see and hear you!
*/Hide under the desk #Toggle
    ->Greetings
*/Cover your face with your hands #Toggle
    ->Greetings
*/Cover your face with a nearby object #Toggle
    ->Greetings

===Conclusion
#Toggle
Is it just us? Or are we waiting for someone else?

#Toggle
Yeah I'm expecting one more person to join us on this call. They said "yes" on the calendar invite anyway.

#Toggle
Okay well, let's just wait a while, I'm sure they're not far away...
->END