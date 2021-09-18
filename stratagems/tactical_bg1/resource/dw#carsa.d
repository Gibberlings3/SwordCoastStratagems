BEGIN "dw#carsa" 

IF ~NumTimesTalkedTo(0)~ BEGIN initial
SAY @50 /* I made it to Gullykin, thanks to you. The folk here are kind, and I am beginning to recover my senses, but the nightmares will take a long time to fade. */
=
@51 /* Thank you again for freeing me from Kahrk - and for ridding the Realms of that monster. */
IF ~~ THEN DO ~ReputationInc(1)~ EXIT
END

IF ~!NumTimesTalkedTo(0)~ BEGIN repeat
SAY @52 /* I will never forget what you did for me, but I need to be alone now. Talking is difficult. */
IF ~~ THEN EXIT
END