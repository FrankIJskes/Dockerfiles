docker build --label tcpdump -t tcpdump-ubuntu . 
docker rmi registry.beheer.tabsvm.local/tabsvm/tcpdump-ubuntu:latest
docker tag tcpdump-ubuntu registry.beheer.tabsvm.local/tabsvm/tcpdump-ubuntu:latest 
