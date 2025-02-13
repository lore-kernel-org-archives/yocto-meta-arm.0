Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546C4C021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:49:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14320.1739461765120241365
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 07:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE13D1756
	for <meta-arm@lists.yoctoproject.org>; Thu, 13 Feb 2025 07:49:44 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D83D73F58B
	for <meta-arm@lists.yoctoproject.org>; Thu, 13 Feb 2025 07:49:23 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI/machine-summary: remove binary toolchains and sort entries alphabetically
Date: Thu, 13 Feb 2025 10:49:21 -0500
Message-Id: <20250213154922.46233-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Feb 2025 15:49:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6371

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/machine-summary.py | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 455a5176fe5d..325d8a65c469 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -138,22 +138,20 @@ def harvest_data(machines, recipes):
     return upstreams, versions
=20
 # TODO can this be inferred from the list of recipes in the layer
-recipes =3D ("virtual/kernel",
+recipes =3D ("boot-wrapper-aarch64",
+           "edk2-firmware",
+           "gator-daemon",
+           "gn",
+           "hafnium",
+           "opencsd",
+           "optee-ftpm",
+           "optee-os",
            "sbsa-acs",
            "scp-firmware",
            "trusted-firmware-a",
            "trusted-firmware-m",
-           "edk2-firmware",
            "u-boot",
-           "optee-os",
-           "optee-ftpm",
-           "hafnium",
-           "boot-wrapper-aarch64",
-           "gator-daemon",
-           "gn",
-           "opencsd",
-           "gcc-aarch64-none-elf-native",
-           "gcc-arm-none-eabi-native")
+           "virtual/kernel")
=20
=20
 class Format:
--=20
2.39.5 (Apple Git-154)


