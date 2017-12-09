# transit-ticker-client
Pulls transit data for use in ticker

## Installation
_at home_  
1. Assemble RPI (power, hdmi, keyboard)  
 
_in NOOBS menu_

2. Set language and keyboard to US english (seriously important because of keyboard layouts)
3. Connect to wifi network
4. Install Raspian Lite
5. log in using default login (pi: raspberry) 
6. change password (steve will provide new password)
```bash
passwd
```
7. update package manager repos
```bash
sudo apt-get update
```
8. install git, redis
```bash
sudo apt-get install git redis-server python-pip
```
9. download client
```bash
git clone https://github.com/saylorsd/transit-ticker-client
```
10. run installation script
```bash
cd transit-ticker-client
sudo chmod +x install.sh
sudo ./install.sh
```

The installation script will guide you through the process. It will ask you to provide a few pieces of information.  

| requested item| description |
|------------|----------------|
|__ticker id__| the ticker ID supplied to you for this ticker.  |
|__host SSID__| the name of the host's wireless network (provided by host)  ||
|__host passphrase__| the password for the host's wireless network (provided by host)

*if you make a mistake during this process, just re-run the install script
```bash
sudo ./install.sh
```
