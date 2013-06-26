MAINFILE = "gmail-check.pl"

FIRST_ICON = "gmail-check.png"
SECOND_ICON = "gmail-check-error.png"
THIRD_ICON = "gmail-check-warning.png"

FIRST_SOUND = "found.mp3"
SECOND_SOUND = "error.mp3"

MAINDIR = "/usr/local/gcheck"

all:
	echo Hi mom!

install:
	mkdir $(MAINDIR) $(MAINDIR)/icons $(MAINDIR)/sounds

	cp bin/$(MAINFILE) /usr/bin/$(MAINFILE)
	chmod 775 /usr/bin/$(MAINFILE)

	cp icons/$(FIRST_ICON) $(MAINDIR)/icons/$(FIRST_ICON)
	cp icons/$(SECOND_ICON) $(MAINDIR)/icons/$(SECOND_ICON)
	cp icons/$(THIRD_ICON) $(MAINDIR)/icons/$(THIRD_ICON)

	cp sounds/$(FIRST_SOUND) $(MAINDIR)/sounds/$(FIRST_SOUND)
	cp sounds/$(SECOND_SOUND) $(MAINDIR)/sounds/$(SECOND_SOUND)

clean:
	rm -f /usr/bin/$(MAINFILE)
	rm -rf $(MAINDIR)
