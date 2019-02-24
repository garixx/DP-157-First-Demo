$port = 8080
$IIS_url = "http://192.168.56.3" + ":" + $port

$ASP_Temporary_Files = "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files"
$IIS_home = "C:\Users\vagrant\Documents\My Web Sites\"

$sourceRoot = "C:\vagrant\GameDemo" 
$destinationRoot = "C:\Users\vagrant\Documents\My Web Sites\" 
 
choco feature enable -n allowGlobalConfirmation
#choco install git
choco install iisexpress
refreshenv

echo "Setting up firewall rules ... "
netsh advfirewall firewall add rule name="IIS Example" dir=in action=allow protocol=TCP localport=$port
netsh http add urlacl url=$IIS_url user=everyone

echo "Copy web app to IIS home ... "
New-Item -ItemType directory -Path $ASP_Temporary_Files
New-Item -ItemType directory -Path $IIS_home
Copy-Item -Path $sourceRoot -Recurse -Destination $destinationRoot -Container 

echo "Setting up the GameDemo site ... "
echo "File reading ... "
[xml]$myXML = Get-Content C:\"Program Files\IIS Express"\config\templates\PersonalWebServer\applicationhost.config

echo "Name and folder set ... "
$myXml.configuration."system.applicationHost".sites.site.name = "GameDemo"
$myXml.configuration."system.applicationHost".sites.site.application.virtualDirectory.physicalPath = "%IIS_SITES_HOME%\GameDemo"

echo "Clone the node ... "
$Clone = $myXml.configuration."system.applicationHost".sites.site.bindings.binding.Clone()
$Clone.bindingInformation = ":8080:192.168.56.3"
$myXml.configuration."system.applicationHost".sites.site.bindings.AppendChild($Clone)

echo "Save config ... "
$myXML.Save("C:\Program Files\IIS Express\config\templates\PersonalWebServer\applicationhost.config")

C:\"Program Files\IIS Express"\iisexpress