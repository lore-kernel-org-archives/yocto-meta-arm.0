Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6F7CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 16:59:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.224882.1697561940438532559
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 09:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 286E22F4;
	Tue, 17 Oct 2023 09:59:40 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.32.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44BD43F762;
	Tue, 17 Oct 2023 09:58:58 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH] arm-bsp/linux-yocto: corstone1000: bump to v6.5%
Date: Tue, 17 Oct 2023 17:58:50 +0100
Message-Id: <20231017165850.381242-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 16:59:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5135

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

upgrade the kernel to v6.5%

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 5a66f54d..749350e1 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -52,7 +52,7 @@ EXTRA_IMAGEDEPENDS +=3D "external-system"
=20
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto =3D "6.4%"
+PREFERRED_VERSION_linux-yocto =3D "6.5%"
 KERNEL_IMAGETYPE =3D "Image.gz"
=20
 INITRAMFS_IMAGE_BUNDLE ?=3D "1"
--=20
2.25.1


