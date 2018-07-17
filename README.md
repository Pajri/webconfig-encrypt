# webconfig-encrypt
This project is to demonstrate how to encrypt web.config using aspnet_regiis.exe.
This project consists of two branches :
- **master** is project with plain web.config
- **web-config_encrypted** is project with encrypted web.config (appSetting section)

Below is summary of encrypting web.config. For more detail, pleae see this link : [How to Encrypt Web.config Using aspnet_regiis.exe (Framework 4+) Focus on Web Farms](https://www.codeproject.com/Tips/877258/How-to-Encrypt-Web-config-Using-aspnet-regiis-exe)
## Encrypting web.config
1. Run **Command Prompt** as **Administrator**
2. Navigate to **aspnet_regiis** location : `C:\Windows\Microsoft.NET\Framework\<version>`
3. Encrypt specific section in web.config
   ```
   aspnet_regiis.exe -pef <web.config section>  <web.config path>
   ```
   example :
   ```
   aspnet_regiis.exe -pef appSettings  C:\inetpub\wwwroot\app\WebConfigEncryption
   ```
4. Creating an RSA Container
   ```
   aspnet_regiis.exe -pc “<rsa container name>” -exp
   ```
   example :
   ```
   aspnet_regiis.exe -pc “myApp1SampleKeys” -exp
   ```
