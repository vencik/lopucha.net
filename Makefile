subdirs = \
	vencik \
	Linux_on_Toshiba_Portege_Z30-A-12N

package_root = /var/tmp/lopucha.net
ftp_journal  = /var/tmp/lopucha.net.ftp
ftp_host     = lopucha.net
ftp_username = vackrp


all: index.txt
	asciidoc -s $<
	for d in $(subdirs); do $(MAKE) -C $$d; done

clean:
	for d in $(subdirs); do $(MAKE) -C $$d clean; done

purge: clean
	rm -rf *.html $(package_root) $(ftp_journal)
	for d in $(subdirs); do $(MAKE) -C $$d purge; done

install: all
	rm -rf $(package_root) $(ftp_journal)
	mkdir $(package_root)
	cp index.html $(package_root)
	echo "lcd $(package_root)" >  $(ftp_journal)
	echo 'cd lopucha.net'      >> $(ftp_journal)
	for f in *.html; do \
	    echo "put $$f" >> $(ftp_journal); \
	done
	for d in $(subdirs); do \
	    PACKAGE_ROOT="$(package_root)" \
	    FTP_JOURNAL="$(ftp_journal)" \
	    $(MAKE) -C $$d install; \
	done
	echo 'bye' >> $(ftp_journal)
	./ftp.sh --host $(ftp_host) --user $(ftp_username) $(ftp_journal)
	rm -rf $(package_root) $(ftp_journal)
