Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDE7C4332F
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 14:12:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8834.1652451156266918080
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 07:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1C0A143D;
	Fri, 13 May 2022 07:12:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79CFD3F5A1;
	Fri, 13 May 2022 07:12:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/5] arm-bsp/optee-client: remove bbappends
Date: Fri, 13 May 2022 15:12:30 +0100
Message-Id: <20220513141231.2513449-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513141231.2513449-1-ross.burton@arm.com>
References: <20220513141231.2513449-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 May 2022 14:12:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3397

These bbappends do nothing, so remove them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-security/optee/optee-client-tc.inc     | 3 ---
 .../recipes-security/optee/optee-client_3.14.0.bbappend     | 6 ------
 .../recipes-security/optee/optee-client_3.16.0.bbappend     | 6 ------
 3 files changed, 15 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client-tc.i=
nc
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client_3.14=
.0.bbappend
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client_3.16=
.0.bbappend

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client-tc.inc b/me=
ta-arm-bsp/recipes-security/optee/optee-client-tc.inc
deleted file mode 100644
index f3fb7cd0..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client-tc.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-# TC specific configuration
-
-# Change in SHA, extra patches specific to TC0 are added in this file.
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbap=
pend b/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
deleted file mode 100644
index d2b023b1..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_CLIENT_REQUIRE ?=3D ""
-MACHINE_OPTEE_CLIENT_REQUIRE:tc =3D "optee-client-tc.inc"
-
-require ${MACHINE_OPTEE_CLIENT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbap=
pend b/meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappend
deleted file mode 100644
index d2b023b1..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_CLIENT_REQUIRE ?=3D ""
-MACHINE_OPTEE_CLIENT_REQUIRE:tc =3D "optee-client-tc.inc"
-
-require ${MACHINE_OPTEE_CLIENT_REQUIRE}
--=20
2.25.1


