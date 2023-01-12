Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69671C677F1
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.52031.1673521383406687899
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 03:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2754CAD7;
	Thu, 12 Jan 2023 03:03:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 960513F67D;
	Thu, 12 Jan 2023 03:03:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 06/10] Revert "CI: revert a meta-clang change which breaks pixman (thus, xserver)"
Date: Thu, 12 Jan 2023 11:02:53 +0000
Message-Id: <20230112110257.2070363-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 11:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4269

meta-clang now builds pixman with GCC until this is resolved.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...n-Do-not-use-clang-assembler-for-now.patch | 26 -------------------
 ci/clang.yml                                  |  4 ---
 2 files changed, 30 deletions(-)
 delete mode 100644 ci/0001-Revert-pixman-Do-not-use-clang-assembler-for-=
now.patch

diff --git a/ci/0001-Revert-pixman-Do-not-use-clang-assembler-for-now.pat=
ch b/ci/0001-Revert-pixman-Do-not-use-clang-assembler-for-now.patch
deleted file mode 100644
index 4ad66078..00000000
--- a/ci/0001-Revert-pixman-Do-not-use-clang-assembler-for-now.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-This causes illegal instruction faults in pixman, so xserver crashes.
-https://github.com/kraj/meta-clang/issues/696
-
-From 8659c5c5bec39dd43a1988b19d4cf30507a44679 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 28 Nov 2022 16:52:50 +0000
-Subject: [PATCH] Revert "pixman: Do not use clang assembler for now"
-
-This reverts commit 84dbafa42d8141b00da75d6664aef07c252a52ee.
----
- conf/nonclangable.conf | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/conf/nonclangable.conf b/conf/nonclangable.conf
-index 04112f4..b5db848 100644
---- a/conf/nonclangable.conf
-+++ b/conf/nonclangable.conf
-@@ -347,5 +347,4 @@ DEPENDS:append:pn-pixman:mips:toolchain-clang =3D " =
openmp"
- #| .endfunc
- #| ^
- CFLAGS:append:pn-pixman:arm:toolchain-clang =3D " -no-integrated-as"
--CFLAGS:append:pn-pixman:aarch64:toolchain-clang =3D " -no-integrated-as=
"
-=20
---=20
-2.34.1
-
diff --git a/ci/clang.yml b/ci/clang.yml
index 59265f41..a2063f19 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,10 +4,6 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-    patches:
-      pixman:
-        repo: meta-arm
-        path: ci/0001-Revert-pixman-Do-not-use-clang-assembler-for-now.p=
atch
=20
 local_conf_header:
   clang: |
--=20
2.34.1


