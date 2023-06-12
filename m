Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F07C88CB4
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 14:57:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.61510.1686581823152499441
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 07:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAE0D13D5;
	Mon, 12 Jun 2023 07:57:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48CE53F5A1;
	Mon, 12 Jun 2023 07:57:02 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/4] arm-toolchain/external-arm: remove -fcanon-prefix-map from DEBUG_PREFIX_MAP
Date: Mon, 12 Jun 2023 15:56:58 +0100
Message-Id: <20230612145659.934478-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612145659.934478-1-ross.burton@arm.com>
References: <20230612145659.934478-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jun 2023 14:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4760

From: Ross Burton <ross.burton@arm.com>

The binaryh Arm compiler is based on GCC 12. Remove this GCC 13-specific
option until the next release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.i=
nc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 71fac597..61a9c0a7 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -4,6 +4,9 @@
=20
 EXTERNAL_TOOLCHAIN ?=3D "/usr/local/arm-binary-toolchain/${TARGET_ARCH}"
=20
+# oe-core passes this by default because it assumes GCC 13. This can be =
removed when Arm GCC is 13.1+.
+DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
+
 TOOLCHAIN_PATH_ADD =3D "${EXTERNAL_TOOLCHAIN}/bin:"
 PATH =3D. "${TOOLCHAIN_PATH_ADD}"
=20
--=20
2.34.1


