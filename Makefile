PREFIX = ~/.local/bin

all:
	@echo Run \'make install\' to install this program!.

install:
	@cp -p main.sh $(DESTDIR)$(PREFIX)/jdp
	@chmod 755 $(DESTDIR)$(PREFIX)/jdp
	@mkdir -p ~/.local/share/jdp
	@cp -p jdpkg.conf $(DESTDIR)$(PREFIX)


uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/jdp
