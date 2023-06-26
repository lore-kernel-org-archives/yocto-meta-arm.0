Return-Path: <tomasagustin.gonzalezorlando@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A97EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 15:56:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12084.1687795014109497385
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 08:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: tomasagustin.gonzalezorlando@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBD542F4;
	Mon, 26 Jun 2023 08:57:37 -0700 (PDT)
Received: from e126979.cambridge.arm.com (e126979.cambridge.arm.com [10.1.38.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF3033F663;
	Mon, 26 Jun 2023 08:56:51 -0700 (PDT)
From: tomasagustin.gonzalezorlando@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	jon.mason@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com,
	Tomas Gonzalez <tomasagustin.gonzalezorlando@arm.com>
Subject: [PATCH v2 mickledore 2/4] arm-bsp/documentation: corstone1000: Update the release notes
Date: Mon, 26 Jun 2023 16:56:29 +0100
Message-Id: <20230626155631.53157-3-tomasagustin.gonzalezorlando@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626155631.53157-1-tomasagustin.gonzalezorlando@arm.com>
References: <20230626155631.53157-1-tomasagustin.gonzalezorlando@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Jun 2023 15:56:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4842

From: Tomas Gonzalez <tomasagustin.gonzalezorlando@arm.com>

Update the release notes with Known Issues and Limitations.

Signed-off-by: Tom=C3=A1s Gonz=C3=A1lez <tomasagustin.gonzalezorlando@arm=
.com>
---
 .../corstone1000/release-notes.rst            | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index 89a4fa9a..1d8ca5ac 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022, Arm Limited.
+ # Copyright (c) 2022-2023, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -19,6 +19,28 @@ intended for safety-critical applications. Should Your=
 Software or Your Hardware
 prove defective, you assume the entire cost of all necessary servicing, =
repair
 or correction.
=20
+***********************
+Release notes - 2023.06
+***********************
+
+Known Issues or Limitations
+---------------------------
+ - FPGA supports Linux distro install and boot through installer. Howeve=
r, FVP only supports openSUSE raw image installation and boot.
+ - Due to the performance uplimit of MPS3 FPGA and FVP, some Linux distr=
os like Fedora Rawhide can not boot on Corstone-1000 (i.e. user may exper=
ience timeouts or boot hang).
+ - PSA Crypto tests (psa-crypto-api-test command) take 30 minutes to com=
plete for FVP and 1 hour for MPS3.
+ - Corstone-1000 SoC on FVP doesn't have a secure debug peripheral. It d=
oes on the MPS3 .
+ - The following limitations listed in the previous release are still ap=
plicable:
+
+   - UEFI Compliant - Boot from network protocols must be implemented --=
 FAILURE
+
+   - Known limitations regarding ACS tests - see previous release's note=
s.
+
+Platform Support
+-----------------
+ - This software release is tested on Corstone-1000 FPGA version AN550_v=
2
+   https://developer.arm.com/downloads/-/download-fpga-images
+ - This software release is tested on Corstone-1000 Fast Model platform =
(FVP) version 11.19_21
+   https://developer.arm.com/tools-and-software/open-source-software/arm=
-platforms-software/arm-ecosystem-fvps
=20
 **************************
 Release notes - 2022.11.23
--=20
2.25.1


