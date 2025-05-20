Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E9BC54E65
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 16:05:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24951.1747757151082628096
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 09:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35363152B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 09:05:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 553263F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 09:05:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/execstack: remove, no longer needed
Date: Tue, 20 May 2025 17:05:45 +0100
Message-ID: <20250520160545.2283646-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520160545.2283646-1-ross.burton@arm.com>
References: <20250520160545.2283646-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 16:05:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6507

This is no longer needed by the FVP recipes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/fvp/execstack-native.bb  | 25 ------------------
 .../recipes-devtools/fvp/remove-execstack.inc | 26 -------------------
 2 files changed, 51 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/fvp/execstack-native.bb
 delete mode 100644 meta-arm/recipes-devtools/fvp/remove-execstack.inc

diff --git a/meta-arm/recipes-devtools/fvp/execstack-native.bb b/meta-arm=
/recipes-devtools/fvp/execstack-native.bb
deleted file mode 100644
index 8f22d8ba..00000000
--- a/meta-arm/recipes-devtools/fvp/execstack-native.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "execstack tool"
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b"
-
-DEPENDS =3D "binutils-native elfutils-native"
-
-SRC_URI =3D "git://git.yoctoproject.org/prelink-cross;protocol=3Dhttps;b=
ranch=3Dmaster"
-SRCREV =3D "ff2561c02ade96c5d4d56ddd4e27ff064840a176"
-PV =3D "1.0+git${SRCPV}"
-
-# The last tagged release was 20151030.  Track this as a git tree to
-# see if there are any updates
-UPSTREAM_CHECK_COMMITS =3D "1"
-
-S =3D "${WORKDIR}/git"
-
-inherit autotools native
-
-do_compile() {
-    oe_runmake -C ${B}/src execstack
-}
-
-do_install() {
-    oe_runmake -C ${B}/src install-binPROGRAMS DESTDIR=3D"${D}"
-}
diff --git a/meta-arm/recipes-devtools/fvp/remove-execstack.inc b/meta-ar=
m/recipes-devtools/fvp/remove-execstack.inc
deleted file mode 100644
index 7f02b502..00000000
--- a/meta-arm/recipes-devtools/fvp/remove-execstack.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-# Clear the executable stack flag on named shared libraries. This are ty=
pically
-# not needed, and glibc 2.41 will refuse to dlopen() a library that expe=
cts
-# an executable stack.
-#
-# The stack permissions can be checked with readelf -lW <.so> | grep GNU=
_STACK.
-# RW is read/write, RWE is read/write/execute.
-
-DEPENDS +=3D "execstack-native"
-
-REMOVE_EXECSTACKS ?=3D ""
-
-do_install:append() {
-    for SO in ${REMOVE_EXECSTACKS}; do
-        NAME=3D$(basename $SO)
-        SO=3D${D}$SO
-
-        test -f $SO || bbfatal remove-execstack: cannot find $SO
-
-        if execstack --query $SO | grep -q ^X; then
-            bbnote "Stripping executable stack bit on $NAME"
-            execstack --clear-execstack $SO
-        else
-            bbwarn "Executable stack stripping no longer required for $N=
AME, remove"
-        fi
-    done
-}
--=20
2.43.0


