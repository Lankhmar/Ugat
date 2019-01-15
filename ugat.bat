::Ugat v1.0
::Author: @FFS
@echo off



title Ugat 
color 0a
mode con cols=80 lines=26

:menu
echo               ===================================================
type "banner.txt" 
echo               ===================================================
echo.

setlocal
set /p user="[#] Input Username:"
if %user% == NEQ 1
echo.
echo [*] Checking Username on: ...
>nul timeout /t 2


::Facebook
set facebook=https://www.facebook.com/
curl -s -k %facebook%%user% -L -H "Accept-Language: en" > profile.html
>nul find /i "Page Not Found" profile.html  && (
    :: Exists
    echo [+] Facebook: Not Found! 
) || (
    :: No exists
    echo [+] Facebook: Found! %facebook%%user%  
    echo %facebook%%user% >%user%.txt
)
del profile.html 



::Twitter
set twitter=https://twitter.com/
curl -s -k %twitter%%user% -L -H "Accept-Language: en" > profile.html 
>nul find /i "Sorry, that page doesn’t exist!" profile.html && (
    :: Exists
    echo [+] Twitter: Not Found! 
) || (
    :: No exists
    echo [+] Twitter: Found! %twitter%%user% 
    echo %twitter%%user% >>%user%.txt 
)
del profile.html



::Instagram
set instagram=https://www.instagram.com/
curl -s -k %instagram%%user% -L -H "Accept-Language: en" >profile.html
>nul find /i "Page Not Found" profile.html && (
    :: Exists
    echo [+] Instagram: Not Found! 
) || (
    :: No exists
    echo [+] Instagram: Found! %instagram%%user%  
    echo %instagram%%user% >>%user%.txt 
)
del profile.html



::Blogger
set blogger=https://%user%.blogspot.com
curl -s -k -i %blogger% -L -H "Accept-Language: en" >profile.html
>nul find /i "HTTP/2 404" profile.html && (
    :: Exists
    echo [+] Blogger: Not Found! 
) || (
    :: No exists
    echo [+] Blogger: Found! %blogger%  
    echo %blogger%%user% >>%user%.txt 
)
del profile.html



::Youtube
set youtube=https://www.youtube.com/user/
curl -s -k %youtube%%user% -L -H "Accept-Language: en" >profile.html
>nul find /i "This channel does not exist." profile.html && (
    :: Exists
    echo [+] Youtube: Not Found! 
) || (
    :: No exists
    echo [+] Youtube: Found! %youtube%%user% 
    echo %youtube%%user% >>%user%.txt 
)
del profile.html



::Spotify
set spotify=https://open.spotify.com/user/
curl -s -i -k "%spotify%%user%" -L -H "Accept-Language: en" >profile.html
>nul find /i "HTTP/2 404" profile.html && (
    :: Exists
    echo [+] Spotify: Not Found! 
) || (
    :: No exists
    echo [+] Spotify: Found! %spotify%%user%  
    echo %spotify%%user% >>%user%.txt 
)
del profile.html



::Soundcloud
set soundcloud=https://soundcloud.com/
curl -s -i -k "%soundcloud%%user%" -L -H "Accept-Language: en" >profile.html
>nul find /i "HTTP/1.1 404 Not Found" profile.html && (
    :: Exists
    echo [+] Soundcloud: Not Found! 
) || (
    :: No exists
    echo [+] Soundcloud: Found! %soundcloud%%user%  
    echo %soundcloud%%user% >>%user%.txt 
)
del profile.html



::Badoo
set badoo=https://www.badoo.com/en/
curl -s -i -k "%badoo%%user%" -L -H "Accept-Language: en" >profile.html
>nul find /i "HTTP/1.1 404 Not Found" profile.html && (
    :: Exists
    echo [+] Badoo: Not Found! 
) || (
    :: No exists
    echo [+] Badoo: Found! %badoo%%user%  
    echo %badoo%%user% >>%user%.txt
)
del profile.html



::Patreon
set patreon=https://www.patreon.com/
curl -s -i -k "%patreon%%user%" -L -H "Accept-Language: en" >profile.html
>nul find /i "HTTP/2 404" profile.html && (
    :: Exists
    echo [+] Patreon: Not Found! 
) || (
    :: No exists
    echo [+] Patreon: Found! %patreon%%user%  
    echo %patreon%%user% >>%user%.txt
)
del profile.html



::Ebay
set ebay=https://www.ebay.com/usr/
curl -s -i -k "%ebay%%user%" -L -H "Accept-Language: en" >profile.html
>nul find /i "eBay Profile - error" profile.html && (
    :: Exists
    echo [+] Ebay: Not Found! 
) || (
    :: No exists
    echo [+] Ebay: Found! %ebay%%user% 
    echo %ebay%%user% >>%user%.txt
)
del profile.html



::Pinterest
set pinterest=https://www.pinterest.com/
curl -s -i -k "%pinterest%%user%" -H "Accept-Language: en" -L --user-agent "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801" >profile.html
>nul find /i "?show_error" profile.html && (
    :: Exists
    echo [+] Pinterest: Not Found! 
) || (
    :: No exists
    echo [+] Pinterest: Found! %pinterest%%user%  
    echo %pinterest%%user% >>%user%.txt
)
del profile.html



::DevianART
set devianart=https://www.deviantart.com/
curl -s -i -k "%devianart%%user%" -L -H "Accept-Language: en" >profile.html
>nul find /i "HTTP/2 404" profile.html && (
    :: Exists
    echo [+] DevianART: Not Found! 
) || (
    :: No exists
    echo [+] DevianART: Found! %devianart%%user%
    echo %devianart%%user% >>%user%.txt
)
del profile.html



::GitHub
set github=https://github.com/
curl -s -i -k "%github%%user%" -L -H "Accept-Language: en" "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801" >profile.html
>nul find /i "HTTP/1.1 404 Not Found" profile.html && (
    :: Exists
    echo [+] GitHub: Not Found! 
) || (
    :: No exists
    echo [+] GitHub: Found! %github%%user%  
    echo %github%%user%  >>%user%.txt
)
del profile.html



::Steam
set steam=https://steamcommunity.com/id/
curl -s -i -k "%steam%%user%" -L -H "Accept-Language: en" "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801" >profile.html
>nul find /i "The specified profile could not be found" profile.html && (
    :: Exists
    echo [+] Steam: Not Found!
) || (
    :: No exists
    echo [+] Steam: Found! %steam%%user% 
    echo %steam%%user%  >>%user%.txt
)
del profile.html

if exist %user%.txt (
    echo [*] Saved %user%.txt
	) else (
    >nul echo.
	)

echo.

echo Press enter to search again...
pause>nul
cls&endlocal
goto menu 

