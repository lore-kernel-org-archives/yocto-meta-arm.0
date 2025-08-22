Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36CCCA0EFF
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 13:20:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9963.1755868812519764368
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 06:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7E3627DC
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:20:03 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D0173F63F
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:20:12 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp/fvp-base: remove console workaround
Date: Fri, 22 Aug 2025 09:20:10 -0400
Message-Id: <20250822132011.93796-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250822132011.93796-1-jon.mason@arm.com>
References: <20250822132011.93796-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 13:20:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6681

Remove the KERNEL_CONSOLE workaround, as that has now been upstreamed
should should no longer be needed.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 8761eb77d12a..2dd2dacb7775 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -17,8 +17,6 @@ IMAGE_FSTYPES +=3D "wic"
 WKS_FILE ?=3D "efi-disk.wks.in"
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
-# FIXME -  This is being upstreamed.  Remove once that has occurred.
-KERNEL_CONSOLE ?=3D "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[=
0].split(';')[::-1]) or 'ttyS0'}"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 KERNEL_DTB_NAME =3D "fvp-base-revc.dtb"
--=20
2.39.5 (Apple Git-154)


