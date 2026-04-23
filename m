Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BA0F589D1
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 13:16:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19229.1776950214670099512
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 06:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Vv4ido3N;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B790353E;
	Thu, 23 Apr 2026 06:16:48 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.17.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C21993F641;
	Thu, 23 Apr 2026 06:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776950213; bh=emyvL+IMFbSqXdP/wjuXeSEIBcTzOfGCfobeIYQcI14=;
	h=From:To:Cc:Subject:Date:From;
	b=Vv4ido3NaqUNEHcRMeEJTNYjMlYEPxMjLhfHQ3zFIm1S3l5dcNnSoz4eBD4GVrEo5
	 OCVlRiQOe+eUjiNFwRIP4lt0Ik0eAJi/k1O1l/WqFdXMHf12kAV/IjoTg1mJTttWIL
	 MaYfh/KOU5QtmTjOVLUbprcrOBwIKTt5SPb40M+4=
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH] arm-bsp/packagegroup-core-boot:cs1k: Remove GRUB from initramfs
Date: Thu, 23 Apr 2026 14:16:35 +0100
Message-ID: <20260423131635.506687-1-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Apr 2026 13:16:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7019

The initramfs for Corstone1000 is based on core-image-minimal, which has
GRUB included as a package. Corstone1000 uses U-Boot's efiloader to load
the initramfs and kernel and therefore does not require GRUB for boot.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 .../recipes-core/packagegroups/packagegroup-core-boot.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-core/packagegroups/packagegroup-=
core-boot.bbappend

diff --git a/meta-arm-bsp/recipes-core/packagegroups/packagegroup-core-bo=
ot.bbappend b/meta-arm-bsp/recipes-core/packagegroups/packagegroup-core-b=
oot.bbappend
new file mode 100644
index 00000000..61ff285b
--- /dev/null
+++ b/meta-arm-bsp/recipes-core/packagegroups/packagegroup-core-boot.bbap=
pend
@@ -0,0 +1,3 @@
+# Customise core boot package for corstone1000 initramfs by removing GRU=
B
+
+RDEPENDS:${PN}:remove:corstone1000 =3D "grub-efi"
\ No newline at end of file

