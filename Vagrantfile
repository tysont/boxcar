# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-16.10"
  #config.vm.box = "bento/ubuntu-17.10"
  #config.vm.box_version = "201710.25.0"
  guestHostname = "development"
  config.vm.define guestHostname

  guestUsername = ""
  guestPassword = ""
  guestHome = ""

  hostUsername = ENV['USERNAME']
  hostHome = ENV['HOME']

  mountHome = "/mnt/home" 
  config.vm.synced_folder hostHome, mountHome

  config.ssh.forward_agent = true

  provider = ""
  if ARGV[1] and (ARGV[1].split('=')[0] == "--provider" or ARGV[2])
    provider = (ARGV[1].split('=')[1] || ARGV[2])
  else
    provider = (ENV['VAGRANT_DEFAULT_PROVIDER'] || "virtualbox")
  end

  if Dir.glob("#{File.dirname(__FILE__)}/.vagrant/machines/" + guestHostname + "/*").empty? || ARGV[1] == '--provision'
    
    print "Username: "
    guestUsername = STDIN.gets.chomp

    print "Password: "
    guestPassword = STDIN.gets.chomp
    print "\n"

    guestHome = File.join("/home/", guestUsername)

  end  

  config.vm.provider "virtualbox" do |v|
    v.name = guestHostname
    v.memory = 8192
    v.cpus = 2
    v.customize ["modifyvm", :id, "--vram", "128"]
    v.customize ['modifyvm', :id, '--clipboard', 'bidirectional']  
    v.gui = true
    provider = "virtualbox"
  end

  config.vm.provider "vmware_fusion" do |v|
    v.vmx['displayname'] = guestHostname
    v.vmx["memsize"] = "8192"
    v.vmx["numvcpus"] = "2"
    v.vmx["vramsize"] = "134217728"
    v.gui = true
    provider = "vmware_fusion"
  end   

  config.vm.provision "shell" do |s|
    s.path = "Build/Bootstrap/Provision.sh"
    s.args   = [provider, guestUsername, guestPassword, guestHome, mountHome]
    s.binary = true
  end

end 