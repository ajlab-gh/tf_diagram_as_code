resource "local_file" "generate_drawio" {
  filename = "../outputs/architecture.drawio"
  content = templatefile("../src/reference.drawio", {
    vnetName          = azurerm_virtual_network.fgtvnetwork.name
    vnetAddressPrefix = var.vnetcidr
    subnet1Prefix     = var.publiccidr
    subnet2Prefix     = var.privatecidr
    subnet1Name       = azurerm_subnet.publicsubnet.name
    subnet2Name       = azurerm_subnet.privatesubnet.name
    hostname          = azurerm_virtual_machine.fgtvm.name
    publicIP1Name     = azurerm_public_ip.FGTPublicIp.name
    fgtpublisher = var.publisher
    fgtoffer = var.fgtoffer
    fgtversion = var.fgtversion
    fgturl = format("https://%s", azurerm_public_ip.FGTPublicIp.ip_address)
    }
  )
}