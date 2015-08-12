REM
REM Updated by MFR "Why does no on check the master builds?"
REM 11Aug2015 MFR - 'cause I get things done
REM 

tools\nuget.exe update -self

rd download /s /q

if not exist download mkdir download
if not exist download\WindowsPhone mkdir download\WindowsPhone
if not exist download\Silverlight mkdir download\Silverlight
if not exist download\package mkdir download\package
if not exist download\package\twilio mkdir download\package\twilio
if not exist download\package\twiliomvc mkdir download\package\twiliomvc
if not exist download\package\twiliotwiml mkdir download\package\twiliotwiml
if not exist download\package\twiliowebmatrix mkdir download\package\twiliowebmatrix
if not exist download\package\twilioclient mkdir download\package\twilioclient
if not exist download\package\twiliotaskrouter mkdir download\package\twiliotaskrouter
if not exist download\package\twiliolookups mkdir download\package\twiliolookups
if not exist download\package\twiliopricing mkdir download\package\twiliopricing
if not exist download\package\twiliomonitor mkdir download\package\twiliomonitor

if not exist download\package\twilio\lib mkdir download\package\twilio\lib
if not exist download\package\twilio\lib\3.5 mkdir download\package\twilio\lib\3.5
if not exist download\package\twilio\lib\WINDOWSPHONE8 mkdir download\package\twilio\lib\WINDOWSPHONE8
if not exist download\package\twilio\lib\SL5 mkdir download\package\twilio\lib\SL5

if not exist download\package\twiliomvc\lib mkdir download\package\twiliomvc\lib
if not exist download\package\twiliomvc\lib\3.5 mkdir download\package\twiliomvc\lib\3.5

if not exist download\package\twiliotwiml\lib mkdir download\package\twiliotwiml\lib
if not exist download\package\twiliotwiml\lib\3.5 mkdir download\package\twiliotwiml\lib\3.5

if not exist download\package\twiliowebmatrix\lib mkdir download\package\twiliowebmatrix\lib
if not exist download\package\twiliowebmatrix\lib\3.5 mkdir download\package\twiliowebmatrix\lib\3.5

if not exist download\package\twilioclient\lib mkdir download\package\twilioclient\lib
if not exist download\package\twilioclient\lib\3.5 mkdir download\package\twilioclient\lib\3.5

if not exist download\package\twiliotaskrouter\lib mkdir download\package\twiliotaskrouter\lib
if not exist download\package\twiliotaskrouter\lib\3.5 mkdir download\package\twiliotaskrouter\lib\3.5

if not exist download\package\twiliolookups\lib mkdir download\package\twiliolookups\lib
if not exist download\package\twiliolookups\lib\3.5 mkdir download\package\twiliolookups\lib\3.5

if not exist download\package\twiliopricing\lib mkdir download\package\twiliopricing\lib
if not exist download\package\twiliopricing\lib\3.5 mkdir download\package\twiliopricing\lib\3.5

if not exist download\package\twiliomonitor\lib mkdir download\package\twiliomonitor\lib
if not exist download\package\twiliomonitor\lib\3.5 mkdir download\package\twiliomonitor\lib\3.5

REM tools\ilmerge.exe /lib:src\Twilio.Api\bin\Release /internalize /ndebug /v2 /out:download\Twilio.Api.dll Twilio.Api.dll RestSharp.dll
REM tools\ilmerge.exe /lib:src\Twilio.Api.Silverlight\bin\Release /internalize /ndebug /targetplatform:v4,"C:\Program Files (x86)\Microsoft Silverlight\4.1.10111.0" /out:download\Twilio.Api.Silverlight.dll RestSharp.Silverlight.dll

copy src\Twilio.Api\bin\x64\Release\*.* download
copy src\Twilio.Api.Silverlight\bin\x64\Release\*.* download\Silverlight\
copy src\Twilio.Api.WindowsPhone\bin\x64\Release\*.* download\WindowsPhone\
copy src\Twilio.Mvc\bin\x64\Release\*.* download
copy src\Twilio.Twiml\bin\x64\Release\*.* download
copy src\Twilio.WebMatrix\bin\x64\Release\*.* download
copy src\Twilio.Client.Capability\bin\x64\Release\*.* download
copy src\Twilio.TaskRouter\bin\x64\Release\*.* download
copy src\Twilio.Lookups\bin\x64\Release\*.* download
copy src\Twilio.Pricing\bin\x64\Release\*.* download
copy src\Twilio.Monitor\bin\x64\Release\*.* download
copy LICENSE.txt download

copy src\Twilio.Api\bin\Release\Twilio.Api.* download\package\twilio\lib\3.5\
copy src\Twilio.Api.Silverlight\bin\Release\Twilio.Api.Silverlight.* download\package\twilio\lib\SL5\
copy src\Twilio.Api.WindowsPhone\bin\Release\Twilio.Api.WindowsPhone.* download\package\twilio\lib\\WINDOWSPHONE8\

copy src\Twilio.Mvc\bin\Release\Twilio.Mvc.* download\package\twiliomvc\lib\3.5\
copy src\Twilio.Twiml\bin\Release\Twilio.Twiml.* download\package\twiliotwiml\lib\3.5\
copy src\Twilio.WebMatrix\bin\Release\Twilio.WebMatrix.* download\package\twiliowebmatrix\lib\3.5\
copy src\Twilio.Client.Capability\bin\Release\Twilio.Client.Capability.* download\package\twilioclient\lib\3.5\
copy src\Twilio.TaskRouter\bin\Release\Twilio.TaskRouter.* download\package\twiliotaskrouter\lib\3.5\
copy src\Twilio.Lookups\bin\Release\Twilio.Lookups.* download\package\twiliolookups\lib\3.5\
copy src\Twilio.Pricing\bin\Release\Twilio.Pricing.* download\package\twiliopricing\lib\3.5\
copy src\Twilio.Monitor\bin\Release\Twilio.Monitor.* download\package\twiliomonitor\lib\3.5\

tools\nuget.exe pack Twilio.nuspec -BasePath download\package\twilio -o download
tools\nuget.exe pack Twilio.Mvc.nuspec -BasePath download\package\twiliomvc -o download
tools\nuget.exe pack Twilio.TwiML.nuspec -BasePath download\package\twiliotwiml -o download
tools\nuget.exe pack Twilio.WebMatrix.nuspec -BasePath download\package\twiliowebmatrix -o download
tools\nuget.exe pack Twilio.Client.nuspec -BasePath download\package\twilioclient -o download
tools\nuget.exe pack Twilio.TaskRouter.nuspec -BasePath download\package\twiliotaskrouter -o download
tools\nuget.exe pack Twilio.Lookups.nuspec -BasePath download\package\twiliolookups -o download
tools\nuget.exe pack Twilio.Pricing.nuspec -BasePath download\package\twiliopricing -o download
tools\nuget.exe pack Twilio.Monitor.nuspec -BasePath download\package\twiliomonitor -o download