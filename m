Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0361BC433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 19:56:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.15406.1633377377898844926
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 12:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6721B11D4
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11DB43F70D
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/8] arm/hafnium: package the ELF in hafnium-dbg
Date: Mon,  4 Oct 2021 20:56:09 +0100
Message-Id: <20211004195612.188487-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004195612.188487-1-ross.burton@arm.com>
References: <20211004195612.188487-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Oct 2021 19:56:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2249

The .elf is only useful for debugging, so put it in the dbg package.

Change-Id: If2802e4cf8303e7e8258e81b580a43bdecfa3a0a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.5.bb
index bacf684d..39aa14f9 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -47,10 +47,11 @@ do_install() {
     done
 }
=20
-FILES:${PN} =3D "/firmware"
+FILES:${PN} =3D "/firmware/*.bin"
+FILES:${PN}-dbg =3D "/firmware/*.elf"
 SYSROOT_DIRS +=3D "/firmware"
-# skip QA tests: {'ldflags'}
 INSANE_SKIP:${PN} =3D "ldflags"
+INSANE_SKIP:${PN}-dbg =3D "ldflags"
=20
 do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
--=20
2.25.1


