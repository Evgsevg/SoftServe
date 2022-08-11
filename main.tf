terraform {
  required_providers {
    virtualbox = {
      source  = "shekeriev/virtualbox"
      version = "0.0.4"
    }
  }
}


resource "virtualbox_vm" "node" {
  count = 1
  name  = "${ format("node-%02d", count.index+1) }"
  image = "https://app.vagrantup.com/ubuntu/boxes/xenial64/versions/20190507.0.0/providers/virtualbox.box" 

  cpus   = "2"
  memory = "2048 mib"
  
  network_adapter {
     type = "bridged"
     host_interface = "Intel(R) Wi-Fi 6 AX201 160MHz"
  }
  //user_data ="${file(security.dat)}"
}

output "IPaddress1" {
    value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}
output "IPaddress2" {
    value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
}