Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5ACC001DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 12:25:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6842.1689596710673559126
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 05:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CD1AD75
	for <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 05:25:53 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B51E3F67D
	for <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 05:25:09 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/optee: update to 3.22.0
Date: Sun, 16 Jul 2023 08:55:40 -0500
Message-Id: <20230716135540.3538990-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230716135540.3538990-1-jon.mason@arm.com>
References: <20230716135540.3538990-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 12:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4879

Update to the latest version of OP-TEE, and move the legacy versions
that are still in use by meta-arm-bsp to that directory

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-client/tee-supplicant.service |  10 +
 .../optee/optee-client/tee-supplicant.sh      |  46 ++++
 .../optee/optee-client_3.18.0.bb              |   2 +-
 .../optee/optee-client_3.20.0.bb              |   2 +-
 .../optee/optee-examples_3.18.0.bb            |   2 +-
 .../optee/optee-examples_3.20.0.bb            |   2 +-
 ...ow-setting-sysroot-for-libgcc-lookup.patch |   0
 .../0002-optee-enable-clang-support.patch     |   0
 ...3-core-link-add-no-warn-rwx-segments.patch |   0
 ...-Define-section-attributes-for-clang.patch |   0
 ...0005-core-ldelf-link-add-z-execstack.patch |   0
 ...ibutee-ta-add-.note.GNU-stack-sectio.patch |   0
 ...ow-setting-sysroot-for-libgcc-lookup.patch |   0
 .../0002-optee-enable-clang-support.patch     |   0
 ...3-core-link-add-no-warn-rwx-segments.patch |   0
 ...-Define-section-attributes-for-clang.patch |   0
 ...-core-arm-S-EL1-SPMC-boot-ABI-update.patch |   0
 ...-core-ffa-add-TOS_FW_CONFIG-handling.patch |   0
 ...re-spmc-handle-non-secure-interrupts.patch |   0
 ...ure-SP-s-NS-interrupt-action-based-o.patch |   0
 .../optee/optee-os-tadevkit_3.18.0.bb         |   0
 .../optee/optee-os-tadevkit_3.20.0.bb         |   0
 .../optee/optee-os-ts-3.18.inc                |   0
 .../recipes-security/optee/optee-os_3.18.0.bb |   2 +-
 .../recipes-security/optee/optee-os_3.20.0.bb |   2 +-
 ...pdate-arm_ffa_user-driver-dependency.patch |  39 +++
 ..._ffa_user-driver-compatibility-check.patch | 163 ++++++++++++
 .../optee/optee-test/musl-workaround.patch    |  24 ++
 .../optee/optee-test/run-ptest                |  52 ++++
 .../optee/optee-test_3.18.0.bb                |   2 +-
 .../optee/optee-test_3.20.0.bb                |   2 +-
 meta-arm/conf/machine/qemuarm-secureboot.conf |   3 -
 .../optee/optee-client_3.22.0.bb              |   7 +
 .../optee/optee-examples_3.22.0.bb            |   3 +
 ...ow-setting-sysroot-for-libgcc-lookup.patch |  35 +++
 ...-Define-section-attributes-for-clang.patch | 240 ++++++++++++++++++
 .../0002-optee-enable-clang-support.patch     |  30 +++
 ...3-core-link-add-no-warn-rwx-segments.patch |  63 +++++
 .../optee/optee-os-tadevkit_3.22.0.bb         |  24 ++
 .../optee/optee-os_3.1%.bbappend              |   5 -
 .../recipes-security/optee/optee-os_3.22.0.bb |  10 +
 .../optee/optee-test_3.22.0.bb                |  10 +
 42 files changed, 764 insertions(+), 16 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-client/tee-=
