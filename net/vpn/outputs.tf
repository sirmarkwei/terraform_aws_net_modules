output "tun1_ip" {
  value = "${aws_vpn_connection.vpn-conn.tunnel1_address}"
}

output "tun2_ip" {
  value = "${aws_vpn_connection.vpn-conn.tunnel2_address}"
}

output "tun1_key" {
  value = "${aws_vpn_connection.vpn-conn.tunnel1_preshared_key}"
}

output "tun2_key" {
  value = "${aws_vpn_connection.vpn-conn.tunnel2_preshared_key}"
}
