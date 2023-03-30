Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA04DC77B62
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 16:38:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30538.1680194298900374787
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 09:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0C951650;
	Thu, 30 Mar 2023 09:39:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14EA73F6C4;
	Thu, 30 Mar 2023 09:38:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/6] arm/scp-firmware: fix up whitespace
Date: Thu, 30 Mar 2023 17:38:11 +0100
Message-Id: <20230330163815.3677638-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330163815.3677638-1-ross.burton@arm.com>
References: <20230330163815.3677638-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 16:38:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4512

For some reason the shell functions are indented an extra character,
reindent to standard four spaces.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../scp-firmware/scp-firmware_2.10.0.bb       | 64 +++++++++----------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
index b25b9a40..316de37c 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
@@ -52,46 +52,46 @@ EXTRA_OECMAKE =3D "-D CMAKE_BUILD_TYPE=3D${SCP_BUILD_=
STR} \
                 "
=20
 do_configure() {
-     for FW in ${FW_TARGETS}; do
-         for TYPE in ${FW_INSTALL}; do
-             cmake -GNinja ${EXTRA_OECMAKE} -S ${S} -B "${B}/${TYPE}/${F=
W}" -D SCP_FIRMWARE_SOURCE_DIR=3D"${SCP_PLATFORM}/${FW}_${TYPE}"
-         done
-     done
+    for FW in ${FW_TARGETS}; do
+        for TYPE in ${FW_INSTALL}; do
+            cmake -GNinja ${EXTRA_OECMAKE} -S ${S} -B "${B}/${TYPE}/${FW=
}" -D SCP_FIRMWARE_SOURCE_DIR=3D"${SCP_PLATFORM}/${FW}_${TYPE}"
+        done
+    done
 }
=20
 do_configure[cleandirs] +=3D "${B}"
=20
 do_compile() {
-     for FW in ${FW_TARGETS}; do
-         for TYPE in ${FW_INSTALL}; do
-             cmake --build ${B}/${TYPE}/${FW} --target all
-         done
-     done
+    for FW in ${FW_TARGETS}; do
+        for TYPE in ${FW_INSTALL}; do
+            cmake --build ${B}/${TYPE}/${FW} --target all
+        done
+    done
 }
=20
 do_install() {
-     install -d ${D}/firmware
-     for TYPE in ${FW_INSTALL}; do
-         for FW in ${FW_TARGETS}; do
-            if [ "$TYPE" =3D "romfw" ]; then
-                if [ "$FW" =3D "scp" ]; then
-                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-b=
l1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-b=
l1" "${D}/firmware/${FW}_${TYPE}.elf"
-                elif [ "$FW" =3D "mcp" ]; then
-                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-m=
cp-bl1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-m=
cp-bl1" "${D}/firmware/${FW}_${TYPE}.elf"
-                fi
-            elif [ "$TYPE" =3D "ramfw" ]; then
-                if [ "$FW" =3D "scp" ]; then
-                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-b=
l2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-b=
l2" "${D}/firmware/${FW}_${TYPE}.elf"
-                elif [ "$FW" =3D "mcp" ]; then
-                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-m=
cp-bl2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-m=
cp-bl2" "${D}/firmware/${FW}_${TYPE}.elf"
-                fi
-            fi
-        done
-     done
+    install -d ${D}/firmware
+    for TYPE in ${FW_INSTALL}; do
+        for FW in ${FW_TARGETS}; do
+           if [ "$TYPE" =3D "romfw" ]; then
+               if [ "$FW" =3D "scp" ]; then
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1" "${D}/firmware/${FW}_${TYPE}.elf"
+               elif [ "$FW" =3D "mcp" ]; then
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl1" "${D}/firmware/${FW}_${TYPE}.elf"
+               fi
+           elif [ "$TYPE" =3D "ramfw" ]; then
+               if [ "$FW" =3D "scp" ]; then
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2" "${D}/firmware/${FW}_${TYPE}.elf"
+               elif [ "$FW" =3D "mcp" ]; then
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl2" "${D}/firmware/${FW}_${TYPE}.elf"
+               fi
+           fi
+       done
+    done
 }
=20
 FILES:${PN} =3D "/firmware"
--=20
2.34.1


