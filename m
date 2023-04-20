Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F73C77B76
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:46:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6930.1681994807721208969
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 05:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 020E61480
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 05:47:31 -0700 (PDT)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 18F7E3F587
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 05:46:47 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/tc1: Fix signed u-boot
Date: Thu, 20 Apr 2023 08:46:41 -0400
Message-Id: <20230420124642.662700-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 12:46:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4591

Recent changes in upstream u-boot recipes for signed fitimages, have
caused the existing code to no longer boot.  Add a newly required
variable to get it working again.  Tested using tc1 FVP.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/include/tc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index f51497de..59a11b27 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -21,6 +21,7 @@ UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
 UBOOT_SIGN_KEYNAME =3D "dev_key"
 UBOOT_SIGN_KEYDIR =3D "${DEPLOY_DIR_IMAGE}/keys"
 FIT_GENERATE_KEYS =3D "1"
+FIT_SIGN_INDIVIDUAL =3D "1"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack"
=20
--=20
2.25.1


