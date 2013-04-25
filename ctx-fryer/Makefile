revnumber = 1.0.1
revdate   = $(shell date "+%d %B %Y")


all: index.txt
	asciidoc -a revdate="$(revdate)" -a revnumber="$(revnumber)" $<

clean:

purge: clean
	rm -rf *.html

install: all
	mkdir ${PACKAGE_ROOT}/ctx-fryer || true
	cp *.html ${PACKAGE_ROOT}/ctx-fryer
	echo 'lcd ctx-fryer'   >> $(FTP_JOURNAL)
	echo 'mkdir ctx-fryer' >> $(FTP_JOURNAL)
	echo 'cd ctx-fryer'    >> $(FTP_JOURNAL)
	for f in *.html; do \
	    echo "put $$f" >> $(FTP_JOURNAL); \
	done
	echo 'cd ..'  >> $(FTP_JOURNAL)
	echo 'lcd ..' >> $(FTP_JOURNAL)
