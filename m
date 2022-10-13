Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A53C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 15:47:54 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com [217.140.106.55])
 by mx.groups.io with SMTP id smtpd.web09.9383.1665676065157147740
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 08:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.106.55, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 29DFlgZI015596;
	Thu, 13 Oct 2022 16:47:42 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH] arm/trusted-services: include documentation
Date: Thu, 13 Oct 2022 16:47:40 +0100
Message-Id: <20221013154740.3368442-1-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Oct 2022 15:47:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3960

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 documentation/trusted-services.md | 53 +++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 documentation/trusted-services.md

diff --git a/documentation/trusted-services.md b/documentation/trusted-services.md
new file mode 100644
index 00000000..e3cee6b3
--- /dev/null
+++ b/documentation/trusted-services.md
@@ -0,0 +1,53 @@
+# The Trusted Services: framework for developing root-of-trust services
+
+  meta-arm layer includes recipes for [Trusted Services][1] Secure Partitions and Normal World applications
+in `meta-arm/recipes-security/trusted-services`
+
+## Secure Partitions recipes
+
+We define dedicated recipes for all supported Trusted Services (TS) Secure Partitions.
+These recipes produce ELF and DTB files for SPs.
+These files are automatically included into optee-os image accordingly to defined MACHINE_FEATURES.
+
+### How to include TS SPs
+
+To include TS SPs into optee-os image you need to add into MACHINE_FEATURES
+features for each [Secure Partition][2] you would like to include:
+
+| Secure Partition  | MACHINE_FEATURE |
+| ----------------- | --------------- |
+| Attestation       | ts-attesation   |
+| Crypto            | ts-crypto       |
+| Internal Storage  | ts-its          |
+| Protected Storage | ts-storage      |
+| se-proxy          | ts-se-proxy     |
+| smm-gateway       | ts-smm-gateway  |
+
+Other steps depend on your machine/platform definition:
+
+1. For communications between Secure and Normal Words Linux kernel option `CONFIG_ARM_FFA_TRANSPORT=y`
+is required. If your platform doesn't include it already you can add `arm-ffa` into MACHINE_FEATURES.
+
+2. optee-os might require platform specific OP-TEE build parameters (for example what SEL the SPM Core is implemented at).
+You can find examples in `meta-arm/recipes-security/optee/optee-os_%.bbappend` for qemuarm64-secureboot machine
+and in `meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc` and `meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc`
+for N1SDP and Corstone1000 platforms accordingly.
+
+3. trusted-firmware-a might require platform specific TF-A build parameters (SPD and SPMC details on the platform).
+See `meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend` for qemuarm64-secureboot machine
+and in `meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc` and
+`meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc` for N1SDP and Corstone1000 platforms.
+
+## Normal World applications
+
+  Optionally for testing purposes you can add `packagegroup-ts-tests` and `packagegroup-ts-tests-psa` package groups into your image.
+They include [Trusted Services test and demo tools][3]
+
+## OEQA Trusted Services tests
+
+  meta-arm also includes Trusted Service OEQA tests which can be used for automated testing.
+See `ci/trusted-services.yml` for an example how to include them into an image.
+
+[1] https://trusted-services.readthedocs.io/en/integration/overview/introduction.html
+[2] https://trusted-services.readthedocs.io/en/integration/developer/deployments/secure-partitions.html
+[3] https://trusted-services.readthedocs.io/en/integration/developer/deployments/test-executables.html
-- 
2.25.1


