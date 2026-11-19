.PHONY: all clean

all: GeoCN.txt

dedup: dedup.c

GeoCN.txt: dedup
	curl -L -o ipip.txt "https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt"
	curl -L -o chunzhen.txt "https://raw.githubusercontent.com/metowolf/iplist/master/data/country/CN.txt"
	cat ipip.txt chunzhen.txt | ./dedup > GeoCN.txt
	rm -f ipip.txt chunzhen.txt

clean:
	rm -f dedup *.txt
