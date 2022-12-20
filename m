Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CF9C4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:52:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.49385.1671540747076135013
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Dec 2022 04:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 917321688;
	Tue, 20 Dec 2022 04:53:07 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 313C93F703;
	Tue, 20 Dec 2022 04:52:26 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone 3/3] arm-bsp/linux-yocto: temporarily downgrade juno to 5.15.72
Date: Tue, 20 Dec 2022 12:52:20 +0000
Message-Id: <20221220125220.3239346-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221220125220.3239346-1-ross.burton@arm.com>
References: <20221220125220.3239346-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Dec 2022 12:52:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4208

The mailbox patches don't apply to 5.15.78 so until they can be rebased
and retested, pin the kernel to 5.15.72.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.15.bb=
append

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend =
b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
new file mode 100644
index 00000000..b0bbfeff
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
@@ -0,0 +1,3 @@
+# This is only needed until the juno patches are updated to the latest 5=
.15 release.
+LINUX_VERSION:juno =3D "5.15.72"
+SRCREV_machine:juno =3D "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
--=20
2.34.1


