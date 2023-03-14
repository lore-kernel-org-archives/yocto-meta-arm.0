Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370F6C74A5B
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 14:24:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10009.1678803852157183570
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 07:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B22171042
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 07:24:54 -0700 (PDT)
Received: from jdm-VirtualBox.lan044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E51543F67D
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 07:24:10 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-m-scripts: relocate to tfm directory
Date: Tue, 14 Mar 2023 10:24:03 -0400
Message-Id: <20230314142404.501077-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 14:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4488

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
2.25.1


