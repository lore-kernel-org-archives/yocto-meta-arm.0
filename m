Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CDFC3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 09:06:35 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.63905.1722503192556433713
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 02:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cSHWCggk;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52fc14d6689so7099555e87.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 01 Aug 2024 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722503191; x=1723107991; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+EqgW5YgfJwSS4usWK8XcSrw6WKvxEZe1Rx8v9zl0Q=;
        b=cSHWCggkKphXOY+IzY5rpdeRNGbYzF9GbxMFGNSdu4eM0nTWVA8ngBte2+0nBce0dE
         topZQ6Ctef/cuBubgyMkrt9694CWpnoxACxBOL2ftkWrSOqoVWSsXltkIPyMq/fBB1nv
         YsCTVAezvT4QgnraRI6fy/1L+6OiHKdptOFI1h70ytGdEN0k8VR4ePz6DS8OMV+OgCyJ
         36a1Rh4NchKkNvTVctd2ECsOpSir35R9dgrz+3ITz8lHj+Oj9E+rRV7xJAMp52StRh7n
         a+Olw8nFuBak3t5PMmPLvPT+OiCmwHsKHQyt++/i22UyR2HFl33haLCBimOiNMqCCf/Y
         8qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722503191; x=1723107991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+EqgW5YgfJwSS4usWK8XcSrw6WKvxEZe1Rx8v9zl0Q=;
        b=uutAPIchK58cOS/REhDgtz5dJ+GdDst2tCxtkewcx0pjxgOEacR8I0sUNTqA6fPfSj
         kEF/jHs3rv6gguYpx0M2UDOwV0SK1gr1Z0G6gcViG3u4TrSaH3egB80dvpn7Di2hRmnr
         ItW4BJmLF90SFjcxRuGMdVv+UEM71jEbzepnRy6YiNd4GQHZZ7cE0O3BA4qj1yAI3LhG
         T3k4MuLq71/00BT+sQNi0RqvLpIUpF4GMH1YQNA0i+GgVVO5rvCltE+iDraINymq5YCV
         bRAa2fl10hjzOg5miX6qdJF/Vfd6pxS8UohBV1zPLdoP9O4f8eGDOckrN4S+9kur2bnE
         JOSw==
X-Gm-Message-State: AOJu0YzLbABrzSxUrbKGRQ+resc1566IuEnYKEtlJaH+xirSlEN1tag+
	q7IlMnO36Rl7M8B5HjFtJJkIzSNfkSvVvIqwCltReOmo70mlte4h2VlChq2M64B1puVNxToBOZJ
	B
X-Google-Smtp-Source: AGHT+IHlgwM3QIx7hncFkYlwBUG5hf7YkPxf5J0a5KuWeSWfN6Dls/NTMpeu3Stwml6auQ0LueaNKA==
X-Received: by 2002:a05:6512:baa:b0:52c:dba6:b4c8 with SMTP id 2adb3069b0e04-530b61aebe2mr1539899e87.13.1722503190566;
        Thu, 01 Aug 2024 02:06:30 -0700 (PDT)
Received: from localhost.localdomain (drt4d6yyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c19fa9sm2504957e87.223.2024.08.01.02.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:06:29 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH][master-next] optee-os: fix buildpaths QA failure on corstone1000
Date: Thu,  1 Aug 2024 12:05:58 +0300
Message-ID: <20240801090558.43415-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Aug 2024 09:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5941

Patch submitted upstream:

https://github.com/OP-TEE/optee_os/pull/6974

Fixes:

https://gitlab.com/jonmason00/meta-arm/-/jobs/7472950159

ERROR: mc:firmware:optee-os-4.2.0-r0 do_package_qa: QA Issue: File /lib/firmware/tee.elf in package optee-os contains reference to TMPDIR [buildpaths]

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...rnel-link.mk-remove-all-debug-flags-.patch | 46 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.2.0.bb  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-core-arch-arm-kernel-link.mk-remove-all-debug-flags-.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-core-arch-arm-kernel-link.mk-remove-all-debug-flags-.patch b/meta-arm/recipes-security/optee/optee-os/0001-core-arch-arm-kernel-link.mk-remove-all-debug-flags-.patch
new file mode 100644
index 00000000..45045490
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-core-arch-arm-kernel-link.mk-remove-all-debug-flags-.patch
@@ -0,0 +1,46 @@
+From 79f9b7f933b16dcb04710a9314a92a3d10561f53 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 1 Aug 2024 09:30:17 +0100
+Subject: [PATCH] core/arch/arm/kernel/link.mk: remove all debug flags from
+ version.o
+
+Default debug flag -g3 was already getting removed from
+version-o-cflags but on corstone1000 platform-cflags-debug-info
+is set to -gdwarf-2 and thus debug info was included in the
+generated version.o. This then included full absolute build
+time path which breaks "buildpaths" yocto QA check since the path
+is also in final tee.elf binary. Remove all debug flags from
+version-o-cflags as a fix/workaround.
+
+Fixes yocto build reproducibility issues on corstone1000:
+
+https://gitlab.com/jonmason00/meta-arm/-/jobs/7472950196
+
+Cc: Jon Mason <jon.mason@arm.com>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ core/arch/arm/kernel/link.mk | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/6974]
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 49e9f4fa1..85fcf0e86 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -150,8 +150,10 @@ define update-buildcount
+ 	fi
+ endef
+ 
+-# filter-out to workaround objdump warning
+-version-o-cflags = $(filter-out -g3,$(core-platform-cflags) \
++# filter-out to workaround objdump warning and to
++# remove build time paths
++version-o-cflags = $(filter-out \
++	$(platform-cflags-debug-info),$(core-platform-cflags) \
+ 			$(platform-cflags) $(cflagscore))
+ # SOURCE_DATE_EPOCH defined for reproducible builds
+ ifneq ($(SOURCE_DATE_EPOCH),)
+-- 
+2.34.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb b/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
index cee024af..c309efa7 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
@@ -9,4 +9,5 @@ SRC_URI += " \
     file://0003-optee-enable-clang-support.patch \
     file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
     file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
+    file://0001-core-arch-arm-kernel-link.mk-remove-all-debug-flags-.patch \
 "
-- 
2.34.1


