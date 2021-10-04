Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1B5C433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 19:56:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15313.1633377377228903182
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 12:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3300113E
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 790D53F70D
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/8] arm/hafnium: clean up install
Date: Mon,  4 Oct 2021 20:56:08 +0100
Message-Id: <20211004195612.188487-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004195612.188487-1-ross.burton@arm.com>
References: <20211004195612.188487-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Oct 2021 19:56:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2244

Hafnium hard-codes a lot of this logic, so do_install can be simplified.

Change-Id: If4f941dff392a6e8d0b7ee9fff68a9836a7fd806
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.5.bb
index 8b4184b5..bacf684d 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -43,25 +43,7 @@ do_install() {
     cd ${B}/${HAFNIUM_PLATFORM}_clang
     install -d -m 755 ${D}/firmware
     for bldfile in ${HAFNIUM_INSTALL_TARGET}; do
-        processed=3D"0"
-        if [ -f $bldfile.bin ]; then
-            echo "Install $bldfile.bin"
-            install -m 0755 $bldfile.bin \
-                ${D}/firmware/$bldfile-${HAFNIUM_PLATFORM}.bin
-            ln -sf $bldfile-${HAFNIUM_PLATFORM}.bin ${D}/firmware/$bldfi=
le.bin
-            processed=3D"1"
-        fi
-        if [ -f $bldfile.elf ]; then
-            echo "Install $bldfile.elf"
-            install -m 0755 $bldfile.elf \
-                ${D}/firmware/$bldfile-${HAFNIUM_PLATFORM}.elf
-            ln -sf $bldfile-${HAFNIUM_PLATFORM}.elf ${D}/firmware/$bldfi=
le.elf
-            processed=3D"1"
-        fi
-        if [ "$processed" =3D "0" ]; then
-            bberror "Unsupported HAFNIUM_INSTALL_TARGET target $bldfile"
-            exit 1
-        fi
+        install -m 0755 $bldfile.bin $bldfile.elf ${D}/firmware/
     done
 }
=20
--=20
2.25.1


