MAINFILE = "gmail-check.pl"
FIRST_ICON = "gmail-check.png"
SECOND_ICON = "gmail-check-error.png"

all:
	echo Hi mom!

install:
	cp bin/$(MAINFILE) /usr/bin/$(MAINFILE)
	chmod 775 /usr/bin/$(MAINFILE)

	cp icons/$(FIRST_ICON) /usr/share/icons/$(FIRST_ICON)
	cp icons/$(SECOND_ICON) /usr/share/icons/$(SECOND_ICON)

clean:
	rm -f /usr/bin/$(MAINFILE)
	rm -r /usr/share/icons/$(FIRST_ICON)
	rm -r /usr/share/icons/$(SECOND_ICON)
