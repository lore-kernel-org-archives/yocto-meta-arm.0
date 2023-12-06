Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5C6C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.32144.1701871222770100200
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F0B41474;
	Wed,  6 Dec 2023 06:01:08 -0800 (PST)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 522913F5A1;
	Wed,  6 Dec 2023 06:00:21 -0800 (PST)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] corstone1000:arm-bsp/optee: Update optee to v4.0
Date: Wed,  6 Dec 2023 14:00:06 +0000
Message-Id: <20231206140006.36213-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206140006.36213-1-harsimransingh.tungal@arm.com>
References: <20231206140006.36213-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Dec 2023 14:00:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5295

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This change updates the optee version to v4.0

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc          | 2 +-
 meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bb=
append

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 749350e1..063a315b 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -36,7 +36,7 @@ UBOOT_ARCH =3D "arm"
 UBOOT_EXTLINUX =3D "0"
=20
 #optee
-PREFERRED_VERSION_optee-os ?=3D "3.22%"
+PREFERRED_VERSION_optee-os ?=3D "4.0.%"
 PREFERRED_VERSION_optee-client ?=3D "3.22%"
 EXTRA_IMAGEDEPENDS +=3D "optee-os"
 OPTEE_ARCH =3D "arm64"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend =
b/meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend
new file mode 100644
index 00000000..6c94303a
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend
@@ -0,0 +1,6 @@
+
+# Machine specific configurations
+MACHINE_OPTEE_OS_REQUIRE ?=3D ""
+MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D "optee-os-corstone1000-common.=
inc"
+
+require ${MACHINE_OPTEE_OS_REQUIRE}
--=20
2.25.1


