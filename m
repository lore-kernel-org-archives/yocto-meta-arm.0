Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8031C88CB7
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 14:57:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.61509.1686581822548704967
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 07:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E0C52F4;
	Mon, 12 Jun 2023 07:57:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 906163F5A1;
	Mon, 12 Jun 2023 07:57:01 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/4] arm-bsp/external-system: remove -fcanon-prefix-map from DEBUG_PREFIX_MAP
Date: Mon, 12 Jun 2023 15:56:57 +0100
Message-Id: <20230612145659.934478-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612145659.934478-1-ross.burton@arm.com>
References: <20230612145659.934478-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jun 2023 14:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4758

From: Ross Burton <ross.burton@arm.com>

This recipe uses the binary Arm compiler, which is based on GCC 12.
Remove this GCC 13-specific option until the next release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/external-system/external-system_0.1.0.bb       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1=
.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index dce29a93..8b09ab0d 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -21,6 +21,9 @@ PRODUCT =3D "corstone-1000"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
+# remove once arm-none-eabi-gcc updates to 13 or newer like poky
+DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
+
 LDFLAGS[unexport] =3D "1"
=20
 do_compile() {
--=20
2.34.1


