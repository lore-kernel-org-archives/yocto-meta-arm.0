Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED10C54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52244.1673521384074636372
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 03:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA1EEFEC;
	Thu, 12 Jan 2023 03:03:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 429A93F67D;
	Thu, 12 Jan 2023 03:03:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 07/10] arm-bsp/fvp-base*: no need to remove rng-tools from openssh
Date: Thu, 12 Jan 2023 11:02:54 +0000
Message-Id: <20230112110257.2070363-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 11:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4270

Since oe-core 868dfb4 rng-tools is no longer depended on by openssh, so
we don't need to remove it ourself.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf | 4 +---
 meta-arm-bsp/conf/machine/include/fvp-common.inc  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 06bef291..e3f5bfb3 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -25,9 +25,7 @@ EFI_PROVIDER ?=3D "grub-efi"
 MACHINE_FEATURES:append =3D " efi"
=20
 # As this is a virtual target that will not be used in the real world th=
ere is
-# no need for real SSH keys.  Disable rng-tools (which takes too long to
-# initialise) and install the pre-generated keys.
-PACKAGECONFIG:remove:pn-openssh =3D "rng-tools"
+# no need for real SSH keys.
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 # testimage configuration
diff --git a/meta-arm-bsp/conf/machine/include/fvp-common.inc b/meta-arm-=
bsp/conf/machine/include/fvp-common.inc
index b10977c6..b6fc74da 100644
--- a/meta-arm-bsp/conf/machine/include/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/include/fvp-common.inc
@@ -19,9 +19,7 @@ KERNEL_DEVICETREE =3D "arm/fvp-base-revc.dtb"
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
=20
 # As this is a virtual target that will not be used in the real world th=
ere is
-# no need for real SSH keys.  Disable rng-tools (which takes too long to
-# initialise) and install the pre-generated keys.
-PACKAGECONFIG:remove:pn-openssh =3D "rng-tools"
+# no need for real SSH keys.
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 TEST_TARGET =3D "OEFVPTarget"
--=20
2.34.1


