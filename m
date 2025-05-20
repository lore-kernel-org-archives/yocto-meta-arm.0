Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBBBC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:28:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26829.1747762090804981086
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 10:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD1C91BCB;
	Tue, 20 May 2025 10:27:56 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B70BF3F5A1;
	Tue, 20 May 2025 10:28:09 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 5/9] base-fvp: enable branch protection in firmware
Date: Tue, 20 May 2025 19:27:43 +0200
Message-ID: <20250520172748.3439803-5-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520172748.3439803-1-gyorgy.szing@arm.com>
References: <20250520172748.3439803-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 17:28:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6512

Introduce a new machine feature called "arm-branch-protection". When set
TF-A, optee and Trusted Services SPs will be configured to enable PAC
and BTI. In addition the fvp-is configured to emulate arm-v8.5 and
PAC+BTI.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-fvp-base.inc         | 3 +++
 meta-arm/recipes-security/optee/optee-os.inc                   | 3 +++
 meta-arm/recipes-security/trusted-services/ts-sp-common.inc    | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-base.inc
index 4f0d34ea..bdf51f64 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -46,6 +46,9 @@ BL32 =3D "${@oe.utils.conditional('SPMC_IS_OPTEE', '1',=
\
 EXTRA_OEMAKE +=3D "${@oe.utils.conditional('SPMC_IS_OPTEE', '1', \
                 ' BL32=3D${BL32}', '', d)}"
=20
+# Enable memory safety in TF-A if machine supports it.
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-branch-=
protection', ' BRANCH_PROTECTION=3D1', '', d)}"
+
 # Generic configuration
 COMPATIBLE_MACHINE =3D "fvp-base"
 TFA_PLATFORM =3D "fvp"
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index 5a89e5ba..7f515cb4 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -31,6 +31,9 @@ EXTRA_OEMAKE +=3D " \
 EXTRA_OEMAKE +=3D " HOST_PREFIX=3D${HOST_PREFIX}"
 EXTRA_OEMAKE +=3D " CROSS_COMPILE64=3D${HOST_PREFIX}"
=20
+# Enable BTI in optee
+EXTREA_OEMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-branch=
-protection', ' CFG_CORE_BTI=3D1 CFG_TA_BTI=3D1 CFG_CORE_PAUTH=3Dy CFG_TA=
_PAUTH=3Dy', '', d)}"
+
 LDFLAGS[unexport] =3D "1"
 CPPFLAGS[unexport] =3D "1"
 AS[unexport] =3D "1"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc =
b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
index 65065880..eb89127b 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -41,3 +41,5 @@ OECMAKE_CXX_FLAGS:remove =3D "-D_FORTIFY_SOURCE=3D2"
 # will add a proper tooclhain option.
 OECMAKE_ARGS:remove =3D "-DCMAKE_TOOLCHAIN_FILE:FILEPATH=3D${WORKDIR}/to=
olchain.cmake"
=20
+# Set BranchProtection to standard
+EXTRA_OECMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-branch=
-protection', ' -DBRANCH_PROTECTION=3D1', '', d)}"
--=20
2.43.0


