#!/bin/bash
anydeskuserconf=~/.anydesk/user.conf

# make a backup before any modification
cp $anydeskuserconf "$anydeskuserconf"-backup

cleanline () {
    text=$1
    echo 'cleaning line: ' $text
    sed -i "s/$text.*/$text/g" $anydeskuserconf
}

removeunnamedhosts () {
    SAVEDHOSTS=`cat $anydeskuserconf | grep 'ad.roster.items=' | sed 's/ad.roster.items\=//g' | sed 's/\;/;\n/g' | grep -e '.*,.*,[a-zA-Z]' | sed ':a;N;$!ba;s/\n//g'`
    sed -i '/ad.roster.items=;*/ad.roster.items=$SAVEDHOSTS' $anydeskuserconf 

}

cleanline "ad.session.audio.playback="
cleanline "ad.session.follow_remote_cursor="
cleanline "ad.session.follow_remote_focus="
cleanline "ad.session.privacy_feature="
cleanline "ad.session.quality_adaptive="
cleanline "ad.session.quality_preset="
cleanline "ad.session.show_keyboard="
cleanline "ad.session.show_remote_cursor="
cleanline "ad.session.suppress_keys="
cleanline "ad.session.sync_clipbrd="
cleanline "ad.session.touch_mode="
cleanline "ad.session.viewmode="
echo ""



echo "your backup file is avaliable on $anydeskuserconf.backup"
