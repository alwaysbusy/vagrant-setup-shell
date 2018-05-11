# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

# Set up machine name based on git branch to prevent conflicts in branches
git_branch = `git rev-parse --abbrev-ref HEAD`.strip
if(git_branch == "master") then
  git_branch = "default"
end
GIT_BRANCH = git_branch

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define GIT_BRANCH, primary: true do |branch|

    # Make sure environment variables are always set
    branch.vm.provision :shell, :inline => "ln -sf /vagrant/vagrant-env.sh /etc/profile.d/vagrant.sh; echo source /etc/profile.d/vagrant.sh >> ~/.bashrc"
    branch.vm.provision :shell, :inline => "echo source /etc/profile.d/vagrant.sh >> ~/.bashrc", :privileged => "false"
    # Do the provisioning
    branch.vm.provision :shell, :path => "vagrant-setup.sh"
    branch.vm.provision :shell, :path => "vagrant-start.sh"

    branch.vm.box = 'ubuntu/xenial64'
    branch.vm.synced_folder ".", "/vagrant"

  end

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "2000"]
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
  end

end
