Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.25984.1628791783658090773
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 11:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 336BF40C8E;
	Thu, 12 Aug 2021 18:09:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMzjBqqmXfv1; Thu, 12 Aug 2021 18:09:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EB1640BEC;
	Thu, 12 Aug 2021 18:09:40 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5928A174655;
	Thu, 12 Aug 2021 14:09:39 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH] arm-toolchain: grub: fix do_configure() breakage with external-arm toolchain
Date: Thu, 12 Aug 2021 14:08:55 -0400
Message-Id: <1628791735-4366-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

grub and grub-efi break in do_configure() when using external-arm toolchain:

| checking for aarch64-poky-linux-objcopy... no
| checking for objcopy... objcopy
| checking for aarch64-poky-linux-strip... no
| checking for strip... strip
| checking for aarch64-poky-linux-nm... no
| checking for nm... nm
| checking for aarch64-poky-linux-ranlib... no
| checking for ranlib... ranlib
...
| checking whether objcopy works for absolute addresses... configure: error: objcopy cannot create binary files

That is due to external-arm toolchain's target triplet aarch64-none-linux-gnu
being different from OE triplet like aarch64-poky-linux and configure script
trying to use it to find binutils binaries like objcopy, falling back to host
ones.

Help configure script to find correct objcopy and other binaries by passing
the correct target triplet with --target parameter set to EAT_TARGET_SYS,
overriding the default OE one.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Cc: Tom Rini <trini@konsulko.com>
---
 meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend

diff --git a/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend b/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
new file mode 100644
index 0000000..3bdfe3d
--- /dev/null
+++ b/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
@@ -0,0 +1,9 @@
+# When external-arm toolchain is not in use, EAT_TARGET_SYS is undefined,
+# causing below :append expansion to break - just weakly set it to empty
+EAT_TARGET_SYS ?= ""
+
+# grub uses --target triplet to find binutils binaries such as objcopy
+# Since external-arm toolchain uses aarch64-none-linux-gnu triplet,
+# OE-defined TARGET_SYS differs from EAT_TARGET_SYS used by external-arm
+# toolchain, grub needs passing the correct --target to configure script
+CONFIGUREOPTS:append:class-target = "${@['',' --target=${EAT_TARGET_SYS}'][d.getVar('TCMODE') == 'external-arm']}"
-- 
2.7.4

