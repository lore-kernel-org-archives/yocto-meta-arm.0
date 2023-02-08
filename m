Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25919C636D7
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 13:34:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8339.1675863237032480140
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 05:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DCA61477;
	Wed,  8 Feb 2023 05:34:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34E0F3F703;
	Wed,  8 Feb 2023 05:33:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm/linux-yocto: remove obsolete 5.19 bbappend
Date: Wed,  8 Feb 2023 13:33:53 +0000
Message-Id: <20230208133353.1969816-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208133353.1969816-1-ross.burton@arm.com>
References: <20230208133353.1969816-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Feb 2023 13:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4373

This bbappend is only used by qemuarm*, which now use 6.1, so this can
be removed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbapp=
end

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend b/m=
eta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
deleted file mode 100644
index 7dec2f5c..00000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-# enable arm_ffa regardless on 5.19
-SRC_URI:append:qemuarm =3D " \
-    file://tee.cfg \
-    file://arm-ffa-transport.cfg \
-"
-SRC_URI:append:qemuarm64 =3D " \
-    file://tee.cfg \
-    file://arm-ffa-transport.cfg \
-"
--=20
2.34.1


