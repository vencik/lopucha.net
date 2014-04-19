all: index.txt
	asciidoc $<

clean:

purge: clean
	rm -rf *.html

install: all
	mkdir ${PACKAGE_ROOT}/Linux_on_Toshiba_Portege_Z30-A-12N || true
	cp index.html ${PACKAGE_ROOT}/Linux_on_Toshiba_Portege_Z30-A-12N
	echo 'lcd Linux_on_Toshiba_Portege_Z30-A-12N'   >> $(FTP_JOURNAL)
	echo 'mkdir Linux_on_Toshiba_Portege_Z30-A-12N' >> $(FTP_JOURNAL)
	echo 'cd Linux_on_Toshiba_Portege_Z30-A-12N'    >> $(FTP_JOURNAL)
	for f in index.html; do \
	    echo "put $$f" >> $(FTP_JOURNAL); \
	done
	echo 'cd ..'  >> $(FTP_JOURNAL)
	echo 'lcd ..' >> $(FTP_JOURNAL)
