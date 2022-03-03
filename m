Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0F7C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:12:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8968.1646298740750539366
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 01:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E23491480;
	Thu,  3 Mar 2022 01:12:19 -0800 (PST)
Received: from e125920.cambridge.arm.com (e125920.cambridge.arm.com
 [10.1.199.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35C813F73D;
	Thu,  3 Mar 2022 01:12:19 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/2] arm/fvp-base-r-aem: Update to version 11.17.21
Date: Thu,  3 Mar 2022 09:11:44 +0000
Message-Id: <20220303091144.473704-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303091144.473704-1-peter.hoyes@arm.com>
References: <20220303091144.473704-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 09:12:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3094

From: Peter Hoyes <Peter.Hoyes@arm.com>

Also update version and download link in meta-arm-bsp fvp-baser-aemv8r64
documentation

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I92ec616d25703ff74ed063918a1e4811bac9ff3f
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 12 ++++++------
 meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb  |  7 ++++---
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 44c755e..cbeb14b 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -106,18 +106,18 @@ For more details on kas, see https://kas.readthedoc=
s.io/.
=20
 To build the images for fvp-base machine, you also need to:
=20
- - download the ``FVP_Base_AEMv8R_11.15_14.tgz`` image AEM V8-R FVP Inst=
aller
+ - download the ``FVP_Base_AEMv8R_11.17_21.tgz`` image AEM V8-R FVP Inst=
aller
   (Linux) package from Arm's website:
-  https://silver.arm.com/download/download.tm?pv=3D4858045&p=3D4029857. =
You need
+  https://silver.arm.com/download/download.tm?pv=3D4865959&p=3D4029857. =
You need
    to have an account and be logged in to be able to download it
- - set absolute path to the ``FVP_Base_AEMv8R_11.15_14.tgz`` downloaded
+ - set absolute path to the ``FVP_Base_AEMv8R_11.17_21.tgz`` downloaded
    package in ``FVP_BASE_R_AEM_TARBALL_URI``
  - accept EULA in ``FVP_BASE_R_ARM_EULA_ACCEPT``
=20
=20
 The variables should be set like so:
=20
-    FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Base_AEMv=
8R_11.15_14.tgz"
+    FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Base_AEMv=
8R_11.17_21.tgz"
     FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
=20
 **Note:** The host machine should have at least 50 GBytes of free disk s=
pace
@@ -142,14 +142,14 @@ Fetch the meta-arm repository into a build director=
y:
 Building with the standard Linux kernel:
=20
     cd ~/fvp-baser-aemv8r64-build
-    export FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Ba=
se_AEMv8R_11.15_14.tgz"
+    export FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Ba=
se_AEMv8R_11.17_21.tgz"
     export FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
     kas build meta-arm/kas/fvp-baser-aemv8r64-bsp.yml
=20
 Building with the Real-Time Linux kernel (PREEMPT\_RT):
=20
     cd ~/fvp-baser-aemv8r64-build
-    export FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Ba=
se_AEMv8R_11.15_14.tgz"
+    export FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Ba=
se_AEMv8R_11.17_21.tgz"
     export FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
     kas build meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-r-aem.bb
index 6c612ab..911cc00 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
@@ -2,13 +2,14 @@ require fvp-envelope.inc
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv8-R Base Architecture Enve=
lope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
+                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
=20
 # This FVP cannot be downloaded directly, so download the Armv8-R Base A=
EM FVP
 # yourself from the homepage and set FVP_BASE_R_AEM_TARBALL_URI appropri=
ately
-# (for example, file:///home/user/FVP_Base_AEMv8R_11.15_14.tgz).
+# (for example, file:///home/user/FVP_Base_AEMv8R_11.17_21.tgz).
 FVP_BASE_R_AEM_TARBALL_URI ?=3D ""
-PV =3D "11.15.14"
+PV =3D "11.17.21"
+FVP_ARCH =3D "Linux64_GCC-9.3"
=20
 SRC_URI =3D "${FVP_BASE_R_AEM_TARBALL_URI};subdir=3D${BP}"
 python() {
--=20
2.25.1


