# Constraints for Basys 3 for ALUtest

# Clock signal
#Horloge sur un bouton
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets Clock]
#set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports Clock]
#Horloge avec un oscillateur
#set_property -dist { PACKAGE_PIN W5 IOSTANDARD LVCMOS33 } [get_ports { CLK } ]
#create_clock -add -name sysclk_pin -period 10.00 -waveform { 0 5} [get_ports { CLK } ]
set_property -dict {IOSTANDARD LVCMOS33} [get_ports CLK]
create_clock -add -name CLK -period 250.00 [get_ports {CLK}];
# Inputs
set_property -dict { PACKAGE_PIN V2  IOSTANDARD LVCMOS33 } [get_ports addr_W[0]]
set_property -dict { PACKAGE_PIN T3  IOSTANDARD LVCMOS33 } [get_ports addr_W[1]]
set_property -dict { PACKAGE_PIN T2  IOSTANDARD LVCMOS33 } [get_ports addr_W[2]]
set_property -dict { PACKAGE_PIN R3  IOSTANDARD LVCMOS33 } [get_ports addr_W[3]]

set_property -dict { PACKAGE_PIN W2  IOSTANDARD LVCMOS33 } [get_ports addr_A[0]]
set_property -dict { PACKAGE_PIN U1  IOSTANDARD LVCMOS33 } [get_ports addr_A[1]]
set_property -dict { PACKAGE_PIN T1  IOSTANDARD LVCMOS33 } [get_ports addr_A[2]]
set_property -dict { PACKAGE_PIN R2  IOSTANDARD LVCMOS33 } [get_ports addr_A[3]]

set_property -dict { PACKAGE_PIN V17  IOSTANDARD LVCMOS33 } [get_ports DATA[0]]
set_property -dict { PACKAGE_PIN V16  IOSTANDARD LVCMOS33 } [get_ports DATA[1]]
set_property -dict { PACKAGE_PIN W16  IOSTANDARD LVCMOS33 } [get_ports DATA[2]]
set_property -dict { PACKAGE_PIN W17  IOSTANDARD LVCMOS33 } [get_ports DATA[3]]
set_property -dict { PACKAGE_PIN W15  IOSTANDARD LVCMOS33 } [get_ports DATA[4]]
set_property -dict { PACKAGE_PIN V15  IOSTANDARD LVCMOS33 } [get_ports DATA[5]]
set_property -dict { PACKAGE_PIN W14  IOSTANDARD LVCMOS33 } [get_ports DATA[6]]
set_property -dict { PACKAGE_PIN W13  IOSTANDARD LVCMOS33 } [get_ports DATA[7]]

# Control signals
set_property -dict { PACKAGE_PIN T17  IOSTANDARD LVCMOS33 } [get_ports W[0]]

# Outputs
set_property -dict { PACKAGE_PIN U16  IOSTANDARD LVCMOS33 } [get_ports QA[0]]
set_property -dict { PACKAGE_PIN E19  IOSTANDARD LVCMOS33 } [get_ports QA[1]]
set_property -dict { PACKAGE_PIN U19  IOSTANDARD LVCMOS33 } [get_ports QA[2]]
set_property -dict { PACKAGE_PIN V19  IOSTANDARD LVCMOS33 } [get_ports QA[3]]
set_property -dict { PACKAGE_PIN W18  IOSTANDARD LVCMOS33 } [get_ports QA[4]]
set_property -dict { PACKAGE_PIN U15  IOSTANDARD LVCMOS33 } [get_ports QA[5]]
set_property -dict { PACKAGE_PIN U14  IOSTANDARD LVCMOS33 } [get_ports QA[6]]
set_property -dict { PACKAGE_PIN V14  IOSTANDARD LVCMOS33 } [get_ports QA[7]]
