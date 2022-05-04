Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCA6C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:13:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7089.1651673579685055819
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 684C01042;
	Wed,  4 May 2022 07:12:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E69E83F85F;
	Wed,  4 May 2022 07:12:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm-bsp/corstone1000-*-image: mark these as
 corstone1000-specific
Date: Wed,  4 May 2022 15:12:54 +0100
Message-Id: <20220504141254.785384-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504141254.785384-1-ross.burton@arm.com>
References: <20220504141254.785384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 14:13:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3356

We don't want world builds failing as they try to build these for machine=
s
other than Corstone 1000.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb           | 2 ++
 meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta=
-arm-bsp/recipes-bsp/images/corstone1000-image.bb
index d91d4578..ad5ec958 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
@@ -3,6 +3,8 @@ DESCRIPTION =3D "This is the main image which is the cont=
ainer of all the binaries
                generated for the Corstone1000 platform."
 LICENSE =3D "MIT"
=20
+COMPATIBLE_MACHINE =3D "corstone1000"
+
 inherit image
 inherit wic_nopt
=20
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image=
.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
index a11de1e2..b778a008 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
@@ -3,6 +3,8 @@ DESCRIPTION =3D "This is the main Linux image which inclu=
des an initramfs kernel/r
=20
 LICENSE =3D "MIT"
=20
+COMPATIBLE_MACHINE =3D "corstone1000"
+
 IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
=20
 inherit core-image
--=20
2.25.1


