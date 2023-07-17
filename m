Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D28C3DA40
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 19:32:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4083.1689622334199593634
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 12:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BADBD75;
	Mon, 17 Jul 2023 12:32:57 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8E20C3F67D;
	Mon, 17 Jul 2023 12:32:13 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 2/9] arm-bsp/u-boot: add temporary 2023.01 recipe
Date: Mon, 17 Jul 2023 14:32:00 -0500
Message-Id: <20230717193207.3562364-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230717193207.3562364-1-jon.mason@arm.com>
References: <20230717193207.3562364-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 19:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4886

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.01.bb | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.01.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.01.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2023.01.bb
new file mode 100644
index 00000000..2dd5e04a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.01.bb
@@ -0,0 +1,4 @@
+require recipes-bsp/u-boot/u-boot-common.inc
+require recipes-bsp/u-boot/u-boot.inc
+
+SRCREV =3D "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"
--=20
2.30.2


