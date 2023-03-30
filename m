Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61F5C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 16:38:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30541.1680194301596777944
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 09:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 917351650;
	Thu, 30 Mar 2023 09:39:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C12903F6C4;
	Thu, 30 Mar 2023 09:38:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 6/6] CI: mask poky's llvm if we're using clang
Date: Thu, 30 Mar 2023 17:38:15 +0100
Message-Id: <20230330163815.3677638-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330163815.3677638-1-ross.burton@arm.com>
References: <20230330163815.3677638-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 16:38:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4517

meta-clang's clang recipe has an irritating interaction with oe-core's
llvm recipe which can result in build warnings, which cause builds to
fail in our pedantic CI.

The current best known workaround is to simply mask out the llvm recipes
if clang is being used.

For more details, see https://github.com/kraj/meta-clang/pull/766.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/clang.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ci/clang.yml b/ci/clang.yml
index 7559f6b0..eeee7852 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -8,3 +8,6 @@ repos:
 local_conf_header:
   toolchain: |
     TOOLCHAIN =3D "clang"
+    # This is needed to stop bitbake getting confused about what clang/l=
lvm is
+    # being used, see https://github.com/kraj/meta-clang/pull/766
+    BBMASK +=3D "/meta/recipes-devtools/llvm/llvm.*\.bb"
--=20
2.34.1


