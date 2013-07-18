all: CV.pdf CV_CS.pdf

CV.pdf: CV.dvi
	dvipdf $^ $@

CV_CS.pdf: CV_CS.dvi
	dvipdf $^ $@

CV.dvi: CV.tex resume.cls
	latex $<

CV_CS.dvi: CV_CS.tex resume.cls
	latex $<


purge: clean
	rm -f CV.pdf CV_CS.pdf

clean:
	rm -f CV.aux CV.dvi CV.log CV_CS.aux CV_CS.dvi CV_CS.log

install: all
	mkdir ${PACKAGE_ROOT}/vencik || true
	cp CV.pdf CV_CS.pdf ${PACKAGE_ROOT}/vencik
	echo 'lcd vencik'   >> $(FTP_JOURNAL)
	echo 'mkdir vencik' >> $(FTP_JOURNAL)
	echo 'cd vencik'    >> $(FTP_JOURNAL)
	for f in CV.pdf CV_CS.pdf; do \
	    echo "put $$f" >> $(FTP_JOURNAL); \
	done
	echo 'cd ..'  >> $(FTP_JOURNAL)
	echo 'lcd ..' >> $(FTP_JOURNAL)
