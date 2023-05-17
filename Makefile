PREFIX = ~/.local/bin

all:
	@echo Run \'make install\' to install this program!.

install:
	@cp -p main.sh $(DESTDIR)$(PREFIX)/jdpkg
	@chmod 755 $(DESTDIR)$(PREFIX)/jdpkg
	@mkdir -p ~/.local/share/jdpkg/
	@cp -p jdpkg.conf $(DESTDIR)$(PREFIX)


uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/jdpkg
