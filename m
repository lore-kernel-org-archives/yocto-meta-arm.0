Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A95CA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 15:37:47 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.68103.1756222658905520404
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Aug 2025 08:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fbvs5dY5;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: andrey.z@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6188b793d21so8655227a12.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 26 Aug 2025 08:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756222657; x=1756827457; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS6pfOP3O9BDUESepfUCkyQZ7Haz6sIDuLtRCfV3Slg=;
        b=fbvs5dY5xdUMV081fkCEWVcDsqSzmEMX9FnMSJls60qkifwVgZhgLcYfr6IpV5nHll
         5bjcXYnb9iWya7fuJznxREjv4NEIwXMzGlSmzdDcPff7RUb57iD2lcAXDX7m602dqlLj
         RxJyrbyVjbGL4+jhd1a93NhvFpzvVfhf5XSLzploXrmc3nRMgKxJ7GL0/VxB+3/aDq92
         3RTVaDGIpXd6ksdjwYo5O7kqCQbKBwjraqoQuB8xM9NENJGkrBkLQ4AqWT5SdXqIMjUP
         qDhgWaZ6u6MYwin3vEBdEMfNuTh/zC9RtSnI9XVdiiXtscPIcJnqV3Hyig0DLchK5b6S
         pGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756222657; x=1756827457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZS6pfOP3O9BDUESepfUCkyQZ7Haz6sIDuLtRCfV3Slg=;
        b=Q+eL0+3zt4yDFFNz2yLhdgG0Glcz9CxTKnsK+z2M7p1f7kBSBAOPvt7EEgRQ3antf5
         3UDlkRWkzR9NLT6mQsbPfWgqN8GvoZNd3uvLMvt9V3MvCcwnclPfcYccBSx4B8c4JWj5
         Xaatkc4mHF6PFdsS3/f6wjg/muqSqd3F02B2d9/chtDlvtyBc9IfUQmkzibBsco4S2mD
         xw7VLMzVB/aEGazUUKOeUW35SgDVs0i3b5Fk8xGqBBFSk2A/VyLssyecIhmgNH0XPEGm
         lgK0BGaWdxIOrNNs3tgwWxooNd+nfyCJDWI50U8Fb3KNr6F8zhPf8F602vbvbFEBd7g2
         cuXA==
X-Gm-Message-State: AOJu0YxwjnX39dagX6dGRcJBQgGwNvuwM2BgKaNLhdS+7rIu1gefqqia
	0oRdLIEIrBanjiVI+YXXw0NJiKHjNjOA1bxLQlroyRMp4TY0hoOIMJLBdecFQnF8
X-Gm-Gg: ASbGnctL1NXjqaEqkkZkxc5Ev9k6keGaIglT8+8es69E1Zc2KdnrU/7bjD0XMf2fj6o
	fzkC2KACwrYd6bMBp/oezTThBvFiKaX0cMUxcn7xSDw2ZT9iqfVA1h/27Jobt2taJT7rqqgxeOM
	mPtmZvg+sa9wEnyMxxnBwvlfTIxqzhDC8VwCGK45wA7TaTZm86yrN/Ik3Tt3tU9JbTd2hwTsiBu
	dz3ZJkyFUK6I86NxbAsSDdK+evykA7ZLf5eY554h18/LYUuz5EPqRJk++ZRw2U9aYLbEfozRBBJ
	ctZiLxcDxZM500P+F3uXD8RqPQzHLe+jkzUKNMAwlxykmY6udUw8LcrwjxQsrQE/D+U/LE/Mbfa
	qj0YwY37OaLNdpkzgB6x4+hrNkPPsZmbSPSL/55aCDIE54M8eQ4DmCC0PPINh
X-Google-Smtp-Source: AGHT+IE0bDtSvmItS1bNHZ5KV5feta50hQdEpxMQPBVSByOuO+XgD9Ke0Y01iNLZaJ+VtN1jLI5y5Q==
X-Received: by 2002:a05:6402:13c1:b0:608:f493:871c with SMTP id 4fb4d7f45d1cf-61c1b40bdf3mr15386953a12.14.1756222656799;
        Tue, 26 Aug 2025 08:37:36 -0700 (PDT)
