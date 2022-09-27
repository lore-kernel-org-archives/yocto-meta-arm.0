Return-Path: <Jiacheng.Tang@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31048C6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 13:14:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10574.1664284475577114650
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Sep 2022 06:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jiacheng.tang@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE2C8D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Sep 2022 06:14:41 -0700 (PDT)
Received: from a010290.shanghai.arm.com (unknown [10.169.188.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47C5F3F792
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Sep 2022 06:14:34 -0700 (PDT)
From: Jiacheng Tang <jiacheng.tang@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/fvp-base-r-aem: upgrade to version 11.19.14
Date: Tue, 27 Sep 2022 21:14:12 +0800
Message-Id: <20220927131412.1502836-1-jiacheng.tang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 27 Sep 2022 13:14:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3844

Update version in documentation.

Issue-Id: SCM-5168
Signed-off-by: Jiacheng Tang <jiacheng.tang@arm.com>
Change-Id: Iea0815fb7e99997f45f7882c47138f0f9dfac0ac
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md                | 2 +-
 .../{fvp-base-r-aem_11.18.16.bb =3D> fvp-base-r-aem_11.19.14.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-r-aem_11.18.16.bb =3D> fv=
p-base-r-aem_11.19.14.bb} (85%)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 6986afd3..9127a6ce 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -27,7 +27,7 @@ The fvp-baser-aemv8r64 Yocto MACHINE supports the follo=
wing BSP components,
 where either a standard or Real-Time Linux kernel (PREEMPT\_RT) can be b=
uilt
 and run:
=20
- - FVP_Base_AEMv8R: v11.18.16
+ - FVP_Base_AEMv8R: v11.19.14
  - boot-wrapper-aarch64: provides PSCI support
  - U-Boot: v2022.04 - provides UEFI services
  - Linux kernel: linux-yocto-5.15
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.19.14.bb
similarity index 85%
rename from meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.19.14.bb
index e8704c2f..3ef08912 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.19.14.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
=20
-SRC_URI[sha256sum] =3D "a7a5ee0b7f3b84a2e98e136a6f3ab648e4b6b5ad365186a3=
97595f3f7c69f558"
+SRC_URI[sha256sum] =3D "788ede659414af36a2d09489e400c4d822c859b726565f1f=
171bc3102a9413d0"
=20
 MODEL_CODE =3D "FVP_Base_AEMv8R"
--=20
2.25.1


