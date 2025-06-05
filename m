Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF35C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:31:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7597.1749130284801680581
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 06:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ACBC1692;
	Thu,  5 Jun 2025 06:31:07 -0700 (PDT)
Received: from MGC575JXM4.emea.arm.com (unknown [10.34.124.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA03A3F5A1;
	Thu,  5 Jun 2025 06:31:23 -0700 (PDT)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20Faure?= <clement.faure@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-firmware-a: corstone1000: Upgrade TF-A to 2.12.1
Date: Thu,  5 Jun 2025 15:31:07 +0200
Message-Id: <20250605133108.35177-3-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250605133108.35177-1-clement.faure@arm.com>
References: <20250605133108.35177-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Jun 2025 13:31:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6531

From: Cl=C3=A9ment Faure <clement.faure@arm.com>

Upgrade trusted-firmware-a to 2.12.1 for Corstone-1000
When GENERATE_COT is enabled, use the Yocto dependency cot-dt2c instead
of installing it with Poetry.

Signed-off-by: Cl=C3=A9ment Faure <clement.faure@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc          | 4 ++--
 .../trusted-firmware-a/trusted-firmware-a-corstone1000.inc  | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 6d68cd0f..bbaeee29 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -7,8 +7,8 @@ PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.11.%"
-PREFERRED_VERSION_tf-a-tests ?=3D "2.10.%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.12.%"
+PREFERRED_VERSION_tf-a-tests ?=3D "2.12.%"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index f6677f70..5e41ab6e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -56,3 +56,9 @@ EXTRA_OEMAKE:append =3D " \
                         FVP_USE_GIC_DRIVER=3DFVP_GICV2 \
                         "
 EXTRA_OEMAKE:append:corstone1000-fvp =3D "${@bb.utils.contains('MACHINE_=
FEATURES', 'corstone1000_fvp_smp', ' ENABLE_MULTICORE=3D1', '', d)}"
+
+# If GENERATE_COT is set, then TF-A will try to use local poetry install
+# to run the python cot-dt2c command.  Disable the local poetry and use
+# the provided cot-dt2c.
+EXTRA_OEMAKE +=3D "POETRY=3D''"
+DEPENDS +=3D "cot-dt2c-native"

