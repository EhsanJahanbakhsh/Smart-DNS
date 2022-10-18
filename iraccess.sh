apt install ipset -y

try 
    ipset create iran hash:net
    
catch 
    echo "Error in $__EXCEPTION_SOURCE__ at line: $__EXCEPTION_LINE__!"




COUNTRIES=('ir')

ipset flush iran

for i in "${COUNTRIES[@]}"; do
    echo "Ban IP of country ${i}"

    for IP in $(wget --no-check-certificate -O - https://www.ipdeny.com/ipblocks/data/countries/${i}.zone)
    do
        ipset add iran $IP
    done
done

 iptables -I DOCKER-USER -i ens160 -m set ! --match-set iran src -j DROP

 iptables -I DOCKER-USER -i ens160 -m state --state ESTABLISHED,RELATED -j ACCEPT
