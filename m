Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39233CAC587
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:03:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13065.1757495032750488716
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 02:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE79F1756
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 02:03:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A35E83F63F
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 02:03:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp/corstone1000: add coresight MACHINE_FEATURE
Date: Wed, 10 Sep 2025 10:03:45 +0100
Message-ID: <20250910090346.1623394-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910090346.1623394-1-ross.burton@arm.com>
References: <20250910090346.1623394-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 09:03:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6693

The Corstone1000 supports Arm CoreSight, so add it to MACHINE_FEATURES.
Note that currently the FVP model doesn't support this[1] so we only
enable it for MPS3.

This is useful because oe-core's perf recipe will now enable coresight
support automatically if this feature is present[1].

[1] https://developer.arm.com/documentation/100966/1128/Arm--Corstone-100=
0-FVP/Corstone-1000-FVP-modeled-components
[2] oe-core c455bd03910 ("perf: enable coresight if enabled in MACHINE_FE=
ATURES")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/corstone1000-mps3.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/corstone1000-mps3.conf b/meta-arm-=
bsp/conf/machine/corstone1000-mps3.conf
index 88d01b096f..cefe184bf7 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-mps3.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-mps3.conf
@@ -9,3 +9,6 @@ TFA_TARGET_PLATFORM =3D "fpga"
 PLATFORM_IS_FVP =3D "FALSE"
=20
 TS_PLATFORM =3D "arm/corstone1000-mps3"
+
+# Unlike the FVP, MPS3 supports CoreSight
+MACHINE_FEATURES +=3D "coresight"
--=20
2.43.0


