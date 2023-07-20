# ethernet-service
The configuration scripts of systemd service for ethtool and ethernet setting.

## Setup & Run
1. Clone this repository to the local side for the service.
```shell
git clone https://github.com/KoKoLates/ethernet-service.git
```
2. Modifying authorization.
```shell
cd ethernet-service
sudo chmod 644 service_config.sh
```
3. Start configurate the ethtool and ethernet services.
```
sudo ./service_config.sh -y
```

