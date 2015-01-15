Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.10.42"
  config.vm.synced_folder ".", "/var/www", owner: "vagrant", group: "www-data", mount_options: ["dmode=777,fmode=777"]

  config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'puppet/manifests'
      puppet.module_path = 'puppet/modules'
      puppet.manifest_file = 'init.pp'
  end

  config.vm.hostname = "vagrant.example.com"
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
end



