#!/bin/sh

install -m 0755 ./v2rayn-service ~/.local/bin/
install -m 0644 ./v2rayN.service ~/.config/systemd/user/
if [ -f /usr/share/applications/v2rayn.desktop ]; then
    cp /usr/share/applications/v2rayn.desktop ~/.local/share/applications/v2rayn.desktop
    printf '\nNoDisplay=true\n' >> ~/.local/share/applications/v2rayn.desktop

    cat >~/.local/share/applications/v2rayn-service.desktop <<EOF
[Desktop Entry]
Type=Application
Name=v2rayN
Name[ru]=v2rayN
Exec=v2rayn-service
Icon=v2rayn
Terminal=false
Categories=Network;
Actions=stop;

[Desktop Action stop]
Exec=v2rayn-service stop
Name=Stop
Name[ru]=Остановить
EOF

fi

# vim:ff=unix
