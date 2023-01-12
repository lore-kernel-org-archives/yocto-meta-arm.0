Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA80C678D9
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52242.1673521382711466253
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 03:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B2611063;
	Thu, 12 Jan 2023 03:03:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E97E43F67D;
	Thu, 12 Jan 2023 03:03:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 05/10] CI: remove obsolete linux-yocto workarounds
Date: Thu, 12 Jan 2023 11:02:52 +0000
Message-Id: <20230112110257.2070363-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 11:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4268

Now we're using master these workarounds are not needed anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/clang.yml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/ci/clang.yml b/ci/clang.yml
index 6c909023..59265f41 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -12,8 +12,3 @@ repos:
 local_conf_header:
   clang: |
     TOOLCHAIN =3D "clang"
-    # Backport d89e06ad94a46f6810d0a8787004b71b8ecaf87d to langdale
-    OBJCOPY:pn-linux-yocto:toolchain-clang =3D "${HOST_PREFIX}objcopy"
-    # Perf needs fixes backported, use GCC for now
-    # https://lore.kernel.org/linux-perf-users/Y5d4k7fDxfRP7hcN@kernel.o=
rg/T/#t
-    TOOLCHAIN:pn-perf =3D "gcc"
--=20
2.34.1


