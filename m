Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEF5C54EE9
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 18:42:08 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com
 [217.140.106.51])
 by mx.groups.io with SMTP id smtpd.web11.2712.1661971326611151025
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 11:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.106.51, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com
 (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 27VIiIVB011556;
	Wed, 31 Aug 2022 19:44:19 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH 6/7] Include Trusted Services SPs into optee-os image
Date: Wed, 31 Aug 2022 19:41:56 +0100
Message-Id: <20220831184157.84687-6-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831184157.84687-1-Anton.Antonov@arm.com>
References: <20220831184157.84687-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Aug 2022 18:42:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3725

Required TS SPs can be included into optee-os image using MACHINE_FEATURES:

ts-its         - Internal Storage SP
ts-storage     - Storage SP
ts-crypto      - Crypto SP
ts-attestetion - Attestation SP
ts-se-proxy    - SE Proxy SP
ts-smm-gateway - SMM Gateway SP

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .../recipes-security/optee/optee-os-ts.inc    | 54 +++++++++++++++++++
 .../optee/optee-os_%.bbappend                 |  5 ++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os-ts.inc
 create mode 100644 meta-arm/recipes-security/optee/optee-os_%.bbappend

diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/recipes-security/optee/optee-os-ts.inc
new file mode 100644
index 00000000..10a41755
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -0,0 +1,54 @@
+# Include Trusted Services SPs accordingly to defined machine features
+
+# Please notice that OPTEE will load SPs in the order listed in this file.
+# If an SP requires another SP to be already loaded it must be listed lower.
+
+# TS SPs UUIDs definitions
+require recipes-security/trusted-services/ts-uuid.inc
+
+TS_ENV = "opteesp"
+TS_BIN = "${RECIPE_SYSROOT}/usr/${TS_ENV}/bin"
+
+# ITS SP
+DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', \
+                                        ' ts-sp-its', '' , d)}"
+SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', \
+                                        ' ${TS_BIN}/${ITS_UUID}.stripped.elf', '', d)}"
+
+# Storage SP
+DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storage', \
+                                        ' ts-sp-storage', '' , d)}"
+SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storage', \
+                                        ' ${TS_BIN}/${STORAGE_UUID}.stripped.elf', '', d)}"
+
+# Crypto SP.
+DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto', \
+                                        ' ts-sp-crypto', '' , d)}"
+SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto', \
+                                        ' ${TS_BIN}/${CRYPTO_UUID}.stripped.elf', '', d)}"
+
+# Attestation SP
+DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestation', \
+                                        ' ts-sp-attestation', '' , d)}"
+SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestation', \
+                                        ' ${TS_BIN}/${ATTESTATION_UUID}.stripped.elf', '', d)}"
+
+# Env-test SP
+DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-test', \
+                                        ' ts-sp-env-test', '' , d)}"
+SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-test', \
+                                        ' ${TS_BIN}/${ENV_TEST_UUID}.stripped.elf', '', d)}"
+
+# SE-Proxy SP
+DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-proxy', \
+                                        ' ts-sp-se-proxy', '' , d)}"
+SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-proxy', \
+                                        ' ${TS_BIN}/${SE_PROXY_UUID}.stripped.elf', '', d)}"
+
+# SMM Gateway
+DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
+                                        ' ts-sp-smm-gateway', '' , d)}"
+SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
+                                        ' ${TS_BIN}/${SMM_GATEWAY_UUID}.stripped.elf', '', d)}"
+
+EXTRA_OEMAKE:append = "${@oe.utils.conditional('SP_PATHS', '', '', ' CFG_SECURE_PARTITION=y SP_PATHS=\'${SP_PATHS}\' ', d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_%.bbappend b/meta-arm/recipes-security/optee/optee-os_%.bbappend
new file mode 100644
index 00000000..09650b9a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_%.bbappend
@@ -0,0 +1,5 @@
+# Include Trusted Services Secure Partitions
+require optee-os-ts.inc
+
+# Conditionally include platform specific Trusted Services related OPTEE build parameters
+EXTRA_OEMAKE:append:qemuarm64-secureboot = "${@oe.utils.conditional('SP_PATHS', '', '', ' CFG_CORE_HEAP_SIZE=131072 CFG_TEE_BENCHMARK=n CFG_TEE_CORE_LOG_LEVEL=4 CFG_CORE_SEL1_SPMC=y ', d)}"
-- 
2.25.1


