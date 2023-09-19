Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB884CD5BAF
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:44:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7373.1695127480619832576
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 05:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F979FEC
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 05:45:17 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3513C3F67D
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 05:44:40 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/scp-firmware: update to v2.13.0
Date: Tue, 19 Sep 2023 07:44:35 -0500
Message-Id: <20230919124435.3776850-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230919124435.3776850-1-jon.mason@arm.com>
References: <20230919124435.3776850-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 12:44:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5061

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{scp-firmware_2.12.0.bb =3D> scp-firmware_2.13.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-bsp/scp-firmware/{scp-firmware_2.12.0.bb =3D> sc=
p-firmware_2.13.0.bb} (98%)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb
similarity index 98%
rename from meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
rename to meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb
index 9a16de7b..7ca78f3c 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRAN=
CH} \
           "
=20
 SRCBRANCH =3D "master"
-SRCREV  =3D "0c7236b1851d90124210a0414fd982dc55322c7c"
+SRCREV  =3D "cc4c9e017348d92054f74026ee1beb081403c168"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
=20
--=20
2.30.2


