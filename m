Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00061C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 14:12:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8833.1652451155096835309
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 07:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2F6E1477;
	Fri, 13 May 2022 07:12:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B0FC3F5A1;
	Fri, 13 May 2022 07:12:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/5] arm-bsp/optee-test: clean up bbappends
Date: Fri, 13 May 2022 15:12:28 +0100
Message-Id: <20220513141231.2513449-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513141231.2513449-1-ross.burton@arm.com>
References: <20220513141231.2513449-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 May 2022 14:12:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3395

The 3.14 bbappend sets DEPENDS which are redundant as they're already
set in the base recipe.

Remove the unused 3.16 bbappend.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/optee/optee-test_3.14.0.bbappend       | 2 --
 .../recipes-security/optee/optee-test_3.16.0.bbappend       | 6 ------
 2 files changed, 8 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.16.0=
.bbappend

diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
index f8194d0e..490b3500 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
@@ -1,7 +1,5 @@
 # Machine specific configurations
=20
-DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-native"
-
 MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
 MACHINE_OPTEE_TEST_REQUIRE:tc =3D "optee-test-tc.inc"
=20
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
deleted file mode 100644
index 490b3500..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
-MACHINE_OPTEE_TEST_REQUIRE:tc =3D "optee-test-tc.inc"
-
-require ${MACHINE_OPTEE_TEST_REQUIRE}
--=20
2.25.1


