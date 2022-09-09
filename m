Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A4EECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 13:42:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1307.1662730916258470918
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Sep 2022 06:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C015C165C;
	Fri,  9 Sep 2022 06:42:01 -0700 (PDT)
Received: from e126544.arm.com (unknown [10.57.46.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B8123F9AB;
	Fri,  9 Sep 2022 06:41:54 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp-board-firmware: upgrade to N1SDP-2022.06.22
Date: Fri,  9 Sep 2022 14:41:11 +0100
Message-Id: <20220909134111.1074139-2-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909134111.1074139-1-mohamed.omarasaker@arm.com>
References: <20220909134111.1074139-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 13:42:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3758

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 ...ware_2021.10.12.bb =3D> n1sdp-board-firmware_2022.06.22.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-arm-bsp/recipes-bsp/images/{n1sdp-board-firmware_2021.10.12.=
bb =3D> n1sdp-board-firmware_2022.06.22.bb} (79%)

diff --git a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2021.10=
.12.bb b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.=
bb
similarity index 79%
rename from meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2021.10.=
12.bb
rename to meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22=
.bb
index dda99e74..ef7a4fca 100644
--- a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2021.10.12.bb
+++ b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Board Firmware binaries for N1SDP"
 SECTION =3D "firmware"
=20
 LICENSE =3D "STM-SLA0044-Rev5"
-LIC_FILES_CHKSUM =3D "file://LICENSES/STM.TXT;md5=3Dcd18335eff80d0a690a6=
50f0e6748baf"
+LIC_FILES_CHKSUM =3D "file://LICENSES/MB/STM.TXT;md5=3D1b74d8c842307d03c=
116f2d71cbf868a"
=20
 inherit deploy
=20
@@ -13,7 +13,7 @@ COMPATIBLE_MACHINE =3D "n1sdp"
=20
 SRC_URI =3D "git://git.gitlab.arm.com/arm-reference-solutions/board-firm=
ware.git;protocol=3Dhttps;branch=3Dn1sdp"
=20
-SRCREV =3D "e6cd91c7a9733e501bc3b57ff6f9eb2461ffee54"
+SRCREV =3D "6d5253584a9c2fdc2edbdc39bf6f2436215d1382"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -25,6 +25,7 @@ do_install() {
     cp -Rp --no-preserve=3Downership ${S}/* ${D}${INSTALL_DIR}
 }
=20
+FILES:${PN}-staticdev +=3D " ${INSTALL_DIR}/LIB/sensor.a"
 FILES:${PN} =3D "${INSTALL_DIR}"
 SYSROOT_DIRS +=3D "${INSTALL_DIR}"
=20
--=20
2.25.1


