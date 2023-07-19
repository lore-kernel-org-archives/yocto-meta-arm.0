Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C671EB64DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 01:22:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4286.1689729767641536553
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 18:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93ACA143D
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jul 2023 18:23:30 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C2A53F67D
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jul 2023 18:22:47 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 8/8] ci/clang: add llvm-native from clang README
Date: Tue, 18 Jul 2023 20:22:40 -0500
Message-Id: <20230719012240.3567881-8-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230719012240.3567881-1-jon.mason@arm.com>
References: <20230719012240.3567881-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 01:22:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4902

The following error is seen:
ERROR: Nothing PROVIDES 'llvm-native' (but virtual:native:/builds/jonmaso=
n00/meta-arm/work/build/../poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb=
 DEPENDS on or otherwise requires it). Close matches:
  ovmf-native
  rust-llvm-native
  vim-native

Work around this by using the llvm-native from meta-clang

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/clang.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ci/clang.yml b/ci/clang.yml
index ecfd73b2..b9425fa7 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -8,6 +8,12 @@ repos:
 local_conf_header:
   toolchain: |
     TOOLCHAIN =3D "clang"
+    PREFERRED_PROVIDER_llvm =3D "clang"
+    PREFERRED_PROVIDER_llvm-native =3D "clang-native"
+    PREFERRED_PROVIDER_nativesdk-llvm =3D "nativesdk-clang"
+    PROVIDES:pn-clang =3D "llvm"
+    PROVIDES:pn-clang-native =3D "llvm-native"
+    PROVIDES:pn-nativesdk-clang =3D "nativesdk-llvm"
     # This is needed to stop bitbake getting confused about what clang/l=
lvm is
     # being used, see https://github.com/kraj/meta-clang/pull/766
     BBMASK +=3D "/meta/recipes-devtools/llvm/llvm.*\.bb"
--=20
2.30.2


