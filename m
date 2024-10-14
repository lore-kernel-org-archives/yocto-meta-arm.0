Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D57D18132
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 16:54:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.292.1728924890225946495
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 09:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 731981063
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Oct 2024 09:55:19 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE5773F58B
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Oct 2024 09:54:49 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/scp-firmware: update to v2.15.0
Date: Mon, 14 Oct 2024 12:54:48 -0400
Message-Id: <20241014165448.46530-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241014165448.46530-1-jon.mason@arm.com>
References: <20241014165448.46530-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Oct 2024 16:54:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6190

Update SCP to the latest tagged version, and update the related patch to
the new location of the relevant files.

For a comparison of the changes, please go to
https://git.gitlab.arm.com/firmware/SCP-firmware/-/compare/v2.14.0...v2.1=
5.0

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../files/0001-OPTEE-Private-Includes.patch    | 18 +++++++++---------
 ...rmware_2.14.0.bb =3D> scp-firmware_2.15.0.bb} |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename meta-arm/recipes-bsp/scp-firmware/{scp-firmware_2.14.0.bb =3D> sc=
p-firmware_2.15.0.bb} (98%)

diff --git a/meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Private-I=
ncludes.patch b/meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Privat=
e-Includes.patch
index f3063a957e1e..84f501567bbc 100644
--- a/meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Private-Includes=
.patch
+++ b/meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Private-Includes=
.patch
@@ -1,4 +1,4 @@
-From b298400a5783453f64d8bebbd92db2c84c4a49fd Mon Sep 17 00:00:00 2001
+From 8b4b14943de92a2c7f8b328c2de75771493b7d18 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 10 Jul 2023 14:09:16 +0100
 Subject: [PATCH] OPTEE Private Includes
@@ -11,14 +11,14 @@ For some reason this behaviour isn't deterministic, a=
 ticket has been filed with
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- module/optee/console/CMakeLists.txt | 2 +-
- module/optee/mbx/CMakeLists.txt     | 2 +-
+ product/optee/common/module/console/CMakeLists.txt | 2 +-
+ product/optee/common/module/mbx/CMakeLists.txt     | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
-diff --git a/module/optee/console/CMakeLists.txt b/module/optee/console/=
CMakeLists.txt
+diff --git a/product/optee/common/module/console/CMakeLists.txt b/produc=
t/optee/common/module/console/CMakeLists.txt
 index aebb7cc79766..942aa98c85ff 100644
---- a/module/optee/console/CMakeLists.txt
-+++ b/module/optee/console/CMakeLists.txt
+--- a/product/optee/common/module/console/CMakeLists.txt
++++ b/product/optee/common/module/console/CMakeLists.txt
 @@ -14,7 +14,7 @@ target_include_directories(${SCP_MODULE_TARGET}
  # Those includes are needed for mutex definitnion that is used in optee=
_smt
  # notification
@@ -28,10 +28,10 @@ index aebb7cc79766..942aa98c85ff 100644
                                    "${SCP_OPTEE_DIR}/core/include/"
                                    "${SCP_OPTEE_DIR}/lib/libutils/ext/in=
clude/"
                                    "${SCP_OPTEE_DIR}/lib/libutee/include=
/")
-diff --git a/module/optee/mbx/CMakeLists.txt b/module/optee/mbx/CMakeLis=
ts.txt
+diff --git a/product/optee/common/module/mbx/CMakeLists.txt b/product/op=
tee/common/module/mbx/CMakeLists.txt
 index 305fa42b7370..783a7970c2d5 100644
---- a/module/optee/mbx/CMakeLists.txt
-+++ b/module/optee/mbx/CMakeLists.txt
+--- a/product/optee/common/module/mbx/CMakeLists.txt
++++ b/product/optee/common/module/mbx/CMakeLists.txt
 @@ -15,7 +15,7 @@ target_include_directories(${SCP_MODULE_TARGET}
  # Those includes are needed for mutex defifitnion that is used in optee=
_smt
  # notification
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.14.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.15.0.bb
similarity index 98%
rename from meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.14.0.bb
rename to meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.15.0.bb
index c0e40d903e12..b305234347f2 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.14.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.15.0.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRAN=
CH} \
           "
=20
 SRCBRANCH =3D "main"
-SRCREV  =3D "3267f2964114a56faaf46a40704be6ca78240725"
+SRCREV  =3D "25681b34bdc838b7231e0056e3ef5164e8005382"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
=20
--=20
2.39.5 (Apple Git-154)


