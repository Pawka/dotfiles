
all: requirements rake conf.powerline

#
# Install required libs.
#
.PHONY: requirements
requirements:
	apt-get install xclip colordiff rake

.PHONY: rake
rake:
	rake install

.PHONY: gem
gem:
	sudo gem install tmuxinator

#
# Create symlink for powerline configs
#
.PHONY: conf.powerline
conf.powerline: powerline
	ln -s $(CURDIR)/config/powerline $(HOME)/.config/powerline

# Install powerline plugin.
# python, pip libs are required
#
powerline: powerlinse-source powerline-fonts

powerline-source:
	su -c 'pip install git+git://github.com/Lokaltog/powerline'

PowerlineSymbols.otf:
	wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf

10-powerline-symbols.conf:
	wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

powerline-fonts: PowerlineSymbols.otf 10-powerline-symbols.conf
	mv PowerlineSymbols.otf /usr/share/fonts/
	fc-cache -vf
	mv 10-powerline-symbols.conf /etc/fonts/conf.d/

#
# Uninstall stuff
#
.PHONY: uninstall
uninstall:
	rm $(HOME)/.config/powerline

