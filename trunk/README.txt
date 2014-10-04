SharedMedia_NoAsianFonts
============

Removes Chinese and Korean versions of default game fonts from
LibSharedMedia-3.0 for Western and Russian users.

There is no reason for these fonts to be registered by default outside
of Chinese and Korean game clients, as they are virtually identical to
Friz Quadrata, and just clutter up font menus with duplicate entries
for most users. The very small minority of users who want to read or
write in East Asian languages in a Western or Russian game client are
already using other addons to enable such characters in the chat frame
and provide other language-specific features. Adding Chinese or Korean
fonts to LibSharedMedia-3.0 should be handled by such addons, not by the
library itself. However, the author of the library does not agree, so
this addon was created.


Download
-----------

* [WoWInterface](http://www.wowinterface.com/downloads/info21961-SharedMediaNoAsianFonts.html)
* [Curse](http://www.curse.com/addons/wow/sharedmedia-nochinese)


Other Uses
-------------

This addon can also be used to remove unwanted fonts registered by
addons, without editing the code of those addons after each update.
Simply open the "Addon.lua" file in this addon in Notepad or another
plain-text editing program, and add the names of the unwanted fonts
to the list of fonts to be removed.


Localization
---------------

Compatible with English, Deutsch, Español, Français, Italiano, 
Português, and Русский game clients. Does not require translations.


Feedback
-----------

Post a ticket on either download site, or a comment on WoWInterface.

If you are reporting a bug, please include directions I can follow to
reproduce the bug, whether it still happens when all other addons are
disabled, and the exact text of the related error message (if any) from 
[Bugger](http://www.wowinterface.com/downloads/info23144-Bugger.html).

If you need to contact me privately, you can send me a private message
on either download site, or email me at <addons@phanx.net>.


License
----------

Copyright (c) 2012-2014 Phanx. All rights reserved.  
See the accompanying LICENSE file for information about the conditions
under which redistribution and modification may be allowed.
