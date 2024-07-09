Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3693CC3DA42
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 18:27:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3123.1720549676090646459
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 11:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7900212FC
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jul 2024 11:28:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E1073F762
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jul 2024 11:27:54 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: remove unnecessary clang settings
Date: Tue,  9 Jul 2024 14:27:53 -0400
Message-Id: <20240709182753.33263-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jul 2024 18:27:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5874

With the resolution of meta-clang issue 766 and
OE-Core 15d09b02b2632ab1cabc3b1bd9f521e6d3d3b83f
many of the settings are no longer necessary to be set as part of our
CI.  Remove them, as it is causing other issues with CI.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/clang.yml | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/ci/clang.yml b/ci/clang.yml
index 9b2d194a3a11..402292a6b86d 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -10,12 +10,3 @@ repos:
 local_conf_header:
   toolchain: |
     TOOLCHAIN =3D "clang"
-    PREFERRED_PROVIDER_llvm =3D "clang"
-    PREFERRED_PROVIDER_llvm-native =3D "clang-native"
-    PREFERRED_PROVIDER_nativesdk-llvm =3D "nativesdk-clang"
-    PROVIDES:pn-clang =3D "llvm"
-    PROVIDES:pn-clang-native =3D "llvm-native"
-    PROVIDES:pn-nativesdk-clang =3D "nativesdk-llvm"
-    # This is needed to stop bitbake getting confused about what clang/l=
lvm is
-    # being used, see https://github.com/kraj/meta-clang/pull/766
-    BBMASK +=3D "/meta/recipes-devtools/llvm/llvm.*\.bb"
--=20
2.39.3 (Apple Git-146)


