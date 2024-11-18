# Constraints for Basys 3 for ALUtest

# Clock signal
#Horloge sur un bouton
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets Clock]
#set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports Clock]
#Horloge avec un oscillateur
#set_property -dist { PACKAGE_PIN W5 IOSTANDARD LVCMOS33 } [get_ports { Clock } ]
#create_clock -add -name sysclk_pin -period 10.00 -waveform { 0 5} [get_ports { Clock } ]
# Inputs
#set_property -dict { PACKAGE_PIN V2  IOSTANDARD LVCMOS33 } [get_ports a[0]]
#set_property -dict { PACKAGE_PIN T3  IOSTANDARD LVCMOS33 } [get_ports a[1]]
#set_property -dict { PACKAGE_PIN T2  IOSTANDARD LVCMOS33 } [get_ports a[2]]
#set_property -dict { PACKAGE_PIN R3  IOSTANDARD LVCMOS33 } [get_ports a[3]]
#set_property -dict { PACKAGE_PIN W2  IOSTANDARD LVCMOS33 } [get_ports a[4]]
#set_property -dict { PACKAGE_PIN U1  IOSTANDARD LVCMOS33 } [get_ports a[5]]
#set_property -dict { PACKAGE_PIN T1  IOSTANDARD LVCMOS33 } [get_ports a[6]]
#set_property -dict { PACKAGE_PIN R2  IOSTANDARD LVCMOS33 } [get_ports a[7]]

#set_property -dict { PACKAGE_PIN V17  IOSTANDARD LVCMOS33 } [get_ports b[0]]
#set_property -dict { PACKAGE_PIN V16  IOSTANDARD LVCMOS33 } [get_ports b[1]]
#set_property -dict { PACKAGE_PIN W16  IOSTANDARD LVCMOS33 } [get_ports b[2]]
#set_property -dict { PACKAGE_PIN W17  IOSTANDARD LVCMOS33 } [get_ports b[3]]
#set_property -dict { PACKAGE_PIN W15  IOSTANDARD LVCMOS33 } [get_ports b[4]]
#set_property -dict { PACKAGE_PIN V15  IOSTANDARD LVCMOS33 } [get_ports b[5]]
#set_property -dict { PACKAGE_PIN W14  IOSTANDARD LVCMOS33 } [get_ports b[6]]
#set_property -dict { PACKAGE_PIN W13  IOSTANDARD LVCMOS33 } [get_ports b[7]]

## Control signals
#set_property -dict { PACKAGE_PIN T17  IOSTANDARD LVCMOS33 } [get_ports Ctrl_Alu[0]]
#set_property -dict { PACKAGE_PIN U18  IOSTANDARD LVCMOS33 } [get_ports Ctrl_Alu[1]]
#set_property -dict { PACKAGE_PIN W19  IOSTANDARD LVCMOS33 } [get_ports Ctrl_Alu[2]]

## Outputs
#set_property -dict { PACKAGE_PIN U16  IOSTANDARD LVCMOS33 } [get_ports res[0]]
#set_property -dict { PACKAGE_PIN E19  IOSTANDARD LVCMOS33 } [get_ports res[1]]
#set_property -dict { PACKAGE_PIN U19  IOSTANDARD LVCMOS33 } [get_ports res[2]]
#set_property -dict { PACKAGE_PIN V19  IOSTANDARD LVCMOS33 } [get_ports res[3]]
#set_property -dict { PACKAGE_PIN W18  IOSTANDARD LVCMOS33 } [get_ports res[4]]
#set_property -dict { PACKAGE_PIN U15  IOSTANDARD LVCMOS33 } [get_ports res[5]]
#set_property -dict { PACKAGE_PIN U14  IOSTANDARD LVCMOS33 } [get_ports res[6]]
#set_property -dict { PACKAGE_PIN V14  IOSTANDARD LVCMOS33 } [get_ports res[7]]

#set_property -dict { PACKAGE_PIN N3  IOSTANDARD LVCMOS33 } [get_ports c]
#set_property -dict { PACKAGE_PIN P1  IOSTANDARD LVCMOS33 } [get_ports o]
#set_property -dict { PACKAGE_PIN L1  IOSTANDARD LVCMOS33 } [get_ports n]
