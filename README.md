*Images to quickly bootstrap different environments (eg. my development environment).*

## Local Environment Setup:

1. Install [Vagrant](https://www.vagrantup.com/downloads.html).
2. Install either [Virtualbox](https://www.virtualbox.org/wiki/Downloads) or [VMWare Fusion](http://store.vmware.com/store/vmware/en_US/pd/productID.323690000?src=ps_570c41fd1ed2e&kw=vmware%20fusion&mt=e&utm_source=google&utm_medium=ppc&utm_campaign=GS_eBiz_Lead_AMS_US_EN_BR_E_Fusion&k_clickid=a975f09d-c345-4a6a-9256-8c47f6347f91&gclid=CjwKEAjwutXIBRDV7-SDvdiNsUoSJACIlTqlfpfHUx-ynBpjeMw1CxAZ1f_Bqp2xYo6afVe9xaTQ2hoCyMzw_wcB).

## Development VM Creation:

1. Git clone this repo.
2. Navigate to /Development.
3. Run 'vagrant up' (can optionally add --provider virtualbox or --provider vmware_fusion).

## Setup a User:

1. From the local environment, run 'vagrant ssh'.
2. Run 'sudo adduser [username]' and set a password.
3. Run 'sudo adduser [username] sudo' to grant sudoers access.
4. Run 'sudo adduser [username] docker' if you need to talk to the docker daemon.

**Login to the VM GUI in either Virtualbox or VMWare Fusion and go nuts.** 

*Send me a PR if you clean things up or add cool stuff.*