supplicant.service
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-client/tee-=
supplicant.sh
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-client_=
3.18.0.bb (52%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-client_=
3.20.0.bb (73%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-example=
s_3.18.0.bb (51%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-example=
s_3.20.0.bb (51%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.18=
.0/0001-allow-setting-sysroot-for-libgcc-lookup.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.18=
.0/0002-optee-enable-clang-support.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.18=
.0/0003-core-link-add-no-warn-rwx-segments.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.18=
.0/0004-core-Define-section-attributes-for-clang.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.18=
.0/0005-core-ldelf-link-add-z-execstack.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.18=
.0/0006-arm32-libutils-libutee-ta-add-.note.GNU-stack-sectio.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.20=
.0/0001-allow-setting-sysroot-for-libgcc-lookup.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.20=
.0/0002-optee-enable-clang-support.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.20=
.0/0003-core-link-add-no-warn-rwx-segments.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.20=
.0/0004-core-Define-section-attributes-for-clang.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.20=
.0/0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.20=
.0/0006-core-ffa-add-TOS_FW_CONFIG-handling.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.20=
.0/0007-core-spmc-handle-non-secure-interrupts.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-3.20=
.0/0008-core-spmc-configure-SP-s-NS-interrupt-action-based-o.patch (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-tade=
vkit_3.18.0.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-tade=
vkit_3.20.0.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os-ts-3=
.18.inc (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os_3.18=
.0.bb (88%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os_3.20=
.0.bb (91%)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test/Update=
-arm_ffa_user-driver-dependency.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test/ffa_sp=
mc-Add-arm_ffa_user-driver-compatibility-check.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test/musl-w=
orkaround.patch
 create mode 100755 meta-arm-bsp/recipes-security/optee/optee-test/run-pt=
est
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-test_3.=
18.0.bb (86%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-test_3.=
20.0.bb (89%)
 create mode 100644 meta-arm/recipes-security/optee/optee-client_3.22.0.b=
b
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.22.0=
.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.22.0/0001-=
allow-setting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.22.0/0001-=
core-Define-section-attributes-for-clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.22.0/0002-=
optee-enable-clang-support.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.22.0/0003-=
core-link-add-no-warn-rwx-segments.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.2=
2.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_3.1%.bbappen=
d
 create mode 100644 meta-arm/recipes-security/optee/optee-os_3.22.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_3.22.0.bb

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplic=
ant.service b/meta-arm-bsp/recipes-security/optee/optee-client/tee-suppli=
cant.service
new file mode 100644
index 00000000..c273832d
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.ser=
vice
@@ -0,0 +1,10 @@
+[Unit]
+Description=3DTEE Supplicant
+
+[Service]
+User=3Droot
+EnvironmentFile=3D-@sysconfdir@/default/tee-supplicant
+ExecStart=3D@sbindir@/tee-supplicant $OPTARGS
+
+[Install]
+WantedBy=3Dbasic.target
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplic=
ant.sh b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.=
sh
new file mode 100644
index 00000000..b4d21950
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.sh
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+# Source function library
+. /etc/init.d/functions
+
+NAME=3Dtee-supplicant
+PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
+DESC=3D"OP-TEE Supplicant"
+
+DAEMON=3D@sbindir@/$NAME
+
+test -f $DAEMON || exit 0
+
+test -f @sysconfdir@/default/$NAME && . @sysconfdir@/default/$NAME
+test -f @sysconfdir@/default/rcS && . @sysconfdir@/default/rcS
+
+SSD_OPTIONS=3D"--oknodo --quiet --exec $DAEMON -- -d $OPTARGS"
+
+set -e
+
+case $1 in
+    start)
+	    echo -n "Starting $DESC: "
+	    start-stop-daemon --start $SSD_OPTIONS
+        echo "${DAEMON##*/}."
+        ;;
+    stop)
+	    echo -n "Stopping $DESC: "
+	    start-stop-daemon --stop $SSD_OPTIONS
+        echo "${DAEMON##*/}."
+        ;;
+    restart|force-reload)
+	    $0 stop
+	    sleep 1
+	    $0 start
+        ;;
+    status)
+        status ${DAEMON} || exit $?
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|force-reload|status}" >&2
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-arm/recipes-security/optee/optee-client_3.18.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-client_3.18.0.bb
similarity index 52%
rename from meta-arm/recipes-security/optee/optee-client_3.18.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-client_3.18.0.bb
index 0c831db2..ea7b65ce 100644
--- a/meta-arm/recipes-security/optee/optee-client_3.18.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-client_3.18.0.bb
@@ -1,3 +1,3 @@
-require optee-client.inc
+require recipes-security/optee/optee-client.inc
=20
 SRCREV =3D "e7cba71cc6e2ecd02f412c7e9ee104f0a5dffc6f"
diff --git a/meta-arm/recipes-security/optee/optee-client_3.20.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-client_3.20.0.bb
similarity index 73%
rename from meta-arm/recipes-security/optee/optee-client_3.20.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-client_3.20.0.bb
index 1e69136e..3daab7f8 100644
--- a/meta-arm/recipes-security/optee/optee-client_3.20.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-client_3.20.0.bb
@@ -1,4 +1,4 @@
-require optee-client.inc
+require recipes-security/optee/optee-client.inc
=20
 SRCREV =3D "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
=20
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.18.0.bb b/m=
eta-arm-bsp/recipes-security/optee/optee-examples_3.18.0.bb
similarity index 51%
rename from meta-arm/recipes-security/optee/optee-examples_3.18.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-examples_3.18.0.bb
index 8118feea..7796430c 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.18.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-examples_3.18.0.bb
@@ -1,3 +1,3 @@
-require optee-examples.inc
+require recipes-security/optee/optee-examples.inc
=20
 SRCREV =3D "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.20.0.bb b/m=
eta-arm-bsp/recipes-security/optee/optee-examples_3.20.0.bb
similarity index 51%
rename from meta-arm/recipes-security/optee/optee-examples_3.20.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-examples_3.20.0.bb
index e424d70e..4a63f951 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.20.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-examples_3.20.0.bb
@@ -1,3 +1,3 @@
-require optee-examples.inc
+require recipes-security/optee/optee-examples.inc
=20
 SRCREV =3D "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0001-allow-s=
etting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-security/op=
tee/optee-os-3.18.0/0001-allow-setting-sysroot-for-libgcc-lookup.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0001-allow-se=
tting-sysroot-for-libgcc-lookup.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0001-allow-=
setting-sysroot-for-libgcc-lookup.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0002-optee-e=
nable-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee-os-=
3.18.0/0002-optee-enable-clang-support.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0002-optee-en=
able-clang-support.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0002-optee-=
enable-clang-support.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0003-core-li=
nk-add-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/optee/o=
ptee-os-3.18.0/0003-core-link-add-no-warn-rwx-segments.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0003-core-lin=
k-add-no-warn-rwx-segments.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0003-core-l=
ink-add-no-warn-rwx-segments.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0004-core-De=
fine-section-attributes-for-clang.patch b/meta-arm-bsp/recipes-security/o=
ptee/optee-os-3.18.0/0004-core-Define-section-attributes-for-clang.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0004-core-Def=
ine-section-attributes-for-clang.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0004-core-D=
efine-section-attributes-for-clang.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0005-core-ld=
elf-link-add-z-execstack.patch b/meta-arm-bsp/recipes-security/optee/opte=
e-os-3.18.0/0005-core-ldelf-link-add-z-execstack.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0005-core-lde=
lf-link-add-z-execstack.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0005-core-l=
delf-link-add-z-execstack.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0006-arm32-l=
ibutils-libutee-ta-add-.note.GNU-stack-sectio.patch b/meta-arm-bsp/recipe=
s-security/optee/optee-os-3.18.0/0006-arm32-libutils-libutee-ta-add-.note=
.GNU-stack-sectio.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0006-arm32-li=
butils-libutee-ta-add-.note.GNU-stack-sectio.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0006-arm32-=
libutils-libutee-ta-add-.note.GNU-stack-sectio.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0001-allow-s=
etting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-security/op=
tee/optee-os-3.20.0/0001-allow-setting-sysroot-for-libgcc-lookup.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.20.0/0001-allow-se=
tting-sysroot-for-libgcc-lookup.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0001-allow-=
setting-sysroot-for-libgcc-lookup.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0002-optee-e=
nable-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee-os-=
3.20.0/0002-optee-enable-clang-support.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.20.0/0002-optee-en=
able-clang-support.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0002-optee-=
enable-clang-support.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0003-core-li=
nk-add-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/optee/o=
ptee-os-3.20.0/0003-core-link-add-no-warn-rwx-segments.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.20.0/0003-core-lin=
k-add-no-warn-rwx-segments.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0003-core-l=
ink-add-no-warn-rwx-segments.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0004-core-De=
fine-section-attributes-for-clang.patch b/meta-arm-bsp/recipes-security/o=
ptee/optee-os-3.20.0/0004-core-Define-section-attributes-for-clang.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.20.0/0004-core-Def=
ine-section-attributes-for-clang.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0004-core-D=
efine-section-attributes-for-clang.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0005-core-ar=
m-S-EL1-SPMC-boot-ABI-update.patch b/meta-arm-bsp/recipes-security/optee/=
optee-os-3.20.0/0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.20.0/0005-core-arm=
-S-EL1-SPMC-boot-ABI-update.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0005-core-a=
rm-S-EL1-SPMC-boot-ABI-update.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0006-core-ff=
a-add-TOS_FW_CONFIG-handling.patch b/meta-arm-bsp/recipes-security/optee/=
optee-os-3.20.0/0006-core-ffa-add-TOS_FW_CONFIG-handling.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.20.0/0006-core-ffa=
-add-TOS_FW_CONFIG-handling.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0006-core-f=
fa-add-TOS_FW_CONFIG-handling.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0007-core-sp=
mc-handle-non-secure-interrupts.patch b/meta-arm-bsp/recipes-security/opt=
ee/optee-os-3.20.0/0007-core-spmc-handle-non-secure-interrupts.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.20.0/0007-core-spm=
c-handle-non-secure-interrupts.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0007-core-s=
pmc-handle-non-secure-interrupts.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0008-core-sp=
mc-configure-SP-s-NS-interrupt-action-based-o.patch b/meta-arm-bsp/recipe=
s-security/optee/optee-os-3.20.0/0008-core-spmc-configure-SP-s-NS-interru=
pt-action-based-o.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.20.0/0008-core-spm=
c-configure-SP-s-NS-interrupt-action-based-o.patch
rename to meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0008-core-s=
pmc-configure-SP-s-NS-interrupt-action-based-o.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.18.0.bb =
b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb =
b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os-ts-3.18.inc b/meta-=
arm-bsp/recipes-security/optee/optee-os-ts-3.18.inc
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-ts-3.18.inc
rename to meta-arm-bsp/recipes-security/optee/optee-os-ts-3.18.inc
diff --git a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb b/meta-ar=
m-bsp/recipes-security/optee/optee-os_3.18.0.bb
similarity index 88%
rename from meta-arm/recipes-security/optee/optee-os_3.18.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bb
index 7a54dca5..17f2e795 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bb
@@ -1,4 +1,4 @@
-require optee-os.inc
+require recipes-security/optee/optee-os.inc
=20
 DEPENDS +=3D "dtc-native"
=20
diff --git a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb b/meta-ar=
m-bsp/recipes-security/optee/optee-os_3.20.0.bb
similarity index 91%
rename from meta-arm/recipes-security/optee/optee-os_3.20.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb
index b37590bc..590d1327 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb
@@ -1,4 +1,4 @@
-require optee-os.inc
+require recipes-security/optee/optee-os.inc
=20
 DEPENDS +=3D "dtc-native"
=20
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test/Update-arm_ff=
a_user-driver-dependency.patch b/meta-arm-bsp/recipes-security/optee/opte=
e-test/Update-arm_ffa_user-driver-dependency.patch
new file mode 100644
index 00000000..e889f740
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test/Update-arm_ffa_user-=
driver-dependency.patch
@@ -0,0 +1,39 @@
+From 7e15470f3dd45c844f0e0901f0c85c46a0882b8b Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Fri, 3 Mar 2023 12:23:45 +0100
+Subject: [PATCH 1/2] Update arm_ffa_user driver dependency
+
+Updating arm-ffa-user to v5.0.1 to get the following changes:
+ - move to 64 bit direct messages
+ - add Linux Kernel v6.1 compatibility
+The motivation is to update x-test to depend on the same driver
+version as TS uefi-test and thus to enable running these in a single
+configuration.
+Note: arm_ffa_user.h was copied from:
+ - URL:https://git.gitlab.arm.com/linux-arm/linux-trusted-services.git
+ - SHA:18e3be71f65a405dfb5d97603ae71b3c11759861
+
+Upstream-Status: Backport
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ host/xtest/include/uapi/linux/arm_ffa_user.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host/xtest/include/uapi/linux/arm_ffa_user.h b/host/xtest/i=
nclude/uapi/linux/arm_ffa_user.h
+index 9ef0be3..0acde4f 100644
+--- a/host/xtest/include/uapi/linux/arm_ffa_user.h
++++ b/host/xtest/include/uapi/linux/arm_ffa_user.h
+@@ -33,7 +33,7 @@ struct ffa_ioctl_ep_desc {
+  * @dst_id:	[in] 16-bit ID of destination endpoint.
+  */
+ struct ffa_ioctl_msg_args {
+-	__u32 args[5];
++	__u64 args[5];
+ 	__u16 dst_id;
+ };
+ #define FFA_IOC_MSG_SEND	_IOWR(FFA_IOC_MAGIC, FFA_IOC_BASE + 1, \
+--=20
+2.39.1.windows.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test/ffa_spmc-Add-=
arm_ffa_user-driver-compatibility-check.patch b/meta-arm-bsp/recipes-secu=
rity/optee/optee-test/ffa_spmc-Add-arm_ffa_user-driver-compatibility-chec=
k.patch
new file mode 100644
index 00000000..d333e860
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test/ffa_spmc-Add-arm_ffa=
_user-driver-compatibility-check.patch
@@ -0,0 +1,163 @@
+From 6734d14cc249af37705129de7874533df9535cd3 Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Fri, 3 Mar 2023 12:25:58 +0100
+Subject: [PATCH 2/2] ffa_spmc: Add arm_ffa_user driver compatibility che=
ck
+
+Check the version of the arm_ffa_user Kernel Driver and fail with a
+meaningful message if incompatible driver is detected.
+
+Upstream-Status: Backport
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ host/xtest/ffa_spmc_1000.c | 68 ++++++++++++++++++++++++++++++++++----
+ 1 file changed, 61 insertions(+), 7 deletions(-)
+
+diff --git a/host/xtest/ffa_spmc_1000.c b/host/xtest/ffa_spmc_1000.c
+index 15f4a46..1839d03 100644
+--- a/host/xtest/ffa_spmc_1000.c
++++ b/host/xtest/ffa_spmc_1000.c
+@@ -1,11 +1,12 @@
+ // SPDX-License-Identifier: BSD-3-Clause
+ /*
+- * Copyright (c) 2022, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2022-2023, Arm Limited and Contributors. All rights re=
served.
+  */
+ #include <fcntl.h>
+ #include <ffa.h>
+ #include <stdio.h>
+ #include <string.h>
++#include <errno.h>
+ #include <sys/ioctl.h>
+ #include <unistd.h>
+ #include "include/uapi/linux/arm_ffa_user.h"
+@@ -17,6 +18,10 @@
+ #define INCORRECT_ENDPOINT_ID 0xffff
+ #define NORMAL_WORLD_ENDPOINT_ID	0
+=20
++#define FFA_USER_REQ_VER_MAJOR 5
++#define FFA_USER_REQ_VER_MINOR 0
++#define FFA_USER_REQ_VER_PATCH 1
++
+ /* Get the 32 least significant bits of a handle.*/
+ #define MEM_SHARE_HANDLE_LOW(x) ((x) & 0xffffffff)
+ /* Get the 32 most significant bits of a handle.*/
+@@ -62,6 +67,50 @@ static struct ffa_ioctl_ep_desc test_endpoint3 =3D {
+ 	.uuid_ptr =3D (uint64_t)test_endpoint3_uuid,
+ };
+=20
++static bool check_ffa_user_version(void)
++{
++	FILE *f =3D NULL;
++	int ver_major =3D -1;
++	int ver_minor =3D -1;
++	int ver_patch =3D -1;
++	int scan_cnt =3D 0;
++
++	f =3D fopen("/sys/module/arm_ffa_user/version", "r");
++	if (f) {
++		scan_cnt =3D fscanf(f, "%d.%d.%d",
++				  &ver_major, &ver_minor, &ver_patch);
++		fclose(f);
++		if (scan_cnt !=3D 3) {
++			printf("error: failed to parse arm_ffa_user version\n");
++			return false;
++		}
++	} else {
++		printf("error: failed to read arm_ffa_user module info - %s\n",
++		       strerror(errno));
++		return false;
++	}
++
++	if (ver_major !=3D FFA_USER_REQ_VER_MAJOR)
++		goto err;
++
++	if (ver_minor < FFA_USER_REQ_VER_MINOR)
++		goto err;
++
++	if (ver_minor =3D=3D FFA_USER_REQ_VER_MINOR)
++		if (ver_patch < FFA_USER_REQ_VER_PATCH)
++			goto err;
++
++	return true;
++
++err:
++	printf("error: Incompatible arm_ffa_user driver detected.");
++	printf("Found v%d.%d.%d wanted >=3D v%d.%d.%d)\n",
++	       ver_major, ver_minor, ver_patch, FFA_USER_REQ_VER_MAJOR,
++		   FFA_USER_REQ_VER_MINOR, FFA_USER_REQ_VER_PATCH);
++
++	return false;
++}
++
+ static void close_debugfs(void)
+ {
+ 	int err =3D 0;
+@@ -76,6 +125,9 @@ static void close_debugfs(void)
+=20
+ static bool init_sp_xtest(ADBG_Case_t *c)
+ {
++	if (!check_ffa_user_version())
++		return false;
++
+ 	if (ffa_fd < 0) {
+ 		ffa_fd =3D open(FFA_DRIVER_FS_PATH, O_RDWR);
+ 		if (ffa_fd < 0) {
+@@ -83,6 +135,7 @@ static bool init_sp_xtest(ADBG_Case_t *c)
+ 			return false;
+ 		}
+ 	}
++
+ 	return true;
+ }
+=20
+@@ -99,7 +152,7 @@ static uint16_t get_endpoint_id(uint64_t endp)
+ 	struct ffa_ioctl_ep_desc sid =3D { .uuid_ptr =3D endp };
+=20
+ 	/* Get ID of destination SP based on UUID */
+-	if(ioctl(ffa_fd, FFA_IOC_GET_PART_ID, &sid))
++	if (ioctl(ffa_fd, FFA_IOC_GET_PART_ID, &sid))
+ 		return INCORRECT_ENDPOINT_ID;
+=20
+ 	return sid.id;
+@@ -213,14 +266,15 @@ static int set_up_mem(struct ffa_ioctl_ep_desc *en=
dp,
+ 	rc =3D share_mem(endpoint, handle);
+ 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
+=20
+-	if (!ADBG_EXPECT_TRUE(c, handle !=3D NULL))
+-	     return TEEC_ERROR_GENERIC;
++	if (!ADBG_EXPECT_NOT_NULL(c, handle))
++		return TEEC_ERROR_GENERIC;
+=20
+ 	/* SP will retrieve the memory region. */
+ 	memset(args, 0, sizeof(*args));
+ 	args->dst_id =3D endpoint;
+ 	args->args[MEM_SHARE_HANDLE_LOW_INDEX] =3D MEM_SHARE_HANDLE_LOW(*handl=
e);
+-	args->args[MEM_SHARE_HANDLE_HIGH_INDEX] =3D MEM_SHARE_HANDLE_HIGH(*han=
dle);
++	args->args[MEM_SHARE_HANDLE_HIGH_INDEX] =3D
++		MEM_SHARE_HANDLE_HIGH(*handle);
+ 	args->args[MEM_SHARE_HANDLE_ENDPOINT_INDEX] =3D NORMAL_WORLD_ENDPOINT_=
ID;
+=20
+ 	rc =3D start_sp_test(endpoint, EP_RETRIEVE, args);
+@@ -254,7 +308,7 @@ static void xtest_ffa_spmc_test_1002(ADBG_Case_t *c)
+ 	rc =3D start_sp_test(endpoint1_id, EP_TEST_SP, &args);
+ 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
+ 	if (!ADBG_EXPECT_COMPARE_UNSIGNED(c, args.args[0], =3D=3D, SPMC_TEST_O=
K))
+-	     goto out;
++		goto out;
+=20
+ 	/* Set up memory and have the SP retrieve it. */
+ 	Do_ADBG_BeginSubCase(c, "Test memory set-up");
+@@ -469,7 +523,7 @@ static void xtest_ffa_spmc_test_1005(ADBG_Case_t *c)
+ 	memset(&args, 0, sizeof(args));
+ 	args.args[1] =3D endpoint2;
+ 	args.args[2] =3D endpoint3;
+-	rc =3D start_sp_test(endpoint1, EP_SP_MEM_SHARING_MULTI,&args);
++	rc =3D start_sp_test(endpoint1, EP_SP_MEM_SHARING_MULTI, &args);
+ 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
+ 	ADBG_EXPECT_COMPARE_UNSIGNED(c, args.args[0], =3D=3D, SPMC_TEST_OK);
+=20
+--=20
+2.39.1.windows.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test/musl-workarou=
nd.patch b/meta-arm-bsp/recipes-security/optee/optee-test/musl-workaround=
.patch
new file mode 100644
index 00000000..eed1bd4b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test/musl-workaround.patc=
h
@@ -0,0 +1,24 @@
+Hack to work around musl compile error:
+ In file included from optee-test/3.17.0-r0/recipe-sysroot/usr/include/s=
ys/stat.h:23,
+                  from optee-test/3.17.0-r0/git/host/xtest/regression_10=
00.c:25:
+ optee-test/3.17.0-r0/recipe-sysroot/usr/include/bits/stat.h:17:26: erro=
r: expected identifier or '(' before '[' token
+    17 |         unsigned __unused[2];
+       |                          ^
+
+stat.h is not needed, since it is not being used in this file.  So remov=
ing it.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
+index 4264884..7f1baca 100644
+--- a/host/xtest/regression_1000.c
++++ b/host/xtest/regression_1000.c
+@@ -22,7 +22,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/stat.h>
+ #include <sys/types.h>
+ #include <ta_arm_bti.h>
+ #include <ta_concurrent.h>
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test/run-ptest b/m=
eta-arm-bsp/recipes-security/optee/optee-test/run-ptest
new file mode 100755
index 00000000..ba88c14d
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test/run-ptest
@@ -0,0 +1,52 @@
+#!/bin/sh
+xtest | awk '
+
+    # Escapes the special characters in a string so that, when
+    # included in a regex, it represents a literal match
+    function regx_escape_literal(str,    ret) {
+        ret =3D str
+        gsub(/[\[\]\^\$\.\*\?\+\{\}\\\(\)\|]/ , "\\\\&", str)
+        return str
+    }
+
+    # Returns the simple test formatted name
+    function name(n,    ret) {
+        ret =3D n
+        gsub(/\./, " ", ret)
+        return ret
+    }
+
+    # Returns the simple test formatted result
+    function result(res) {
+        if(res ~ /OK/) {
+            return "PASS"
+        } else if(res ~ /FAILED/) {
+            return "FAIL"
+        }
+    }
+
+    function parse(name, description,     has_subtests, result_line) {
+        has_subtests =3D 0
+
+        # Consume every line up to the result line
+        result_line =3D "  " regx_escape_literal(name) " (OK|FAILED)"
+        do {
+            getline
+
+            # If this is a subtest (denoted by an "o" bullet) then subpa=
rse
+            if($0 ~ /^o /) {
+                parse($2, description " : " substr($0, index($0, $3)))
+                has_subtests =3D 1
+            }
+        } while ($0 !~ result_line)
+
+        # Only print the results for the deepest nested subtests
+        if(!has_subtests) {
+            print result($2) ": " name(name) " - " description
+        }
+    }
+
+    # Start parsing at the beginning of every test (denoted by a "*" bul=
let)
+    /^\* / { parse($2, substr($0, index($0, $3))) }
+
+'
diff --git a/meta-arm/recipes-security/optee/optee-test_3.18.0.bb b/meta-=
arm-bsp/recipes-security/optee/optee-test_3.18.0.bb
similarity index 86%
rename from meta-arm/recipes-security/optee/optee-test_3.18.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bb
index 76cf2e17..436733ea 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.18.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bb
@@ -1,4 +1,4 @@
-require optee-test.inc
+require recipes-security/optee/optee-test.inc
=20
 SRC_URI +=3D " \
     file://musl-workaround.patch \
diff --git a/meta-arm/recipes-security/optee/optee-test_3.20.0.bb b/meta-=
arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
similarity index 89%
rename from meta-arm/recipes-security/optee/optee-test_3.20.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
index 3c868e1d..03ea9116 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.20.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
@@ -1,4 +1,4 @@
-require optee-test.inc
+require recipes-security/optee/optee-test.inc
=20
 SRC_URI +=3D " \
     file://Update-arm_ffa_user-driver-dependency.patch \
diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/con=
f/machine/qemuarm-secureboot.conf
index db02dc68..f08b84fe 100644
--- a/meta-arm/conf/machine/qemuarm-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -21,6 +21,3 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
 IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
=20
 MACHINE_FEATURES +=3D "optee-ftpm"
-
-PREFERRED_VERSION_optee-os ?=3D "3.18.%"
-
diff --git a/meta-arm/recipes-security/optee/optee-client_3.22.0.bb b/met=
a-arm/recipes-security/optee/optee-client_3.22.0.bb
new file mode 100644
index 00000000..d0c75d0c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_3.22.0.bb
@@ -0,0 +1,7 @@
+require optee-client.inc
+
+SRCREV =3D "8533e0e6329840ee96cf81b6453f257204227e6c"
+
+inherit pkgconfig
+DEPENDS +=3D "util-linux"
+EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.22.0.bb b/m=
eta-arm/recipes-security/optee/optee-examples_3.22.0.bb
new file mode 100644
index 00000000..8322c513
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_3.22.0.bb
@@ -0,0 +1,3 @@
+require optee-examples.inc
+
+SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0001-allow-s=
etting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/=
optee-os-3.22.0/0001-allow-setting-sysroot-for-libgcc-lookup.patch
new file mode 100644
index 00000000..ab4a6dbc
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-3.22.0/0001-allow-setting-=
sysroot-for-libgcc-lookup.patch
@@ -0,0 +1,35 @@
+From 528aeb42652a3159c1bfd51d6c1442c3ff27b84c Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 26 May 2020 14:38:02 -0500
+Subject: [PATCH] allow setting sysroot for libgcc lookup
+
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when sear=
ching
+for the compiler libraries as there's no easy way to reliably pass --sys=
root
+otherwise.
+
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ mk/gcc.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index adc77a24..81bfa78a 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
+ 			-print-file-name=3Dinclude 2> /dev/null)
+=20
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$=
(arch-bits-$(sm))) \
+ 			-print-libgcc-file-name 2> /dev/null)
+-libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
++libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=3Dlibstdc++.a 2> /dev/null)
+-libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
++libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=3Dlibgcc_eh.a 2> /dev/null)
+=20
+ # Define these to something to discover accidental use
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0001-core-De=
fine-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee=
/optee-os-3.22.0/0001-core-Define-section-attributes-for-clang.patch
new file mode 100644
index 00000000..1fcc2fb9
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-3.22.0/0001-core-Define-se=
ction-attributes-for-clang.patch
@@ -0,0 +1,240 @@
+From 2449af30e09e172216ec9aa8b07502ae9ddc0a03 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 21 Dec 2022 10:55:58 +0000
+Subject: [PATCH] core: Define section attributes for clang
+
+Clang's attribute section is not same as gcc, here we need to add flags
+to sections so they can be eventually collected by linker into final
+output segments. Only way to do so with clang is to use
+
+pragma clang section ...
+
+The behavious is described here [1], this allows us to define names bss
+sections. This was not an issue until clang-15 where LLD linker starts
+to detect the section flags before merging them and throws the following
+errors
+
+| ld.lld: error: section type mismatch for .nozi.kdata_page
+| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tade=
vkit/3.17.0-r0/build/core/arch/arm/kernel/thread.o:(.nozi.kdata_page): SH=
T_PROGBITS
+| >>> output section .nozi: SHT_NOBITS
+|
+| ld.lld: error: section type mismatch for .nozi.mmu.l2
+| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tade=
vkit/3.17.0-r0/build/core/arch/arm/mm/core_mmu_lpae.o:(.nozi.mmu.l2): SHT=
_PROGBITS
+| >>> output section .nozi: SHT_NOBITS
+
+These sections should be carrying SHT_NOBITS but so far it was not
+possible to do so, this patch tries to use clangs pragma to get this
+going and match the functionality with gcc.
+
+[1] https://intel.github.io/llvm-docs/clang/LanguageExtensions.html#spec=
ifying-section-names-for-global-objects-pragma-clang-section
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
+ core/arch/arm/mm/core_mmu_lpae.c | 35 +++++++++++++++++++++++++++----
+ core/arch/arm/mm/core_mmu_v7.c   | 36 +++++++++++++++++++++++++++++---
+ core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
+ core/kernel/thread.c             | 13 +++++++++++-
+ 5 files changed, 104 insertions(+), 11 deletions(-)
+
+diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
+index 4487ef026..f36243896 100644
+--- a/core/arch/arm/kernel/thread.c
++++ b/core/arch/arm/kernel/thread.c
+@@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
+ #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
+ 	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
+ long thread_user_kdata_sp_offset __nex_bss;
++#ifdef __clang__
++#ifndef CFG_VIRTUALIZATION
++#pragma clang section bss=3D".nozi.kdata_page"
++#else
++#pragma clang section bss=3D".nex_nozi.kdata_page"
++#endif
++#endif
+ static uint8_t thread_user_kdata_page[
+ 	ROUNDUP(sizeof(struct thread_core_local) * CFG_TEE_CORE_NB_CORE,
+ 		SMALL_PAGE_SIZE)]
+ 	__aligned(SMALL_PAGE_SIZE)
++#ifndef __clang__
+ #ifndef CFG_NS_VIRTUALIZATION
+-	__section(".nozi.kdata_page");
++	__section(".nozi.kdata_page")
+ #else
+-	__section(".nex_nozi.kdata_page");
++	__section(".nex_nozi.kdata_page")
+ #endif
++#endif
++    ;
++#endif
++
++/* reset BSS section to default ( .bss ) */
++#ifdef __clang__
++#pragma clang section bss=3D""
+ #endif
+=20
+ #ifdef ARM32
+diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mm=
u_lpae.c
+index 7e79f780a..ec4db9dc9 100644
+--- a/core/arch/arm/mm/core_mmu_lpae.c
++++ b/core/arch/arm/mm/core_mmu_lpae.c
+@@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
+ typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_=
ENTRIES];
+ typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
+=20
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.base_table"
++#endif
+ static base_xlat_tbls_t base_xlation_table[NUM_BASE_TABLES]
+ 	__aligned(NUM_BASE_LEVEL_ENTRIES * XLAT_ENTRY_SIZE)
+-	__section(".nozi.mmu.base_table");
++#ifndef __clang__
++	__section(".nozi.mmu.base_table")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+=20
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l2"
++#endif
+ static xlat_tbl_t xlat_tables[MAX_XLAT_TABLES]
+-	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
++	__aligned(XLAT_TABLE_SIZE)
++#ifndef __clang__
++	__section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+=20
+ #define XLAT_TABLES_SIZE	(sizeof(xlat_tbl_t) * MAX_XLAT_TABLES)
+=20
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l2"
++#endif
+ /* MMU L2 table for TAs, one for each thread */
+ static xlat_tbl_t xlat_tables_ul1[CFG_NUM_THREADS]
+-	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
+-
++#ifndef __clang__
++	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+ /*
+  * TAs page table entry inside a level 1 page table.
+  *
+diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_=
v7.c
+index 61e703da8..1960c08ca 100644
+--- a/core/arch/arm/mm/core_mmu_v7.c
++++ b/core/arch/arm/mm/core_mmu_v7.c
+@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
+ typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
+ typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
+=20
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l1"
++#endif
+ static l1_xlat_tbl_t main_mmu_l1_ttb
+-		__aligned(L1_ALIGNMENT) __section(".nozi.mmu.l1");
++		__aligned(L1_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.l1")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+=20
+ /* L2 MMU tables */
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l2"
++#endif
+ static l2_xlat_tbl_t main_mmu_l2_ttb[MAX_XLAT_TABLES]
+-		__aligned(L2_ALIGNMENT) __section(".nozi.mmu.l2");
++		__aligned(L2_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+=20
+ /* MMU L1 table for TAs, one for each thread */
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.ul1"
++#endif
+ static ul1_xlat_tbl_t main_mmu_ul1_ttb[CFG_NUM_THREADS]
+-		__aligned(UL1_ALIGNMENT) __section(".nozi.mmu.ul1");
++		__aligned(UL1_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.ul1")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+=20
+ struct mmu_partition {
+ 	l1_xlat_tbl_t *l1_table;
+diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
+index 79553c6d2..b9efdf427 100644
+--- a/core/arch/arm/mm/pgt_cache.c
++++ b/core/arch/arm/mm/pgt_cache.c
+@@ -410,8 +410,18 @@ void pgt_init(void)
+ 	 * has a large alignment, while .bss has a small alignment. The curren=
t
+ 	 * link script is optimized for small alignment in .bss
+ 	 */
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l2"
++#endif
+ 	static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
+-			__aligned(PGT_SIZE) __section(".nozi.pgt_cache");
++			__aligned(PGT_SIZE)
++#ifndef __clang__
++			__section(".nozi.pgt_cache")
++#endif
++			;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+ 	size_t n;
+=20
+ 	for (n =3D 0; n < ARRAY_SIZE(pgt_tables); n++) {
+diff --git a/core/kernel/thread.c b/core/kernel/thread.c
+index 2a1f22dce..5516b6771 100644
+--- a/core/kernel/thread.c
++++ b/core/kernel/thread.c
+@@ -39,13 +39,24 @@ static uint32_t end_canary_value =3D 0xababab00;
+ 	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
+ #endif
+=20
++#define DO_PRAGMA(x) _Pragma (#x)
++
++#ifdef __clang__
++#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
++DO_PRAGMA (clang section bss=3D".nozi_stack." #name) \
++linkage uint32_t name[num_stacks] \
++		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
++			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
++		__attribute__((aligned(STACK_ALIGNMENT))); \
++DO_PRAGMA(clang section bss=3D"")
++#else
+ #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
+ linkage uint32_t name[num_stacks] \
+ 		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
+ 			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
+ 		__attribute__((section(".nozi_stack." # name), \
+ 			       aligned(STACK_ALIGNMENT)))
+-
++#endif
+ #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
+=20
+ DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE, STACK_TMP_SIZE,
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0002-optee-e=
nable-clang-support.patch b/meta-arm/recipes-security/optee/optee-os-3.22=
.0/0002-optee-enable-clang-support.patch
new file mode 100644
index 00000000..af0ec94f
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-3.22.0/0002-optee-enable-c=
lang-support.patch
@@ -0,0 +1,30 @@
+From 8846ab2b37781364088cc5c02b6bc6f518a66a0a Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Wed, 23 Sep 2020 09:27:34 +0100
+Subject: [PATCH] optee: enable clang support
+
+When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
+to provide a sysroot wasn't included, which results in not locating
+compiler-rt. This is mitigated by including the variable as ammended.
+
+Upstream-Status: Pending
+ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+
+---
+ mk/clang.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/clang.mk b/mk/clang.mk
+index a045beee..1ebe2f70 100644
+--- a/mk/clang.mk
++++ b/mk/clang.mk
+@@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
+=20
+ # Note, use the compiler runtime library (libclang_rt.builtins.*.a) ins=
tead of
+ # libgcc for clang
+-libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(a=
rch-bits-$(sm))) \
+ 			-rtlib=3Dcompiler-rt -print-libgcc-file-name 2> /dev/null)
+=20
+ # Core ASLR relies on the executable being ready to run from its prefer=
red load
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0003-core-li=
nk-add-no-warn-rwx-segments.patch b/meta-arm/recipes-security/optee/optee=
-os-3.22.0/0003-core-link-add-no-warn-rwx-segments.patch
new file mode 100644
index 00000000..5740461f
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-3.22.0/0003-core-link-add-=
no-warn-rwx-segments.patch
@@ -0,0 +1,63 @@
+From 188a39b139e0e2ccceb22bcf63559b451f0483e0 Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Fri, 5 Aug 2022 09:48:03 +0200
+Subject: [PATCH] core: link: add --no-warn-rwx-segments
+
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
+
+binutils ld.bfd generates one RWX LOAD segment by merging several sectio=
ns
+with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 =
it
+also warns by default when that happens [1], which breaks the build due =
to
+--fatal-warnings. The RWX segment is not a problem for the TEE core, sin=
ce
+that information is not used to set memory permissions. Therefore, silen=
ce
+the warning.
+
+Link: [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D=
ba951afb99912da01a6e8434126b8fac7aa75107
+Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D29448
+Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+---
+ core/arch/arm/kernel/link.mk | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 0e96e606..3fbcb680 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -37,6 +37,7 @@ link-ldflags +=3D --sort-section=3Dalignment
+ link-ldflags +=3D --fatal-warnings
+ link-ldflags +=3D --gc-sections
+ link-ldflags +=3D $(link-ldflags-common)
++link-ldflags +=3D $(call ld-option,--no-warn-rwx-segments)
+=20
+ link-ldadd  =3D $(LDADD)
+ link-ldadd +=3D $(ldflags-external)
+@@ -61,6 +62,7 @@ link-script-cppflags :=3D \
+ 		$(cppflagscore))
+=20
+ ldargs-all_objs :=3D -T $(link-script-dummy) --no-check-sections \
++		   $(call ld-option,--no-warn-rwx-segments) \
+ 		   $(link-ldflags-common) \
+ 		   $(link-objs) $(link-ldadd) $(libgcccore)
+ cleanfiles +=3D $(link-out-dir)/all_objs.o
+@@ -75,7 +77,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/a=
ll_objs.o
+ 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
+=20
+ unpaged-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-se=
ctions \
+-		 $(link-ldflags-common)
++		 $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
+ unpaged-ldadd :=3D $(objs) $(link-ldadd) $(libgcccore)
+ cleanfiles +=3D $(link-out-dir)/unpaged.o
+ $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
+@@ -104,7 +106,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/al=
l_objs.o
+ 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
+=20
+ init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons \
+-	       $(link-ldflags-common)
++	       $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
+ init-ldadd :=3D $(link-objs-init) $(link-out-dir)/version.o  $(link-lda=
dd) \
+ 	      $(libgcccore)
+ cleanfiles +=3D $(link-out-dir)/init.o
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.22.0.bb =
b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.22.0.bb
new file mode 100644
index 00000000..3d958168
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.22.0.bb
@@ -0,0 +1,24 @@
+require optee-os_3.22.0.bb
+
+SUMMARY =3D "OP-TEE Trusted OS TA devkit"
+DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+DEPENDS +=3D "python3-pycryptodome-native"
+
+do_install() {
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
+    done
+}
+
+do_deploy() {
+	echo "Do not inherit do_deploy from optee-os."
+}
+
+FILES:${PN} =3D "${includedir}/optee/"
+
+# Build paths are currently embedded
+INSANE_SKIP:${PN}-dev +=3D "buildpaths"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.1%.bbappend b/met=
a-arm/recipes-security/optee/optee-os_3.1%.bbappend
deleted file mode 100644
index 2ff1b834..00000000
--- a/meta-arm/recipes-security/optee/optee-os_3.1%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Include Trusted Services Secure Partitions
-require optee-os-ts-3.18.inc
-
-# Conditionally include platform specific Trusted Services related OPTEE=
 build parameters
-EXTRA_OEMAKE:append:qemuarm64-secureboot =3D "${@oe.utils.conditional('S=
P_PATHS', '', '', ' CFG_CORE_HEAP_SIZE=3D131072 CFG_TEE_BENCHMARK=3Dn CFG=
_TEE_CORE_LOG_LEVEL=3D4 CFG_CORE_SEL1_SPMC=3Dy ', d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.22.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.22.0.bb
new file mode 100644
index 00000000..7be0c45b
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_3.22.0.bb
@@ -0,0 +1,10 @@
+require optee-os.inc
+
+DEPENDS +=3D "dtc-native"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.22.0:"
+
+SRCREV =3D "001ace6655dd6bb9cbe31aa31b4ba69746e1a1d9"
+SRC_URI +=3D " \
+    file://0001-core-Define-section-attributes-for-clang.patch \
+   "
diff --git a/meta-arm/recipes-security/optee/optee-test_3.22.0.bb b/meta-=
arm/recipes-security/optee/optee-test_3.22.0.bb
new file mode 100644
index 00000000..3b9632fa
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_3.22.0.bb
@@ -0,0 +1,10 @@
+require optee-test.inc
+
+SRC_URI +=3D " \
+    file://musl-workaround.patch \
+   "
+SRCREV =3D "a286b57f1721af215ace318d5807e63f40186df6"
+
+EXTRA_OEMAKE:append =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INCDIR}"
+DEPENDS:append =3D " openssl"
+CFLAGS:append =3D " -Wno-error=3Ddeprecated-declarations"
--=20
2.30.2


