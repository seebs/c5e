CLASSES = engineer warcaster

default: $(foreach x, $(CLASSES), $(x).html $(x).wiki)

%.html: %.yaml c5e
	./c5e -h $<

%.md: %.yaml c5e
	./c5e -m $<

%.wiki: %.md c5e
	pandoc -f markdown+pipe_tables -t mediawiki $< > $@

upload:
	scp -P 9378 c5e $(foreach ext, yaml html md wiki, $(foreach class, $(CLASSES), $(class).$(ext))) seebs@herd.plethora.net:~seebsnet/public_html/tmp/.
