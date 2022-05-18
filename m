Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D365C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 11:07:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3522.1652872050873732062
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 04:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1FD723A;
	Wed, 18 May 2022 04:07:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 616B83F718;
	Wed, 18 May 2022 04:07:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] CI: remove preferred version from external-gccarm
Date: Wed, 18 May 2022 12:07:25 +0100
Message-Id: <20220518110727.3460305-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 11:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3425

I misunderstood how the external-arm-toolchain recipes were working, the
latest revision of the recipe works with both 10.3 and 11.2.

Clean up my mess by dropping the PREFERRED_VERSION from the CI, and rever=
t
the addition of versioned recipes.  Simply using the right tarball is
sufficient.

Thanks to Sumit Garg for noticing my mistake.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/external-gccarm.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
index 84c2cfa2..2af8b5e8 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -5,5 +5,4 @@ local_conf_header:
   cc: |
     SKIP_RECIPE[gcc-cross-arm] =3D "Using external toolchain"
     TCMODE =3D "external-arm"
-    PREFERRED_VERSION_external-arm-toolchain =3D "10.3-2021.07"
     EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/toolchains/${TARGET_ARCH}"
--=20
2.25.1


