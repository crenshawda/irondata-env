irondata-env
============

Vagrant scripts for bootstapping an IronData dev environment

Rough instructions follow:

Pre-Installation
----------------
Git
    -> Set core.autocrlf to input or false
    -> $ git config core.autocrlf input
VirtualBox
Vagrant

Note: You should have at least 8GB of total RAM for the standard configuration to work, if you have less then performance may suffer quite a bit.

mkdir $HOME/VagrantBoxes/
cd $HOME/VagrantBoxes
git clone https://github.com/crenshawda/irondata-env
cd irondata-env
vagrant up

Note: The machine will install things and reboot

Post-Installation Instructions
------------------------------
* Need to do the icmdb liquibase schema migration since SVN can't be scripted yet
* Boot GGTS up
	* switch the Grails runtime to 2.2.4 (located at ~/.gvm/grails/2.2.4/)
	* switch the Groovy compiler to 2.0.x
* Grab the subversive plugin from GGTS, check out the code and run the app (maven will download the internet, slow)
	* do grails-console$ run-app to confirm it's all working
* TODO: Pave and load test-data scripts?
