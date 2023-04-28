Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B77C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 14:56:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22189.1682693804607934454
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 07:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA5D9C14
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Apr 2023 07:57:27 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AED713F587
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Apr 2023 07:56:43 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/tc1: disable signed kernel image
Date: Fri, 28 Apr 2023 09:56:38 -0500
Message-Id: <20230428145638.3261549-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Apr 2023 14:56:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4624

The signed kernel image for the android kernel and legacy u-boot is no
longer booting.  Remove this to allow for it to work until it can be
fixed.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/include/tc.inc | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index f84d55c2..f7a1cfa8 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -11,17 +11,6 @@ UBOOT_RD_LOADADDRESS =3D "0x88000000"
 UBOOT_RD_ENTRYPOINT =3D "0x88000000"
 UBOOT_LOADADDRESS =3D "0x80080000"
 UBOOT_ENTRYPOINT =3D "0x80080000"
-# Below options will generate a key to sign the kernel Image and INITRAM=
FS_IMAGE
-# according to the default parameters of kernel-fitimage.bbclass. If the=
 user
-# would prefer to use their own keys, disable the key generation using t=
he
-# FIT_GENERATE_KEYS parameter and specify the location of the keys using=
 the
-# below paramters.
-UBOOT_SIGN_ENABLE =3D "1"
-UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
-UBOOT_SIGN_KEYNAME =3D "dev_key"
-UBOOT_SIGN_KEYDIR =3D "${DEPLOY_DIR_IMAGE}/keys"
-FIT_GENERATE_KEYS =3D "1"
-FIT_SIGN_INDIVIDUAL =3D "1"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack"
=20
--=20
2.30.2


