Return-Path: <gergely.kovacs2@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F3AC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 09:00:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.70798.1744102832228530597
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 02:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gergely.kovacs2@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BD601688;
	Tue,  8 Apr 2025 02:00:32 -0700 (PDT)
Received: from ger-kv.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B91CD3F694;
	Tue,  8 Apr 2025 02:00:30 -0700 (PDT)
From: Gergely Kovacs <gergely.kovacs2@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gergely Kovacs <Gergely.Kovacs2@arm.com>
Subject: [PATCH 1/1] arm/trusted-firmware-a: remove optee-os dependency from tests
Date: Tue,  8 Apr 2025 08:59:37 +0000
Message-Id: <20250408085937.2068053-1-gergely.kovacs2@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Apr 2025 09:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6453

From: Gergely Kovacs <Gergely.Kovacs2@arm.com>

The TF-A tests should not depend on OPTEE-OS

Signed-off-by: Gergely Kovacs <Gergely.Kovacs2@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb | 2 --
 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
index 9e505d7a..39fddd9b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
@@ -12,8 +12,6 @@ SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};nobran=
ch=3D1"
 SRCBRANCH =3D "master"
 SRCREV =3D "8917cf8b5eeb409b63256076d0dc35c60930ce18"
=20
-DEPENDS +=3D "optee-os"
-
 EXTRA_OEMAKE +=3D "USE_NVM=3D0"
 EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
 EXTRA_OEMAKE +=3D "DEBUG=3D1"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
index 77c36a47..31b0964b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
@@ -13,8 +13,6 @@ SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=
=3D${SRCBRANCH} \
 SRCBRANCH =3D "master"
 SRCREV =3D "6a113621a9efdc143e9270b1789046cd7d9cdfb1"
=20
-DEPENDS +=3D "optee-os"
-
 EXTRA_OEMAKE +=3D "USE_NVM=3D0"
 EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
 EXTRA_OEMAKE +=3D "DEBUG=3D1"

