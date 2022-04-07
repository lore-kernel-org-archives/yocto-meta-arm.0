Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A4BC4167D
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.404.1649347770159843561
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 09:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C339212FC
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 711A23F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] qemuarm64-secureboot: set root device correctly
Date: Thu,  7 Apr 2022 17:09:23 +0100
Message-Id: <20220407160925.3809765-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407160925.3809765-1-ross.burton@arm.com>
References: <20220407160925.3809765-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3259

The default root device is /dev/vda, because typically a bare filesystem
is mounted there.

However, qemuarm64-secureboot uses a disk image with partitions, so this
should be /dev/vda2.  Currently this works because qemuarm64-secureboot
has an extlinux.conf which explicitly sets the root device, but we're
working at removing that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
index 22fb1d3e..a467b204 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -14,6 +14,7 @@ QB_DEFAULT_FSTYPE =3D "wic.qcow2"
 QB_DEFAULT_BIOS =3D "flash.bin"
 QB_FSINFO =3D "wic:no-kernel-in-fs"
 QB_ROOTFS_OPT =3D ""
+QB_KERNEL_ROOT =3D "/dev/vda2"
=20
 IMAGE_FSTYPES +=3D "wic wic.qcow2"
=20
--=20
2.25.1


