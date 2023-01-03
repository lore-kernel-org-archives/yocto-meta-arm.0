Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640DAC4708E
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 20:06:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4165.1672776397245743760
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 12:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEB0F1042;
	Tue,  3 Jan 2023 12:07:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF0CD3F663;
	Tue,  3 Jan 2023 12:06:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][langdale] CI: fix builds with clang
Date: Tue,  3 Jan 2023 20:06:33 +0000
Message-Id: <20230103200633.2038845-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Jan 2023 20:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4227

meta-clang has a langdale branch now, so use that instead of master.

linux-yocto needs to use non-clang objcopy, apply the change locally
until the commit has been merged into meta-clang's langdale branch.

perf needs some patches backported to langdale, until that has been done
use gcc to build perf.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/clang.yml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ci/clang.yml b/ci/clang.yml
index bc6a18a3..6c909023 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,7 +4,6 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-    refspec: master
     patches:
       pixman:
         repo: meta-arm
@@ -13,3 +12,8 @@ repos:
 local_conf_header:
   clang: |
     TOOLCHAIN =3D "clang"
+    # Backport d89e06ad94a46f6810d0a8787004b71b8ecaf87d to langdale
+    OBJCOPY:pn-linux-yocto:toolchain-clang =3D "${HOST_PREFIX}objcopy"
+    # Perf needs fixes backported, use GCC for now
+    # https://lore.kernel.org/linux-perf-users/Y5d4k7fDxfRP7hcN@kernel.o=
rg/T/#t
+    TOOLCHAIN:pn-perf =3D "gcc"
--=20
2.34.1


