Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AEAC3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 11:55:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.77881.1720439716200188698
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 04:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BB5E1042;
	Mon,  8 Jul 2024 04:55:41 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F7F23F766;
	Mon,  8 Jul 2024 04:55:15 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 2/2] arm-bsp/optee: Remove OP-TEE OS v4.1 recipe
Date: Mon,  8 Jul 2024 13:55:00 +0200
Message-Id: <20240708115500.660234-3-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240708115500.660234-1-bence.balogh@arm.com>
References: <20240708115500.660234-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Jul 2024 11:55:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5870

From: Bence Balogh <bence.balogh@arm.com>

There no longer is a platform in meta-arm that uses this version of
OP-TEE OS. The last platform that did use it (Corstone-1000) now uses
a later version.
See `meta-arm-bsp/conf/machine/include/corstone1000.inc` for more info.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 meta-arm-bsp/recipes-security/optee/optee-os_4.1.0.bb | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_4.1.0.bb

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_4.1.0.bb b/meta=
-arm-bsp/recipes-security/optee/optee-os_4.1.0.bb
deleted file mode 100644
index bfb61eb2..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_4.1.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-DEPENDS +=3D "dtc-native"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-SRCREV =3D "18b424c23aa5a798dfe2e4d20b4bde3919dc4e99"
-SRC_URI +=3D " \
-    file://0003-optee-enable-clang-support.patch \
-   "
--=20
2.25.1


