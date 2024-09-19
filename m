Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E82CF395C
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 15:10:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22114.1726758628670276838
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Sep 2024 08:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FA2BFEC
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 08:10:57 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 885B63F71A
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 08:10:27 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain: remove libmount-mountfd-support when using binary toolchain
Date: Thu, 19 Sep 2024 11:10:26 -0400
Message-Id: <20240919151026.76035-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 15:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6086

util-linux is failing when compiling with:
| configure: error: libmount_mountfd_support selected, but required mount=
 FDs based API not available
Remove this feature when building with the binary toolchain to avoid
this issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arm-toolchain/recipes-core/util-linux/util-linux=
_%.bbappend

diff --git a/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbap=
pend b/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend
new file mode 100644
index 000000000000..75227a567516
--- /dev/null
+++ b/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend
@@ -0,0 +1 @@
+PACKAGECONFIG:remove =3D "${@bb.utils.contains('TCMODE', 'external-arm',=
 'libmount-mountfd-support', '' , d)}"
--=20
2.39.3 (Apple Git-146)


