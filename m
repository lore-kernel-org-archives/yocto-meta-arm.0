Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D55EB64DC
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 13:09:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38985.1688994561801939273
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 06:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3A2F113E;
	Mon, 10 Jul 2023 06:10:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F13ED3F67D;
	Mon, 10 Jul 2023 06:09:20 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/5] arm/scp-firmware: log what platform/firmware/type is being built
Date: Mon, 10 Jul 2023 14:09:15 +0100
Message-Id: <20230710130916.3414041-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710130916.3414041-1-ross.burton@arm.com>
References: <20230710130916.3414041-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Jul 2023 13:09:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4874

From: Ross Burton <ross.burton@arm.com>

This helps understand long build logs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
index ebb3197e..25cd1dcd 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
@@ -58,7 +58,8 @@ EXTRA_OECMAKE =3D "-D CMAKE_BUILD_TYPE=3D${CMAKE_BUILD_=
TYPE} \
 do_configure() {
     for FW in ${FW_TARGETS}; do
         for TYPE in ${FW_INSTALL}; do
-            cmake -GNinja ${EXTRA_OECMAKE} -S ${S} -B "${B}/${TYPE}/${FW=
}" -D SCP_FIRMWARE_SOURCE_DIR=3D"${SCP_PLATFORM}/${FW}_${TYPE}"
+            bbnote Configuring ${SCP_PLATFORM}/${FW}_${TYPE}...
+            cmake -GNinja ${EXTRA_OECMAKE} -S ${S} -B "${B}/${TYPE}/${FW=
}" -D SCP_FIRMWARE_SOURCE_DIR:PATH=3D"${SCP_PLATFORM}/${FW}_${TYPE}"
         done
     done
 }
@@ -68,6 +69,7 @@ do_configure[cleandirs] +=3D "${B}"
 do_compile() {
     for FW in ${FW_TARGETS}; do
         for TYPE in ${FW_INSTALL}; do
+            bbnote Building ${SCP_PLATFORM}/${FW}_${TYPE}...
             VERBOSE=3D1 cmake --build ${B}/${TYPE}/${FW} --target all
         done
     done
--=20
2.34.1


