Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71002C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:12:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11537.1744981922563765055
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 06:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F95814BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:11:59 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27E4E3F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:12:02 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/scp-firmware: update to 2.16.0
Date: Fri, 18 Apr 2025 09:12:00 -0400
Message-Id: <20250418131201.95204-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 13:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6470

Update SCP to the latest tagged version, and update the related patch to
the new location of the relevant files.

For a comparison of the changes, please go to
https://git.gitlab.arm.com/firmware/SCP-firmware/-/compare/v2.15.0...v2.1=
6.0

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{scp-firmware_2.15.0.bb =3D> scp-firmware_2.16.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-bsp/scp-firmware/{scp-firmware_2.15.0.bb =3D> sc=
p-firmware_2.16.0.bb} (98%)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.15.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
similarity index 98%
rename from meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.15.0.bb
rename to meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
index b305234347f2..66cf4e44962f 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.15.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRAN=
CH} \
           "
=20
 SRCBRANCH =3D "main"
-SRCREV  =3D "25681b34bdc838b7231e0056e3ef5164e8005382"
+SRCREV  =3D "190e938c2da3631b4834a90448516423099c79f7"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
=20
--=20
2.39.5 (Apple Git-154)


