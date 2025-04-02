# write to address
create_hw_axi_txn -force write_txn [get_hw_axis hw_axi_1] -type write -address C000_0008 -len 3 -data {00000000_00800080_00000001}
run_hw_axi [get_hw_axi_txns write_txn]
create_hw_axi_txn -force read_txn [get_hw_axis hw_axi_1] -type read -address C000_0008 -len 3
run_hw_axi [get_hw_axi_txns read_txn]

create_hw_axi_txn -force write_txn [get_hw_axis hw_axi_1] -type write -address C000_0014 -len 3 -data {00000000_00000080_00000009}
run_hw_axi [get_hw_axi_txns write_txn]
create_hw_axi_txn -force read_txn [get_hw_axis hw_axi_1] -type read -address C000_0014 -len 3
run_hw_axi [get_hw_axi_txns read_txn]

create_hw_axi_txn -force write_txn [get_hw_axis hw_axi_1] -type write -address C000_0020 -len 3 -data {00000000_012B018F_00000007}
run_hw_axi [get_hw_axi_txns write_txn]
create_hw_axi_txn -force read_txn [get_hw_axis hw_axi_1] -type read -address C000_0020 -len 3
run_hw_axi [get_hw_axi_txns read_txn]

create_hw_axi_txn -force write_txn [get_hw_axis hw_axi_1] -type write -address C000_0004 -len 1 -data {00000301}
run_hw_axi [get_hw_axi_txns write_txn]
create_hw_axi_txn -force read_txn [get_hw_axis hw_axi_1] -type read -address C000_0004 -len 1
run_hw_axi [get_hw_axi_txns read_txn]

# read from address
create_hw_axi_txn -force read_txn [get_hw_axis hw_axi_1] -type read -address C000_0000 -len 11
run_hw_axi [get_hw_axi_txns read_txn]
