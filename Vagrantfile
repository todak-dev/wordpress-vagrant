# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "wordpress.local"
  config.vm.network "private_network", ip: "192.168.222.222", hostname: true,  :dev => "en0: Wi-Fi", :mode => "bridge", :type => "bridge"
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 8043, host_ip: "127.0.0.1"  
  config.vm.network "forwarded_port", guest: 3306, host: 3306, host_ip: "127.0.0.1"
  config.ssh.insert_key = false
  config.vm.provider "virtualbox" do |v| v.gui = true
  end

  config.vm.provision "ansible" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.inventory_path = "ansible/hosts/ops.ini"
    ansible.limit = "wordpress"
    ansible.playbook = "ansible/playbook.yml"
  end
end

