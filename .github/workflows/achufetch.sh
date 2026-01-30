#!/bin/bash
clear 

# ===== Colors =====
BLUE="\e[38;5;39m"
CYAN="\e[38;5;51m"
ORANGE="\e[38;5;208m"
GREEN="\e[38;5;118m"
WHITE="\e[97m"
RESET="\e[0m"
GRAY="\e[90m"

# ===== System Info =====
USER_NAME=$(whoami)
HOST_NAME=$(hostname)
OS=$(uname -o 2>/dev/null)
KERNEL=$(uname -r)
UPTIME=$(uptime -p)
SHELL_NAME=$(basename "$SHELL")
CPU=$(lscpu | grep "Model name" | sed 's/Model name:[ ]*//')
MEMORY=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
DISK=$(df -h / | awk 'NR==2 {print $3 "/" $2}')

# ===== ASCII ART (LEFT SIDE) =====
ascii=$(cat << "EOF"
               unnuuunuuunnujujjuna           
            nuuuuuujjjujun    nnnnurjun           
         rjnnurrjunnuuuuunnn  n  nn  unu          
        ujnnnujajnjjjuuunnnjjnn        nn         
        nnunujjn rrjrjjarjruunnuun     nju        
       jurrjan  nujrj......aunnn   n   nju        
      ajrjuuunnnnuja..........ajn n   uun         
      nu.njjjunujj..............aun nnn           
       njjajuuujjr..........jjjjuuunuau           
       nnnnur.......................r..n          
          r............................r          
          .............................rn..       
          .............................j....      
          ..................................      
          .................................      
          ...............................                   
           ............................           
            ..........................            
             .........................            
              .......................             
               .....................              
                ...................               
                 ...............                  
                   .........                      
EOF
)

# ===== INFO PANEL (RIGHT SIDE) =====
# info=$(cat << EOF
# ${CYAN}${USER_NAME}@${HOST_NAME}${RESET}
# ${ORANGE}OS:${RESET}      $OS
# ${ORANGE}Kernel:${RESET}  $KERNEL
# ${ORANGE}Uptime:${RESET}  $UPTIME
# ${ORANGE}Shell:${RESET}   $SHELL_NAME
# ${ORANGE}CPU:${RESET}     $CPU
# ${ORANGE}Memory:${RESET}  $MEMORY
# ${ORANGE}Disk:${RESET}    $DISK
# EOF
# )

echo achufetch 
echo v1.2 2026

info=$(cat << EOF
    ${GRAY} _____________________ ${GREEN}[ArjunLiji@ARJC]${GRAY} _____________________

${GRAY} . ${ORANGE}Website${WHITE}:${GRAY} .................................... ${CYAN}www.arjc.me
${GRAY} . ${ORANGE}OS${WHITE}:${GRAY} ........ ${CYAN}Windows 10, ArchJun (Arch Linux), Android 16
${GRAY} . ${ORANGE}Uptime${WHITE}:${GRAY} ...................................... ${CYAN}226 Months
${GRAY} . ${ORANGE}IDE${WHITE}:${GRAY} .................................. ${CYAN}VS Code, GNU Nano
${GRAY} . ${ORANGE}Tech${WHITE}:${GRAY} ............................. ${CYAN}Front End Dev - React

${GRAY} . ${ORANGE}Location ${BLUE}~${WHITE}:${GRAY} ............................ ${CYAN}Kochi, Kerala IN 
${GRAY} . ${ORANGE}Location /${BLUE}uni${WHITE}:${GRAY} ...................... ${CYAN}Palakkad, Kerala IN 

${GRAY} . ${ORANGE}Languages${WHITE}.${ORANGE}programing${WHITE}:${GRAY} ............. ${CYAN}C, Python, Javascript
${GRAY} . ${ORANGE}Languages${WHITE}.${ORANGE}computer${WHITE}:${GRAY} ............ ${CYAN}MySQL, HTML5, CSS3, JSON
${GRAY} . ${ORANGE}Languages${WHITE}.${ORANGE}human${WHITE}:${GRAY} ............... ${CYAN}English, Malaylam, Hindi

 ${GRAY} . ${ORANGE}Hobbies${WHITE}:${GRAY} ....... ${CYAN}FL Studio, Minimal Interfaces, OS Ricing

${BLUE}CONTACT
${GRAY} . ${ORANGE}Email${WHITE}.${ORANGE}personal${WHITE}:${GRAY} ..................... ${CYAN}arjunliji@gmail.com
${GRAY} . ${ORANGE}Email${WHITE}.${ORANGE}professional${WHITE}:${GRAY} .................... ${CYAN}arjcwo@gmail.com
${GRAY} . ${ORANGE}Linkedin${WHITE}:${GRAY} ...................... ${CYAN}www.linkedin.com/in/arjc
${GRAY} . ${ORANGE}Github${WHITE}:${GRAY} ............................. ${CYAN}www.github.com/arjc

EOF
)

# ===== MERGE LEFT + RIGHT =====
paste <(echo "$ascii") <(echo "$info") | while IFS=$'\t' read -r left right; do
    printf "%-45s %b\n" "$left" "$right"
done
