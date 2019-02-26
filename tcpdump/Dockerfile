FROM ubuntu 
RUN apt-get update && apt-get install -y tcpdump 
RUN apt-get install -y inetutils-tools net-tools moreutils
CMD tcpdump -i ${IFACE} -w /tmp/tcpdump.pcap
