#!/usr/bin/env bash


# function to print the header
print_header() {
  ./nmap.py  # Assuming nmap.py prints the header information
}

# Custom function to clear the screen but keep the header
clear_screen() {
  clear
  print_header
}
# Main menu for IP and Domain name Scanning
main_menu() {
  clear
  echo "1. Scan with IP address"
  echo "2. Scan with domain name"
  echo "3. Back"
  read -p "Please choose an option: " opt4
  case $opt4 in
    1) read -p "Enter IP address: " ip; typescan ;; # perform typescan wih IP
    2) read -p "Enter Domain name: " dom; ip=$(dig +short $dom): typescan ;; # Perform typescan with domain
    3) actpas ;; # Return to actpas menu
    *) invalid_option "main_menu" ;; # Handle invalid option
  esac
}

# Menu For passive scanning options
main_menu2() {
  clear
  echo "1. Scan with IP address"
  echo "2. Scan with Domain name"
  echo "3. Back"
  read -p "Please choose an option: " opt4
  case $opt4 in
    1) read -p "Enter IP address: " ip; typescan2 ;;  # Perform typescan2 with IP
    2) read -p "Enter Domain name: " dom; ip=$(dig +short $dom); typescan2 ;;  # Perform typescan2 with IP
    3) actpas ;; # Return to actpas menu
    *) invalid_option "main_menu2" ;;  # Handle invalid option
  esac
}

# Function to perform typescan2 for passive scannin
typescan2() {
  clear
  echo "1. ICMP Scan"
  echo "2. ARP Scan"
  echo "3. TCP Ping Scan"
  echo "4. UDP Ping Scan"
  echo "5. Back"
  read -p "Please choose an option: " pick1
  case $pick1 in
    1) icmp_scan ;;
    2) arp_scan ;;
    3) typing_scan ;;
    4) uping_scan ;;
    5) main_menu2 ;;
    *) invalid_option "typescan2" ;;
  esac
}

# Function for iCMP Scan options
icmp_scan() {
  clear
  echo "1. ICMP Echo Request Scan"
  echo "2. ICMP Timestamp Request Scan"
  echo "3. ICMP Address Mask Request Scan"
  echo "4. Back"
  read -p "Please choose an option: " pick2
  case $pick2 in
    1) icmp1 ;;
    2) icmp2 ;;
    3) icmp3 ;;
    4) typescan2 ;; # Return to typescan2 menu
    *) invalid_option "icmp_scan" ;;
  esac
}

# Function for ICMP Echo Request Scan
icmp1() {
  clear
  echo "ICMP Echo Request Scan"
  run=$(nmap -PE -sn "$ip"); echo "$run"
  read -p "Press enter to continue..."
  main_menu2  # Return to main_menu2
}

# Function For ICMP Timestamp Request Scan
icmp2() {
  clear
  echo "iCMP Timestamp Request Scan"
  run=$(nmap -PP -sn "$ip"); echo "$run"
  read -p "press enter to continue..."
  main_menu2  # Return to main_menu2..."
}

# Function for ICMP Address Mask Request Scan
icmp3() {
  clear
  echo "ICMP Address Mask Request Scan"
  run=$(nmap -PM -sn "$ip"); echo "$run"
  read -p "Press enter to continue..."
  main_menu2  # Return to main_menu2
}

# Function for ARP Scan
arp_scan() {
  clear
  echo "ARP Scan"
  run= nmap -PR -sn $ip; echo "$run"
  read -p "Press enter to continue..."
  main_menu2  # Return to main_menu2
}

# Function for TCP Ping Scan options
typing_scan() {
  clear
  echo "1. TCP SYN Ping"
  echo "2. TCP ACK Ping"
  echo "3. Back"
  read -p "please choose an option: " pick3
  case $pick3 in
    1) typing1 ;;
    2) typing2 ;;
    3) typescan2 ;;  # Return to typescan2 menu
    *) invalid_option "typing_scan" ;;
  esac
}

# Function for TCP SYN Ping scan
typing1() {
  clear
  echo "TCP SYN PING"
  run=$(nmap -ps -sn "$ip"); echo "$run"
  read -p "press enter to continue..."
  main_menu2  # Return to main_menu2
}

# Function for TCP ACK Ping Scan
typing2() {
  clear
  echo "TCP ACK Ping"
  run=$(nmap -PA -sn "$ip"); echo "$run"
  read -p "press enter to continue..."
  main_menu2  # Return to main_menu2
}

# Function for UDP Ping SCAN
typing_scan() {
  clear
  echo "UDP Ping Scan"
  run=$(nmap -PU -sn "$ip"); echo "$run"
  read -p "Press enter to continue..."
  main_menu2  # Return to main_menu2
}

# Function to handle invalid options
invalid_option() {
  local caller_function=$1
  echo "invalid option. Please choose a valid option."
  sleep 2
  case $caller_function in
    "actpas") actpas ;;
    "typescan") typescan ;;
    "syn_scan") syn_scan ;;
    "tcp_scan") tcp_scan ;;
    "udp_scan") udp_scan ;;
    "main_menu") main_menu ;;
    "main_menu2") main_menu2 ;;
    "typescan2") typescan2 ;;
    "icmp_scan") icmp_scan ;;
    "typing_scan") typing_scan ;;
    *) echo "Error: Unknown function name in invalid_option." >&2; exit 1 ;;
  esac
}
# Function for Active and Passive Scanning options
actpas() {
  clear_screen
  echo "1. Port Scanning"
  echo "2. Host Discovery"
  echo "3. Exit"
  read -p "please select a type of scan: " opt1
  case $opt1 in
    1) main_menu ;;
    2) main_menu2 ;;
    3) exit ;;
    *) invalid_option "actpas" ;;
  esac
}

# Function to perform typescan
typescan() {
  clear
  echo "1. SYN Scan"
  echo "2. TCP Scan"
  echo "3. UDP Scan"
  echo "4. Back"
  read -p "Please choose an option: " opt2
  case $opt2 in
    1) syn_scan ;;
    2) tcp Scan ;;
    3) udp_scan ;;
    4) main_menu ;;
    *) invalid_option "typescan" ;;
  esac
}

# Function to perform SYN Scan
syn_scan() {
  clear
  echo "SYN Scan"
  read -p "would you like to include service and os detection (yes or no)?: " opt3
  case $opt3 in
    "yes") run=$(nmap -sS "$ip" -sV -O): echo "$run" ;;
    "no") run=$(nmap -sS "$ip"); echo "$run" ;;
    *) invalid_option "syn_scan" ;;
  esac
  read -p "Press enter to continue..."
  main_menu # Return to main menu
}

# Function to perform TCP Scan
tcp_scan() {
  clear
  echo "TCP Scan"
  read -p "would you like to include service and OS detection (yes or no)?: " opt4
  case $opt4 in
    "yes") run=$(nmap -sT "$ip" -sV -O); echo "$run" ;;
    "no") run=$(nmap -sT "$ip"); echo "$run" ;;
    *) invalid_option "tcp_scan" ;;
  esac
  read -p "Press enter to continue..."
  main_menu  # return to main menu
}

# Function to perform UDP Scan
udp_scan() {
  clear
  echo "UDP Scan"
  read -p "Would you like to include service and OS detection (yes or no)?: " opt5
  case $opt5 in
    "yes") run=$(nmap -sV "$ip" -sV -O); echo "$run" ;;
    "no") run=$(nmap -sV "$ip"); echo "$run" ;;
    *) invalid_option "udp_scan" ;;
  esac
  read -p "Press enter to continue..."
  main_menu # Return to mainmenu
}
# Initial call to actpas function to start the script
actpas