Received: from GEO-W5CG4492JHD.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c3172e21dsm7110329a12.40.2025.08.26.08.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 08:37:36 -0700 (PDT)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH] arm/arm-bsp: optee: upgrade to 4.7.0
Date: Tue, 26 Aug 2025 17:36:52 +0200
Message-ID: <20250826153707.133908-2-andrey.z@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Aug 2025 15:37:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6685

OP-TEE version 4.7.0 has been released on 2025-07-11 [1], and includes fixes
that are currently collected as separate patches in the layer collection.

Upgrade OP-TEE recipes to point to version 4.7.0, and drop patches from layers
as they are already present in upstream.

Clang patch in `optee-os` package was completely removed. Upstream logic was
changed in PR #7382 [2], making this patch obsolete.

CVE-2025-46733 in `optee-ftpm` package is now properly tagged and included in
4.7.0 version as well.

One patch that is still kept in the layer is
optee-client/0001-tee-supplicant-update-udev-systemd-install-code.patch, as it
has been merged after 4.7.0 tag was applied, but already present in upstream as
commit 59b90488e93e ("tee-supplicant: update udev & systemd install code").
Further updates shall consider to drop this as well.

In addition, point corestone1000 machine to a new version, as 4.6.0 is dropped
from the layer. TZDRAM patch is also dropped as it is now present in upstream.

