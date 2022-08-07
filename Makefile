DL ?= curl -Lsf --compressed
PORT ?= 2303

.PHONY: mostlyclean clean it_so

vorestation.dmb: vorestation.dme
	DreamMaker -verbose -max_errors 0 '$<' \
		| stdbuf -o0 grep -v '^including ' \
		| pv -pfeEts 640

it_so: vorestation.dmb
	DreamDaemon '$<' '$(PORT)' -close -map-threads on -threads on -trusted -verbose

librust_g.so:
	$(DL) 'https://github.com/tgstation/rust-g/releases/download/0.4.6/$@' > '$@'

mostlyclean:
	$(RM) vorestation.dmb

clean: mostlyclean
	$(RM) librust_g.so


