Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.8141.1591095941341708269
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 04:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NO1d7CRJ;
 spf=pass (domain: linaro.org, ip: 209.85.210.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-pf1-f194.google.com with SMTP id a127so2864364pfa.12
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 04:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VLWGdeRGCPE4XP+SvR6khmQNcBpy8socW1RMwD6LKIs=;
        b=NO1d7CRJ4YCvg1RT+BD5PHmIphkCeT6s4Wn7GU3+3mYqq7vgaCEFjmMlSD5c35BPoq
         Tzpcnssd4oSMxWRf2wMJ6Xu4mZoAnFVY6tkT5L9lEoMDV/tErLGAOqOtXkzDDHlrq+1m
         3OBKZF53Ug8lq06/PpHluiwqGnZT54JyWORL8FQflVeDzd2vHP6Xky8a7wQ4cOtZk8W/
         uZq6Az5ApW+j9+0ALZY82vEJZt2Y3DMpPWcS4guUCeyT6fPCp8myWnjTeDKyCklVJM5r
         +OOnhD5DpFoqb5vYjAjaPrIZf5+sDKw5pKm++x0k5R+XnvF3FH5VSpGRHd4dPMXJMoF8
         giIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VLWGdeRGCPE4XP+SvR6khmQNcBpy8socW1RMwD6LKIs=;
        b=LrS36Lwbp+tMSuRG26JYGNLKNEOe0TEx030R1pJ5ydWPNPMRIJxNXVoUm8/dKt3hAD
         mO7khymIH7Eo3/fZ+QEWyNmaCeZiIuUWG41okTv2ZrMDat4m5JCuN7HABrfFZkHgWsew
         Ve0SUMcNjhd9KLb6tvkD/8yK/61l1xujwPzVX6JMqutrXvGZhWGK1BeAnZi1ZV76zZo5
         UK7Le+aVEoYSzJu1BeSv1izI85VHEPdRBH/W2JqXzVPvqk+Cau4llxQIVQyzX6RSZCKQ
         091XyND4kQ70DbVwpGalMPlWvXqK0ujlS1M8idfa4kX8PM+3NsHAhvuP9fCznw4JeFN9
         pu/w==
X-Gm-Message-State: AOAM530ICrLeCcwosDcbOnPn0HcXgnmGro+9g1/QOC0a94gyI9CrTMFB
	wHgwtkeNoBgZ0WCVZElgYmn4pMiKBTk=
X-Google-Smtp-Source: ABdhPJxIhlqDfdc4/rs5jThttca6iyNgBM2y7H3Ii/I5kypbltEESQ3NO6ky8XR1wqeVx73pZVpS7g==
X-Received: by 2002:a62:e913:: with SMTP id j19mr25669145pfh.78.1591095940171;
        Tue, 02 Jun 2020 04:05:40 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.66.248])
        by smtp.gmail.com with ESMTPSA id w12sm2277895pjb.11.2020.06.02.04.05.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 04:05:39 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 4/4] external-arm-toolchain: Add package specific licenses
Date: Tue,  2 Jun 2020 16:34:54 +0530
Message-Id: <1591095894-15178-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>

Add license.inc file to state license of various packages provided by
pre-built Arm tool-set.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .../external-arm-toolchain.bb                      |  6 +-
 .../external-arm-toolchain/license.inc             | 76 ++++++++++++++++++++++
 2 files changed, 80 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 7f5a6f5..6bceed0 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -1,9 +1,11 @@
+# This recipe is distributed under MIT license.
+
 require recipes-core/glibc/glibc-package.inc
 
+require license.inc
+
 INHIBIT_DEFAULT_DEPS = "1"
 
-# License applies to this recipe code, not the toolchain itself
-LICENSE = "MIT"
 LIC_FILES_CHKSUM = "\
 	file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
 	file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
new file mode 100644
index 0000000..b6ee42c
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
@@ -0,0 +1,76 @@
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3 & GPLv2 & LGPLv3 & LGPLv2.1 & LGPLv2"
+
+EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
+
+LICENSE_${PN} = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-dev = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-doc = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-dbg = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-pic = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-utils = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-mtrace = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-gconv = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-extra-nss = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-thread-db = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-pcprofile = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-staticdev = "${EAT_LIBC_LICENSE}"
+LICENSE_catchsegv = "${EAT_LIBC_LICENSE}"
+LICENSE_glibc-extra-nss = "${EAT_LIBC_LICENSE}"
+LICENSE_glibc-thread-db = "${EAT_LIBC_LICENSE}"
+
+LICENSE_libmemusage = "${EAT_LIBC_LICENSE}"
+LICENSE_libsegfault = "${EAT_LIBC_LICENSE}"
+LICENSE_libsotruss = "${EAT_LIBC_LICENSE}"
+LICENSE_sln = "${EAT_LIBC_LICENSE}"
+LICENSE_nscd = "${EAT_LIBC_LICENSE}"
+LICENSE_ldd = "${EAT_LIBC_LICENSE}"
+
+LICENSE_libasan-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libasan = "${EAT_GCC_LICENSE}"
+LICENSE_libasan-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_libatomic-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libatomic = "${EAT_GCC_LICENSE}"
+LICENSE_libatomic-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_libg2c-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libg2c = "${EAT_GCC_LICENSE}"
+LICENSE_libgcc-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libgcc = "${EAT_GCC_LICENSE}"
+LICENSE_libgfortran-dbg = "${EAT_GCC_LICENSE}"
+LICENSE_libgfortran-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libgfortran = "${EAT_GCC_LICENSE}"
+LICENSE_libgfortran-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_libgomp-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libgomp = "${EAT_GCC_LICENSE}"
+LICENSE_libgomp-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_libitm-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libitm = "${EAT_GCC_LICENSE}"
+LICENSE_libitm-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_liblsan-dev = "${EAT_GCC_LICENSE}"
+LICENSE_liblsan = "${EAT_GCC_LICENSE}"
+LICENSE_liblsan-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_libmudflap-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libmudflap = "${EAT_GCC_LICENSE}"
+LICENSE_libmudflap-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_libquadmath-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libquadmath = "${EAT_GCC_LICENSE}"
+LICENSE_libquadmath-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_libssp-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libssp = "${EAT_GCC_LICENSE}"
+LICENSE_libssp-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_libstdc++-dbg = "${EAT_GCC_LICENSE}"
+LICENSE_libstdc++-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libstdc++ = "${EAT_GCC_LICENSE}"
+LICENSE_libstdc++-precompile-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libstdc++-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_libtsan-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libtsan = "${EAT_GCC_LICENSE}"
+LICENSE_libtsan-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE_libubsan-dev = "${EAT_GCC_LICENSE}"
+LICENSE_libubsan = "${EAT_GCC_LICENSE}"
+LICENSE_libubsan-staticdev = "${EAT_GCC_LICENSE}"
+
+LICENSE_linux-libc-headers-dev = "GPLv2"
+LICENSE_linux-libc-headers = "GPLv2"
+
+LICENSE_gdbserver = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
-- 
2.7.4

