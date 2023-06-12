Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A41CC7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 13:21:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12849.1686662513700742651
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 06:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FBDC1FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 06:22:38 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B7DB3F587
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 06:21:52 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/scp-firmware: update to v2.12.0
Date: Mon, 12 Jun 2023 09:50:48 -0500
Message-Id: <20230612145048.3336128-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 13:21:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4768

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{scp-firmware_2.11.%.bbappend =3D> scp-firmware_%.bbappend}   | 0
 .../{scp-firmware_2.11.0.bb =3D> scp-firmware_2.12.0.bb}          | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm-bsp/recipes-bsp/scp-firmware/{scp-firmware_2.11.%.bbappe=
nd =3D> scp-firmware_%.bbappend} (100%)
 rename meta-arm/recipes-bsp/scp-firmware/{scp-firmware_2.11.0.bb =3D> sc=
p-firmware_2.12.0.bb} (98%)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.11.%.bb=
append b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.11.%.bba=
ppend
rename to meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
similarity index 98%
rename from meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
rename to meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
index 0bbd88c0..520e5500 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
@@ -10,7 +10,7 @@ SRC_URI_SCP_FIRMWARE ?=3D "gitsm://github.com/ARM-softw=
are/SCP-firmware.git;protoc
 SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRANCH}"
 SRCBRANCH =3D "master"
=20
-SRCREV  =3D "635697544170b78167ed698393a72d6e522032e1"
+SRCREV  =3D "0c7236b1851d90124210a0414fd982dc55322c7c"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
=20
--=20
2.30.2


