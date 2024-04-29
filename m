Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1BCC25B5C
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 16:39:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26354.1714408746297024697
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 09:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2FFDDA7;
	Mon, 29 Apr 2024 09:39:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C90A3F762;
	Mon, 29 Apr 2024 09:39:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 4/5] CI: remove 32-bit time_t workaround
Date: Mon, 29 Apr 2024 16:38:58 +0000
Message-Id: <20240429163859.507226-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429163859.507226-1-ross.burton@arm.com>
References: <20240429163859.507226-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 16:39:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5629

This is now in the recipe itself, so remove it from CI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/external-gccarm.yml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
index b55d0c96..9c1eba9d 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -8,6 +8,3 @@ local_conf_header:
     SKIP_RECIPE[gcc-cross-arm] =3D "Using external toolchain"
     TCMODE =3D "external-arm"
     EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/toolchains/${TARGET_ARCH}"
-    # Temporary workaround for a number binaries in the toolchains that =
are using 32bit timer API
-    # This must be done here instead of the recipe because of all the li=
braries in the toolchain have the issue
-    INSANE_SKIP:append =3D " 32bit-time"
--=20
2.34.1


