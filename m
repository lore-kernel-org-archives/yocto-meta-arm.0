Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58496CCA483
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 20:14:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.45396.1658261637597654838
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 13:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A260115A1;
	Tue, 19 Jul 2022 13:13:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACE8D3F766;
	Tue, 19 Jul 2022 13:13:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/9] CI: ignore buildpaths QA check in clang builds
Date: Tue, 19 Jul 2022 21:13:46 +0100
Message-Id: <20220719201353.1467716-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719201353.1467716-1-ross.burton@arm.com>
References: <20220719201353.1467716-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Jul 2022 20:14:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3575

If clang builds assembler code the debug symbols contain unmapped build
paths which trigger the buildpaths QA check. This bug has been filed
with upstream:

https://github.com/llvm/llvm-project/issues/56609

Until it is fixed, exclude buildpaths from clang builds so that CI can
pass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/clang.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ci/clang.yml b/ci/clang.yml
index a2063f19..99ca8d43 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -8,3 +8,6 @@ repos:
 local_conf_header:
   clang: |
     TOOLCHAIN =3D "clang"
+    # Clang causes more binaries to have buildpaths in the debug symbols
+    # https://github.com/llvm/llvm-project/issues/56609
+    WARN_QA:remove =3D "buildpaths"
--=20
2.34.1


