default: engineer.html warcaster.html

%.html: %.yaml c5e
	./c5e $<

upload:
	scp -P 9378 c5e engineer.??ml warcaster.??ml seebs@herd.plethora.net:~seebsnet/public_html/tmp/.
