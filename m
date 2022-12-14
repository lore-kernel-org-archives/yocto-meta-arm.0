Return-Path: <qi.feng@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43541C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 07:47:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.97823.1671004019869620126
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 23:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: qi.feng@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86FAFFEC;
	Tue, 13 Dec 2022 23:47:39 -0800 (PST)
Received: from ais-sh-xeon.shanghai.arm.com (unknown [10.169.212.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5E2933F73B;
	Tue, 13 Dec 2022 23:46:57 -0800 (PST)
From: Qi Feng <qi.feng@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Robbie.Cao@arm.com,
	qi.feng@arm.com,
	Robbie Cao <robbie.cao@arm.com>
Subject: [PATCH] arm/fvp-base-r-aem: upgrade to version 11.20.15
Date: Wed, 14 Dec 2022 15:46:44 +0800
Message-Id: <20221214074644.2891642-1-qi.feng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Dec 2022 07:47:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4180

From: Robbie Cao <robbie.cao@arm.com>

Update version in documentation.

Issue-Id: SCM-4874
Signed-off-by: Robbie Cao <robbie.cao@arm.com>
Change-Id: Ic66bdcdc5c6309331f80faab6eaf2e3e936a5da4
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md              | 4 ++--
 ...{fvp-base-r-aem_11.19.14.bb =3D> fvp-base-r-aem_11.20.15.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-r-aem_11.19.14.bb =3D> fv=
p-base-r-aem_11.20.15.bb} (85%)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 9127a6ce..e29aad34 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -27,9 +27,9 @@ The fvp-baser-aemv8r64 Yocto MACHINE supports the follo=
wing BSP components,
 where either a standard or Real-Time Linux kernel (PREEMPT\_RT) can be b=
uilt
 and run:
=20
- - FVP_Base_AEMv8R: v11.19.14
+ - FVP_Base_AEMv8R: v11.20.15
  - boot-wrapper-aarch64: provides PSCI support
- - U-Boot: v2022.04 - provides UEFI services
+ - U-Boot: v2022.07 - provides UEFI services
  - Linux kernel: linux-yocto-5.15
  - Linux kernel with PREEMPT\_RT support: linux-yocto-rt-5.15
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.19.14.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb
similarity index 85%
rename from meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.19.14.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb
index 3ef08912..f5175b2c 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.19.14.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
=20
-SRC_URI[sha256sum] =3D "788ede659414af36a2d09489e400c4d822c859b726565f1f=
171bc3102a9413d0"
+SRC_URI[sha256sum] =3D "c252616489b79fffa3bb721255b1c99ff4ee8c38e4beebce=
4fa05862a3195fe9"
=20
 MODEL_CODE =3D "FVP_Base_AEMv8R"
--=20
2.25.1


