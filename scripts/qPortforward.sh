log_text=$(natpmpc -a 1 0 udp 60 -g 10.2.0.1)
mapped_port=$(echo "$log_text" | grep -oP 'Mapped public port \K[0-9]+')

# Store the port in a variable
public_port=$mapped_port


qbittorrent --torrenting-port=$public_port & 

while true; do
  date now
  natpmpc -a 1 0 udp 60 -g 10.2.0.1 && natpmpc -a 1 0 tcp 60 -g 10.2.0.1 || {
    echo -e "ERROR with natpmpc command \a"
    break
  }
  sleep 45
done
