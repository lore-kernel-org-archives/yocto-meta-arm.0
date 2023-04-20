Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FC0C77B76
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:52:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6974.1681995158522014343
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 05:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11D301042;
	Thu, 20 Apr 2023 05:53:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C97743F587;
	Thu, 20 Apr 2023 05:52:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 5/6] arm/trusted-firmware-m-scripts: relocate to tfm directory
Date: Thu, 20 Apr 2023 13:52:32 +0100
Message-Id: <20230420125233.1918925-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420125233.1918925-1-ross.burton@arm.com>
References: <20230420125233.1918925-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 12:52:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4597

From: Jon Mason <jon.mason@arm.com>

Relocate to be with tfm to make it more obvious when a version update
is needed

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-m}/trusted-firmware-m-scripts-native.inc   | 0
 .../trusted-firmware-m-scripts-native_1.7.0.bb                  | 2 ++
 .../trusted-firmware-m-scripts-native_1.7.0.bb                  | 2 --
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm/{recipes-devtools/trusted-firmware-m-scripts =3D> recipe=
s-bsp/trusted-firmware-m}/trusted-firmware-m-scripts-native.inc (100%)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-scripts-native_1.7.0.bb
 delete mode 100644 meta-arm/recipes-devtools/trusted-firmware-m-scripts/=
trusted-firmware-m-scripts-native_1.7.0.bb

diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted=
-firmware-m-scripts-native.inc b/meta-arm/recipes-bsp/trusted-firmware-m/=
trusted-firmware-m-scripts-native.inc
similarity index 100%
rename from meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-=
firmware-m-scripts-native.inc
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scri=
pts-native.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_1.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_1.7.0.bb
new file mode 100644
index 00000000..504846e0
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_1.7.0.bb
@@ -0,0 +1,2 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted=
-firmware-m-scripts-native_1.7.0.bb b/meta-arm/recipes-devtools/trusted-f=
irmware-m-scripts/trusted-firmware-m-scripts-native_1.7.0.bb
deleted file mode 100644
index 2e9e5249..00000000
--- a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.7.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc
-require recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-s=
cripts-native.inc
--=20
2.34.1


