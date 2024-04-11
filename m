Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809B5CD1284
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 12:59:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17273.1712840388503896104
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 05:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99367113E
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 06:00:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6EDB3F64C
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 05:59:47 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/optee-ftpm: update to the latest SHA
Date: Thu, 11 Apr 2024 08:59:44 -0400
Message-Id: <20240411125947.64959-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 12:59:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5522

Update to the latest SHA.  Rebase of patch needed.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee-ftpm/0001-add-enum-to-ta-flags.patch    | 15 ++++++---------
 .../recipes-security/optee-ftpm/optee-ftpm_git.bb |  2 +-
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enu=
m-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/000=
1-add-enum-to-ta-flags.patch
index 94509ddd1eff..7c61105b7647 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta=
-flags.patch
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta=
-flags.patch
@@ -1,7 +1,7 @@
-From 2d00f16058529eb9f4d4d2bcaeed91fd53b43989 Mon Sep 17 00:00:00 2001
+From cd7b41b30cf157338cfd5cda3c0f6f33164ad16d Mon Sep 17 00:00:00 2001
 From: Maxim Uvarov <maxim.uvarov@linaro.org>
 Date: Fri, 17 Apr 2020 12:05:53 +0100
-Subject: [PATCH 2/2] add enum to ta flags
+Subject: [PATCH] add enum to ta flags
=20
 If we compile this TA into OPTEE-OS we need to define a flag
 that this TA can be discovered on the optee bus.
@@ -9,22 +9,19 @@ Upstream-Status: Submitted [https://github.com/microsof=
t/MSRSec/pull/34]
=20
 Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
 ---
- TAs/optee_ta/fTPM/user_ta_header_defines.h | 2 +-
+ .../ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h    | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defi=
nes.h b/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
-index 72ecbf0cf1c7..e83619d55d3c 100644
+index 92c33c1..e83619d 100644
 --- a/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
 +++ b/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
 @@ -44,7 +44,7 @@
 =20
  #define TA_UUID                     TA_FTPM_UUID
 =20
--#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_=
INSTANCE_KEEP_ALIVE)=20
+-#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_=
INSTANCE_KEEP_ALIVE)
 +#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_=
INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM_SUPP)
  #define TA_STACK_SIZE               (64 * 1024)
  #define TA_DATA_SIZE                (32 * 1024)
-
---=20
-2.17.1
-
+=20
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/met=
a-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index 7996e9b36c3f..1bb76819b09a 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -22,7 +22,7 @@ FTPM_UUID=3D"bc50d971-d4c9-42c4-82cb-343fb7f37896"
=20
 SRC_URI =3D "gitsm://github.com/Microsoft/ms-tpm-20-ref;branch=3Dmain;pr=
otocol=3Dhttps \
            file://0001-add-enum-to-ta-flags.patch"
-SRCREV =3D "d638536d0fe01acd5e39ffa1bd100b3da82d92c7"
+SRCREV =3D "e9fc7b89d865536c46deb63f9c7d0121a3ded49c"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
--=20
2.39.3 (Apple Git-146)


