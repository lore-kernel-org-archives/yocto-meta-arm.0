Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DF1FEFB4F
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 13:52:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96090.1772200358768691809
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 05:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 905CC14BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 05:52:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8BB993F62B
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 05:52:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: don't testimage core-image-initramfs-boot
Date: Fri, 27 Feb 2026 13:52:34 +0000
Message-ID: <20260227135234.2011194-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 13:52:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6921

A recent change to image dependencies in oe-core master[1] means that
TESTIMAGE_AUTO tries to test more images than before.

Explicitly reset TESTIMAGE_AUTO for core-image-initramfs-boot so that it
doesn't try to testimage an initramfs.

[1] oe-core b75c21fb950 ("image_types_wic.bbclass: add depend on initramf=
s")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/testimage.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ci/testimage.yml b/ci/testimage.yml
index afc53ed45c..fea713e040 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -9,6 +9,8 @@ local_conf_header:
   testimage: |
     IMAGE_CLASSES +=3D "testimage"
     TESTIMAGE_AUTO =3D "1"
+    # Don't testimage initramfs
+    TESTIMAGE_AUTO:pn-core-image-initramfs-boot =3D "0"
   kvm: |
     QEMU_USE_KVM =3D ""
   slirp: |
--=20
2.43.0