Link: [1]: https://github.com/OP-TEE/optee_os/blob/master/CHANGELOG.md#op-tee---version-470-2025-07-11
Link: [2]: https://github.com/OP-TEE/optee_os/pull/7382
Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 .../conf/machine/include/corstone1000.inc     |  4 +-
 ...orstone1000-increase-CFG_TZDRAM_SIZE.patch | 30 -------
 .../optee/optee-os-corstone1000-common.inc    |  3 -
 ...ptee-ftpm_4.6.0.bb => optee-ftpm_4.7.0.bb} |  2 +-
 ...-client_4.6.0.bb => optee-client_4.7.0.bb} |  4 +-
 .../optee/optee-examples_4.6.0.bb             |  4 -
 .../optee/optee-examples_4.7.0.bb             |  4 +
 ...it_4.6.0.bb => optee-os-tadevkit_4.7.0.bb} |  0
 .../0001-optee-enable-clang-support.patch     | 29 ------
 ...002-Add-optee-ta-instanceKeepCrashed.patch | 89 -------------------
 .../recipes-security/optee/optee-os_4.6.0.bb  | 12 ---
 .../recipes-security/optee/optee-os_4.7.0.bb  |  8 ++
 ...cmake-add-Werror-based-on-CFG_WERROR.patch | 74 ---------------
 ...Re-order-the-include-of-sys-stat.h-h.patch | 51 -----------
 ...ptee-test_4.6.0.bb => optee-test_4.7.0.bb} |  9 +-
 15 files changed, 19 insertions(+), 304 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch
 rename meta-arm/recipes-security/optee-ftpm/{optee-ftpm_4.6.0.bb => optee-ftpm_4.7.0.bb} (98%)
 rename meta-arm/recipes-security/optee/{optee-client_4.6.0.bb => optee-client_4.7.0.bb} (77%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_4.6.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.7.0.bb
 rename meta-arm/recipes-security/optee/{optee-os-tadevkit_4.6.0.bb => optee-os-tadevkit_4.7.0.bb} (100%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-optee-enable-clang-support.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0002-Add-optee-ta-instanceKeepCrashed.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_4.6.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.7.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-build-make-cmake-add-Werror-based-on-CFG_WERROR.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-regression_1000-Re-order-the-include-of-sys-stat.h-h.patch
 rename meta-arm/recipes-security/optee/{optee-test_4.6.0.bb => optee-test_4.7.0.bb} (70%)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 04d2b60d..45237a3b 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -14,8 +14,8 @@ TFA_BL2_BINARY = "bl2-corstone1000.bin"
 TFA_FIP_BINARY = "fip-corstone1000.bin"
 
 # optee
-PREFERRED_VERSION_optee-os ?= "4.6.%"
-PREFERRED_VERSION_optee-client ?= "4.6.%"
+PREFERRED_VERSION_optee-os ?= "4.7.%"
+PREFERRED_VERSION_optee-client ?= "4.7.%"
 
 # Trusted Services
 TS_PLATFORM = "arm/corstone1000"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch
deleted file mode 100644
index e18dd783..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ce58e4d78dc7a4f3c3b08ee425461eb190d70543 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Fri, 1 Nov 2024 00:45:53 +0100
-Subject: [PATCH] plat-corstone1000: increase CFG_TZDRAM_SIZE
-
-TZDRAM is a 4MB SRAM in Corstone-1000. Its start address is `0x0200_0000`
-but the first 0x2000 bytes are reserved for future use. `CFG_TZDRAM_SIZE`
-can be increased to `0x360000` so OP-TEE has more RAM.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7470]
----
- core/arch/arm/plat-corstone1000/conf.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/plat-corstone1000/conf.mk
-index 9fa0729d5..745dc958a 100644
---- a/core/arch/arm/plat-corstone1000/conf.mk
-+++ b/core/arch/arm/plat-corstone1000/conf.mk
-@@ -34,7 +34,7 @@ CFG_TEE_CORE_NB_CORE ?= 1
- CFG_TZDRAM_START ?= 0x02002000
- 
- # TEE_RAM (OP-TEE kernel + DATA) + TA_RAM
--CFG_TZDRAM_SIZE  ?= 0x340000
-+CFG_TZDRAM_SIZE  ?= 0x360000
- CFG_SHMEM_START  ?= 0x86000000
- CFG_SHMEM_SIZE   ?= 0x00200000
- 
--- 
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
index d7fe4c73..7e849c45 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
@@ -1,7 +1,4 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
-SRC_URI:append = " \
-                  file://0001-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch \
-		  "
 
 COMPATIBLE_MACHINE = "corstone1000"
 
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.6.0.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb
similarity index 98%
rename from meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.6.0.bb
rename to meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb
index 9f328c25..756aeec6 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.6.0.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb
@@ -35,7 +35,7 @@ SRC_URI = "\
 # As per optee-ftpm TA documentation, we have to use this SHA of MS TPM reference
 SRCREV_ms-tpm   ?= "98b60a44aba79b15fcce1c0d1e46cf5918400f6a"
 
-# v4.6.0 + fix for CVE-2025-46733
+# v4.7.0
 SRCREV_optee-ta ?= "ce33372ab772e879826361a1ca91126260bd9be1"
 
 SRCREV_FORMAT    = "ms-tpm_optee-ta"
diff --git a/meta-arm/recipes-security/optee/optee-client_4.6.0.bb b/meta-arm/recipes-security/optee/optee-client_4.7.0.bb
similarity index 77%
rename from meta-arm/recipes-security/optee/optee-client_4.6.0.bb
rename to meta-arm/recipes-security/optee/optee-client_4.7.0.bb
index cbd75eb3..00f829e1 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.6.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.7.0.bb
@@ -1,7 +1,7 @@
 require recipes-security/optee/optee-client.inc
 
-# v4.6.0
-SRCREV = "02e7f9213b0d7db9c35ebf1e41e733fc9c5a3f75"
+# v4.7.0
+SRCREV = "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
 SRC_URI += "file://0001-tee-supplicant-update-udev-systemd-install-code.patch"
 
 inherit pkgconfig
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.6.0.bb b/meta-arm/recipes-security/optee/optee-examples_4.6.0.bb
deleted file mode 100644
index 8ee4ece9..00000000
--- a/meta-arm/recipes-security/optee/optee-examples_4.6.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-security/optee/optee-examples.inc
-
-# v4.6.0
-SRCREV = "5306d2c7c618bb4a91df17a2d5d79ae4701af4a3"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.7.0.bb b/meta-arm/recipes-security/optee/optee-examples_4.7.0.bb
new file mode 100644
index 00000000..a926f819
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_4.7.0.bb
@@ -0,0 +1,4 @@
+require recipes-security/optee/optee-examples.inc
+
+# v4.7.0
+SRCREV = "14321a0607db16099d158478b21a2b2e37b3a935"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.6.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.7.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_4.6.0.bb
rename to meta-arm/recipes-security/optee/optee-os-tadevkit_4.7.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-optee-enable-clang-support.patch b/meta-arm/recipes-security/optee/optee-os/0001-optee-enable-clang-support.patch
deleted file mode 100644
index abc6d13e..00000000
--- a/meta-arm/recipes-security/optee/optee-os/0001-optee-enable-clang-support.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9cf8ac4e6fcecb33af377e1a322f4841ed4e30ce Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Wed, 23 Sep 2020 09:27:34 +0100
-Subject: [PATCH] optee: enable clang support
-
-When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
-to provide a sysroot wasn't included, which results in not locating
-compiler-rt. This is mitigated by including the variable as ammended.
-
-Upstream-Status: Inappropriate
-ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- mk/clang.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk/clang.mk b/mk/clang.mk
-index a045beee8482..1ebe2f702dcd 100644
---- a/mk/clang.mk
-+++ b/mk/clang.mk
-@@ -30,7 +30,7 @@ comp-cflags-warns-clang := -Wno-language-extension-token \
- 
- # Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
- # libgcc for clang
--libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
- 			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
- 
- # Core ASLR relies on the executable being ready to run from its preferred load
diff --git a/meta-arm/recipes-security/optee/optee-os/0002-Add-optee-ta-instanceKeepCrashed.patch b/meta-arm/recipes-security/optee/optee-os/0002-Add-optee-ta-instanceKeepCrashed.patch
deleted file mode 100644
index 6ba379aa..00000000
--- a/meta-arm/recipes-security/optee/optee-os/0002-Add-optee-ta-instanceKeepCrashed.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 941a58d78c99c4754fbd4ec3079ec9e1d596af8f Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Fri, 4 Apr 2025 10:24:34 +0200
-Subject: [PATCH] Add optee.ta.instanceKeepCrashed property
-
-Add the optee.ta.instanceKeepCrashed property to prevent a TA with
-gpd.ta.instanceKeepAlive=true to be restarted. This prevents unexpected
-resetting of the state of the TA.
-
-Upstream-Status: Backport
-CVE: CVE-2025-46733
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
-Reviewed-by: Alex Lewontin <alex.lewontin@canonical.com>
-Reviewed-by: Etienne Carriere <etienne.carriere@foss.st.com>
----
- core/kernel/tee_ta_manager.c         | 10 +++++++---
- lib/libutee/include/user_ta_header.h |  8 +++++++-
- ta/user_ta_header.c                  |  3 +++
- 3 files changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/core/kernel/tee_ta_manager.c b/core/kernel/tee_ta_manager.c
-index e4740468873..75e55a8e475 100644
---- a/core/kernel/tee_ta_manager.c
-+++ b/core/kernel/tee_ta_manager.c
-@@ -455,6 +455,7 @@ TEE_Result tee_ta_close_session(struct tee_ta_session *csess,
-	struct tee_ta_session *sess = NULL;
-	struct tee_ta_ctx *ctx = NULL;
-	struct ts_ctx *ts_ctx = NULL;
-+	bool keep_crashed = false;
-	bool keep_alive = false;
-
-	DMSG("csess 0x%" PRIxVA " id %u",
-@@ -501,9 +502,12 @@ TEE_Result tee_ta_close_session(struct tee_ta_session *csess,
-		panic();
-
-	ctx->ref_count--;
--	keep_alive = (ctx->flags & TA_FLAG_INSTANCE_KEEP_ALIVE) &&
--			(ctx->flags & TA_FLAG_SINGLE_INSTANCE);
--	if (!ctx->ref_count && (ctx->panicked || !keep_alive)) {
-+	if (ctx->flags & TA_FLAG_SINGLE_INSTANCE)
-+		keep_alive = ctx->flags & TA_FLAG_INSTANCE_KEEP_ALIVE;
-+	if (keep_alive)
-+		keep_crashed = ctx->flags & TA_FLAG_INSTANCE_KEEP_CRASHED;
-+	if (!ctx->ref_count &&
-+	    ((ctx->panicked && !keep_crashed) || !keep_alive)) {
-		if (!ctx->is_releasing) {
-			TAILQ_REMOVE(&tee_ctxes, ctx, link);
-			ctx->is_releasing = true;
-diff --git a/lib/libutee/include/user_ta_header.h b/lib/libutee/include/user_ta_header.h
-index 0336c64b2f7..c5622982f2e 100644
---- a/lib/libutee/include/user_ta_header.h
-+++ b/lib/libutee/include/user_ta_header.h
-@@ -52,8 +52,13 @@
-					BIT32(11)
- #define TA_FLAG_DEVICE_ENUM_TEE_STORAGE_PRIVATE	\
-					BIT32(12) /* with TEE_STORAGE_PRIVATE */
-+/*
-+ * Don't restart a TA with TA_FLAG_INSTANCE_KEEP_ALIVE set if it has
-+ * crashed.
-+ */
-+#define TA_FLAG_INSTANCE_KEEP_CRASHED	BIT32(13)
-
--#define TA_FLAGS_MASK			GENMASK_32(12, 0)
-+#define TA_FLAGS_MASK			GENMASK_32(13, 0)
-
- struct ta_head {
-	TEE_UUID uuid;
-@@ -133,6 +138,7 @@ extern struct __elf_phdr_info __elf_phdr_info;
- #define TA_PROP_STR_SINGLE_INSTANCE	"gpd.ta.singleInstance"
- #define TA_PROP_STR_MULTI_SESSION	"gpd.ta.multiSession"
- #define TA_PROP_STR_KEEP_ALIVE		"gpd.ta.instanceKeepAlive"
-+#define TA_PROP_STR_KEEP_CRASHED	"optee.ta.instanceKeepCrashed"
- #define TA_PROP_STR_DATA_SIZE		"gpd.ta.dataSize"
- #define TA_PROP_STR_STACK_SIZE		"gpd.ta.stackSize"
- #define TA_PROP_STR_VERSION		"gpd.ta.version"
-diff --git a/ta/user_ta_header.c b/ta/user_ta_header.c
-index 3125af55c44..aa804c1efaa 100644
---- a/ta/user_ta_header.c
-+++ b/ta/user_ta_header.c
-@@ -142,6 +142,9 @@ const struct user_ta_property ta_props[] = {
-	{TA_PROP_STR_KEEP_ALIVE, USER_TA_PROP_TYPE_BOOL,
-	 &(const bool){(TA_FLAGS & TA_FLAG_INSTANCE_KEEP_ALIVE) != 0}},
-
-+	{TA_PROP_STR_KEEP_CRASHED, USER_TA_PROP_TYPE_BOOL,
-+	 &(const bool){(TA_FLAGS & TA_FLAG_INSTANCE_KEEP_CRASHED) != 0}},
-+
-	{TA_PROP_STR_DATA_SIZE, USER_TA_PROP_TYPE_U32,
-	 &(const uint32_t){TA_DATA_SIZE}},
diff --git a/meta-arm/recipes-security/optee/optee-os_4.6.0.bb b/meta-arm/recipes-security/optee/optee-os_4.6.0.bb
deleted file mode 100644
index 3e0eea20..00000000
--- a/meta-arm/recipes-security/optee/optee-os_4.6.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-DEPENDS += "dtc-native"
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-# v4.6.0
-SRCREV = "71785645fa6ce42db40dbf5a54e0eaedc4f61591"
-SRC_URI += " \
-    file://0001-optee-enable-clang-support.patch \
-    file://0002-Add-optee-ta-instanceKeepCrashed.patch \
-   "
diff --git a/meta-arm/recipes-security/optee/optee-os_4.7.0.bb b/meta-arm/recipes-security/optee/optee-os_4.7.0.bb
new file mode 100644
index 00000000..1d5d8ccc
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_4.7.0.bb
@@ -0,0 +1,8 @@
+require recipes-security/optee/optee-os.inc
+
+DEPENDS += "dtc-native"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+# v4.7.0
+SRCREV = "86846f4fdf14f25b50fd64a87888ca9fe85a9e2b"
diff --git a/meta-arm/recipes-security/optee/optee-test/0001-build-make-cmake-add-Werror-based-on-CFG_WERROR.patch b/meta-arm/recipes-security/optee/optee-test/0001-build-make-cmake-add-Werror-based-on-CFG_WERROR.patch
deleted file mode 100644
index 53e6ffdd..00000000
--- a/meta-arm/recipes-security/optee/optee-test/0001-build-make-cmake-add-Werror-based-on-CFG_WERROR.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From d068b668800a2bacae006f9b4d5d0fcbdabe9223 Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Wed, 7 May 2025 14:01:38 +0200
-Subject: [PATCH] build: make, cmake: add -Werror based on CFG_WERROR
-
-Update the build files that currently set -Werror unconditionally to
-use set it based on the value of CFG_WERROR instead (disabled by
-default).
-
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_test/commit/d068b668800a2bacae006f9b4d5d0fcbdabe9223]
-
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Acked-by: Etienne Carriere <etienne.carriere@foss.st.com>
----
- CMakeLists.txt      | 7 ++++++-
- host/xtest/Makefile | 6 +++++-
- 2 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 77c3a75..0f338b7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -4,6 +4,8 @@ project (optee_test C)
- # Default cross compile settings
- set (CMAKE_TOOLCHAIN_FILE CMakeToolchain.txt)
- 
-+option(CFG_WERROR "Build with -Werror" FALSE)
-+
- set (OPTEE_TEST_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
- ################################################################################
- # Compiler flags:
-@@ -18,10 +20,13 @@ add_compile_options (
- 	-Wmissing-prototypes -Wnested-externs
- 	-Wpointer-arith -Wshadow -Wstrict-prototypes
- 	-Wswitch-default -Wunsafe-loop-optimizations
--	-Wwrite-strings -Werror -fPIC
-+	-Wwrite-strings -fPIC
-  	-Wno-missing-field-initializers
- 	-Wno-unused-parameter
- )
-+if(CFG_WERROR)
-+    add_compile_options(-Werror)
-+endif(CFG_WERROR)
- 
- find_program(CCACHE_FOUND ccache)
- if(CCACHE_FOUND)
-diff --git a/host/xtest/Makefile b/host/xtest/Makefile
-index 2bdf759..37f1d32 100644
---- a/host/xtest/Makefile
-+++ b/host/xtest/Makefile
-@@ -139,7 +139,7 @@ CFLAGS += -DTA_DIR=\"$(TA_DIR)\"
- # Include configuration file generated by OP-TEE OS (CFG_* macros)
- CFLAGS += -include conf.h
- 
--CFLAGS += -Wall -Wcast-align -Werror \
-+CFLAGS += -Wall -Wcast-align \
- 	  -Werror-implicit-function-declaration -Wextra -Wfloat-equal \
- 	  -Wformat-nonliteral -Wformat-security -Wformat=2 -Winit-self \
- 	  -Wmissing-declarations -Wmissing-format-attribute \
-@@ -150,6 +150,10 @@ CFLAGS += -Wall -Wcast-align -Werror \
- 	  -Wno-declaration-after-statement \
- 	  -Wno-missing-field-initializers -Wno-format-zero-length
- 
-+ifeq ($(CFG_WERROR),y)
-+CFLAGS += -Werror
-+endif
-+
- CFLAGS += -g3
- 
- LDFLAGS += -L$(OPTEE_CLIENT_EXPORT)/lib -lteec
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/optee/optee-test/0001-regression_1000-Re-order-the-include-of-sys-stat.h-h.patch b/meta-arm/recipes-security/optee/optee-test/0001-regression_1000-Re-order-the-include-of-sys-stat.h-h.patch
deleted file mode 100644
index 9bc18baf..00000000
--- a/meta-arm/recipes-security/optee/optee-test/0001-regression_1000-Re-order-the-include-of-sys-stat.h-h.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From a15be9eca1b7e935917d834284726027dffc8cfb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Cl=C3=A9ment=20Faure?= <clement.faure@arm.com>
-Date: Wed, 7 May 2025 13:54:36 +0000
-Subject: [PATCH] regression_1000: Re-order the include of <sys/stat.h> header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With musl, the compilation of optee-test would fail:
-
-|   GEN     optee-test/4.6.0/optee-test-4.6.0/xtest/regression_8100_ca_crt.h
-| python3 ../../scripts/file_to_c.py --inf ../../cert/ca.crt --out optee-test/4.6.0/optee-test-4.6.0/xtest/regression_8100_ca_crt.h --name regression_8100_ca_crt
-| In file included from optee-test/4.6.0/recipe-sysroot/usr/include/sys/stat.h:30,
-|                  from optee-test/host/xtest/regression_1000.c:24:
-| optee-test/4.6.0/recipe-sysroot/usr/include/bits/stat.h:17:26: error: expected identifier or '(' before '[' token
-|    17 |         unsigned __unused[2];
-|       |                          ^
-
-The defintion of OP-TEE macro __unused conflicts with the musl implementation
-and its use of variables named __unused.
-
-Re-ordering and including <sys/stat.h> before the macro gets defined is
-enough to work around the issue.
-
-Signed-off-by: Clément Faure <clement.faure@arm.com>
-Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
-Upstream-Status: Backport [a15be9eca1b7e935917d834284726027dffc8cfb]
----
- host/xtest/regression_1000.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
-index e9d20a8..a427789 100644
---- a/host/xtest/regression_1000.c
-+++ b/host/xtest/regression_1000.c
-@@ -20,11 +20,11 @@
- #ifdef CFG_SECURE_DATA_PATH
- #include <sdp_basic.h>
- #endif
-+#include <sys/stat.h>
- #include <signed_hdr.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <sys/stat.h>
- #include <sys/types.h>
- #include <ta_arm_bti.h>
- #include <ta_concurrent.h>
--- 
-2.43.0
-
diff --git a/meta-arm/recipes-security/optee/optee-test_4.6.0.bb b/meta-arm/recipes-security/optee/optee-test_4.7.0.bb
similarity index 70%
rename from meta-arm/recipes-security/optee/optee-test_4.6.0.bb
rename to meta-arm/recipes-security/optee/optee-test_4.7.0.bb
index ab4b8ae2..f42e254a 100644
--- a/meta-arm/recipes-security/optee/optee-test_4.6.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_4.7.0.bb
@@ -1,15 +1,10 @@
 require recipes-security/optee/optee-test.inc
 
-# v4.6.0
-SRCREV = "a9e9495f4d57b97022008ad11198195e7e044c5d"
+# v4.7.0
+SRCREV = "a15be9eca1b7e935917d834284726027dffc8cfb"
 
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
 
-SRC_URI += " \
-    file://0001-build-make-cmake-add-Werror-based-on-CFG_WERROR.patch \
-    file://0001-regression_1000-Re-order-the-include-of-sys-stat.h-h.patch \
-"
-
 # Include ffa_spmc test group if the SPMC test is enabled.
 # Supported after op-tee v3.20
 EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spmc-test', \

