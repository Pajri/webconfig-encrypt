# webconfig-encrypt
This project is to demonstrate how to encrypt web.config using aspnet_regiis.exe.
This project consists of two branches :
- **master** is project with plain web.config
- **web-config_encrypted** is project with encrypted web.config (appSetting section)

Below is summary of encrypting web.config. For more detail, pleae see this link : [How to Encrypt Web.config Using aspnet_regiis.exe (Framework 4+) Focus on Web Farms](https://www.codeproject.com/Tips/877258/How-to-Encrypt-Web-config-Using-aspnet-regiis-exe)
## Encrypting web.config
1. Run the website.
2. Access /CheckAppPoolIdentity. You will see app pool data like this
   
   | VARIABLE | VALUE |
   | --- | --- |
   | System.Security.Principal.WindowsIdentity.GetCurrent().Name | **&lt;app pool identity name&gt;** |
   
   Save **&lt;app pool identity name&gt;** we will need this value in the next step.

3. Run **Command Prompt** as **Administrator**
4. Navigate to **aspnet_regiis** location : `C:\Windows\Microsoft.NET\Framework\<version>`
5. Encrypt specific section in web.config
   ```
   aspnet_regiis.exe -pef <web.config section>  <web.config path>
   ```
   example :
   ```
   aspnet_regiis.exe -pef appSettings  C:\inetpub\wwwroot\app\WebConfigEncryption
   ```
6. Creating an RSA Container
   ```
   aspnet_regiis.exe -pc “<rsa container name>” -exp
   ```
   example :
   ```
   aspnet_regiis.exe -pc “myApp1SampleKeys” -exp
   ```
   
7. Granting Access to RSA Key Container
   Execute both commands below 
   ```
   aspnet_regiis -pa “<rsa container name>” “NT AUTHORITY\NETWORK SERVICE”
   ```
   ```
   aspnet_regiis -pa “<rsa container name>” “<app pool identity name>”
   ```
   
8. Updating app’s web.config file to specify a customProvider
   Insert this xml to web.config. For example, above <connectionStrings>
   ```
   <configProtectedData>
      <providers>
         <add name="customProvider"
            type="System.Configuration.RsaProtectedConfigurationProvider, System.Configuration, Version=2.0.0.0,
            Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
            keyContainerName="**<rsa container name>**"
            useMachineContainer="true" />
      </providers>
   </configProtectedData>
   <connectionStrings>
      ...
   </connectionStrings>
   ```
   
9. Encrypting appSection Using Our New CustomProvider
   ```
   aspnet_regiis.exe -pef **<web.config section>** **<path to web.config>** -prov “customProvider”
   ```
   
10.Exporting the Key Container in Order to be Used in Other Machines
   ```
   aspnet_regiis.exe -px “<rsa container name>” <path to exported key> -pri
   ```
   example : 
   ```
   aspnet_regiis -px “myApp1SampleKeys” c:\myApp1SampleKeys.xml -pri
   ```
11.Importing the Key Container on Another Machine
   ```
   aspnet_regiis -pi “<rsa container name>” <path to exported key>
   ```
   example : 
   ```
   aspnet_regiis -pi “myApp1SampleKeys” c:\myApp1SampleKeys.xml
   ```
12.Run the website again.
