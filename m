Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8921DC04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 16:39:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26512.1714408747070903807
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 09:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 603A92F4;
	Mon, 29 Apr 2024 09:39:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A1133F762;
	Mon, 29 Apr 2024 09:39:06 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 5/5] CI: disable ptest in external-gccarm builds
Date: Mon, 29 Apr 2024 16:38:59 +0000
Message-Id: <20240429163859.507226-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429163859.507226-1-ross.burton@arm.com>
References: <20240429163859.507226-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 16:39:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5630

We recently switched the CI to not disable ptest, but this breaks builds
that use the GCC binaries built by Arm (external-arm-toolchain). This is
because the external-arm-toolchain recipe can't build packages for the
target, and the standard oe-core gcc recipes assume that they're being
built with themselves and make assumptions, specifically that libunwind
was enabled and headers can be copied directly from the sysroot.

This is a bigger problem that should be solved somehow, but for now we
can just remove ptest in the external-gccarm CI jobs which removes gcc
from the builds (it comes in via elfutils-ptest RDEPENDS).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/external-gccarm.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
index 9c1eba9d..8985a1ba 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -8,3 +8,6 @@ local_conf_header:
     SKIP_RECIPE[gcc-cross-arm] =3D "Using external toolchain"
     TCMODE =3D "external-arm"
     EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/toolchains/${TARGET_ARCH}"
+    # Disable ptest as this pulls target compilers, which don't
+    # work with external toolchain currently
+    DISTRO_FEATURES:remove =3D "ptest"
--=20
2.34.1


