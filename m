Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B30CC77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 16:02:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1045.1684944163974338289
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 09:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78BC6113E
	for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 09:03:28 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 507283F67D
	for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 09:02:43 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/tc1: re-enable signed kernel image
Date: Wed, 24 May 2023 11:02:37 -0500
Message-Id: <20230524160237.3275001-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524160237.3275001-1-jon.mason@arm.com>
References: <20230524160237.3275001-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 16:02:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4692

---
 meta-arm-bsp/conf/machine/include/tc.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index 14ec7205..75bfea07 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -10,6 +10,17 @@ UBOOT_RD_LOADADDRESS =3D "0x88000000"
 UBOOT_RD_ENTRYPOINT =3D "0x88000000"
 UBOOT_LOADADDRESS =3D "0x80080000"
 UBOOT_ENTRYPOINT =3D "0x80080000"
+# Below options will generate a key to sign the kernel Image and INITRAM=
FS_IMAGE
+# according to the default parameters of kernel-fitimage.bbclass. If the=
 user
+# would prefer to use their own keys, disable the key generation using t=
he
+# FIT_GENERATE_KEYS parameter and specify the location of the keys using=
 the
+# below paramters.
+UBOOT_SIGN_ENABLE =3D "1"
+UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
+UBOOT_SIGN_KEYNAME =3D "dev_key"
+UBOOT_SIGN_KEYDIR =3D "${DEPLOY_DIR_IMAGE}/keys"
+FIT_GENERATE_KEYS =3D "1"
+FIT_SIGN_INDIVIDUAL =3D "1"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
=20
--=20
2.30.2


