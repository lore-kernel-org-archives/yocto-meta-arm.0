Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12030.1614603898221218635
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Mar 2021 05:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73DEC1FB;
	Mon,  1 Mar 2021 05:04:56 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.46.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF0843F70D;
	Mon,  1 Mar 2021 05:04:55 -0800 (PST)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-autonomy/xenguest: Fix issues raised by shellcheck
Date: Mon,  1 Mar 2021 13:04:51 +0000
Message-Id: <20210301130451.1518834-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

Ignore issues in xenguest-manager and xenguest-mkimage as these
will soon be rewritten.

Issue-Id: SCM-1526
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I733b4bfaaa5002f7a64c577e16548af62c425ebf
---
 .../xenguest/files/kea-restore-default-config |  2 +-
 .../xenguest/files/network-bridge.sh.in       |  4 ++--
 .../xenguest/files/xenguest-init              | 22 +++++++++----------
 .../xenguest/files/xenguest-network-bridge.in |  2 +-
 .../files/xenguest-network-init-post.sh       | 11 +++++-----
 5 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restor=
e-default-config b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-=
restore-default-config
index 424fd0a..9776ddf 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-defau=
lt-config
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-defau=
lt-config
@@ -22,7 +22,7 @@ case "$1" in
   *)
         # do not advertise unreasonable commands that there is no reason
         # to use with this device
-        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
+        echo "Usage: $0 {start|stop|status|restart|force-reload}"
         exit 1
 esac
=20
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-br=
idge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-br=
idge.sh.in
index 3f87b76..e697f7e 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh=
.in
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh=
.in
@@ -10,11 +10,11 @@ BRIDGE_NAME=3D"###BRIDGE_NAME###"
=20
 case "${XENGUEST_NETWORK_TYPE:=3D}" in
     nat)
-        echo "vif =3D ['script=3Dvif-nat']" >> ${guestcfgfile}
+        echo "vif =3D ['script=3Dvif-nat']" >> "${guestcfgfile:?}"
         log info "Network type is NAT"
         ;;
     bridge)
-        echo "vif =3D ['script=3Dvif-bridge,bridge=3D${BRIDGE_NAME}']" >=
> ${guestcfgfile}
+        echo "vif =3D ['script=3Dvif-bridge,bridge=3D${BRIDGE_NAME}']" >=
> "${guestcfgfile:?}"
         log info "Network type is bridge: ${BRIDGE_NAME}"
         ;;
     *)
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-i=
nit b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
index c6b0c83..5862cb9 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
@@ -25,19 +25,19 @@ case "$1" in
         echo "Starting xenguest"
=20
         # Create unconfigured guests
-        if [ -d ${XENGUEST_GUEST_DIR} ]; then
-            for f in $(find ${XENGUEST_GUEST_DIR} -name "*.xenguest" \
-                -exec basename {} .xenguest \;); do
-                if [ ! -f ${XENGUEST_CONF_BASE}/guests/${f}/guest.cfg ];=
 then
+        if [ -d "${XENGUEST_GUEST_DIR}" ]; then
+            shopt -s nullglob
+            for path in "${XENGUEST_GUEST_DIR}"/*.xenguest; do
+                f=3D$(basename "${path}" .xenguest)
+                if [ ! -f "${XENGUEST_CONF_BASE}/guests/${f}/guest.cfg" =
]; then
                     # Check if this guest should be auto booted
                     autoboot=3D$(/usr/bin/xenguest-mkimage dump-paramsco=
nfig \
-                        ${XENGUEST_GUEST_DIR}/${f}.xenguest | \
+                        "${path}" | \
                         grep GUEST_AUTOBOOT | sed -e "s,.*=3D,," | tr -d=
 '"')
                     if [ "$autoboot" =3D "0" ]; then
                         echo "Do not create $f, autoboot disabled"
                     else
-                        /usr/bin/xenguest-manager create \
-                            ${XENGUEST_GUEST_DIR}/${f}.xenguest
+                        /usr/bin/xenguest-manager create "${path}"
                         # Update guestlist
                         if [ $? -eq 0 ]; then
                             guestlist=3D"${guestlist} ${f}"
@@ -49,11 +49,11 @@ case "$1" in
         if [ -n "${guestlist}" ]; then
             for f in ${guestlist}; do
                 GUEST_AUTOBOOT=3D"1"
-                if [ -f ${XENGUEST_CONF_BASE}/guests/${f}/params.cfg ]; =
then
-                    source ${XENGUEST_CONF_BASE}/guests/${f}/params.cfg
+                if [ -f "${XENGUEST_CONF_BASE}/guests/${f}/params.cfg" ]=
; then
+                    source "${XENGUEST_CONF_BASE}/guests/${f}/params.cfg=
"
                 fi
                 if [ "${GUEST_AUTOBOOT}" =3D "1" ]; then
-                    /usr/bin/xenguest-manager start ${f}
+                    /usr/bin/xenguest-manager start "${f}"
                 fi
             done
         else
@@ -68,7 +68,7 @@ case "$1" in
         # update guest list
         guestlist=3D$(xenguest-manager status | grep Running | cut -d ":=
" -f1)
         for f in ${guestlist}; do
-            xenguest-manager shutdown ${f} --kill
+            xenguest-manager shutdown "${f}" --kill
         done
         ;;
   reload)
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-n=
etwork-bridge.in b/meta-arm-autonomy/recipes-extended/xenguest/files/xeng=
uest-network-bridge.in
index 2278b80..54b5a2f 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-=
bridge.in
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-=
bridge.in
@@ -36,7 +36,7 @@ case "$1" in
   *)
         # do not advertise unreasonable commands that there is no reason
         # to use with this device
-        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
+        echo "Usage: $0 {start|stop|status|restart|force-reload}"
         exit 1
 esac
=20
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-n=
etwork-init-post.sh b/meta-arm-autonomy/recipes-extended/xenguest/files/x=
enguest-network-init-post.sh
index ce5e6de..b63c6a2 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-=
init-post.sh
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-=
init-post.sh
@@ -11,19 +11,20 @@ set +u
 #
=20
 check_if_vif_is_ready() {
-    ret=3D($(xl network-list "${guestname}" | grep  "${1}"))
-    # ${ret[4]} is network interface status value
+    ret=3D$(xl network-list "${guestname:?}" | grep  "${1}" \
+        | tr -s ' ' | cut -d' ' -f5)
+    # ${ret} is network interface status value
     # 1 means vif is not ready
     # 4 means vif is ready
-    [ "${ret[4]}" =3D "4" ] && return 0
+    [ "${ret}" =3D "4" ] && return 0
     return 1
 }
=20
 case "${XENGUEST_NETWORK_TYPE:-}" in
     nat)
-        vif_name=3D"$(xl network-list ${guestname} | grep -o vif.*)"
+        vif_name=3D"$(xl network-list "${guestname:?}" | grep -o "vif.*"=
)"
=20
-        for try in {1..20}
+        for try in $(seq 20)
         do
             if check_if_vif_is_ready "${vif_name}"; then
                 claim_lock "vif-nat-kea"
--=20
2.25.1

