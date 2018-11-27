Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install habitat -y
hab pkg install core/windows-service
hab pkg exec core/windows-service install
Start-Service -Name Habitat

#Se instala y configura un servicio apache 
#choco install apache-httpd -y
#Start-Service -Name Apache




