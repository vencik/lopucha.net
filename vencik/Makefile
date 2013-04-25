all: CV.pdf

CV.pdf: CV.dvi
	dvipdf $^ $@

CV.dvi: CV.tex resume.cls
	latex $<


purge: clean
	rm -f CV.pdf

clean:
	rm -f CV.aux CV.dvi CV.log

install: all
	mkdir ${PACKAGE_ROOT}/vencik || true
	cp CV.pdf ${PACKAGE_ROOT}/vencik
	echo 'lcd vencik'   >> $(FTP_JOURNAL)
	echo 'mkdir vencik' >> $(FTP_JOURNAL)
	echo 'cd vencik'    >> $(FTP_JOURNAL)
	for f in CV.pdf; do \
	    echo "put $$f" >> $(FTP_JOURNAL); \
	done
	echo 'cd ..'  >> $(FTP_JOURNAL)
	echo 'lcd ..' >> $(FTP_JOURNAL)
