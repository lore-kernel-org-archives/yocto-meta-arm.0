Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.17329.1591957979106831209
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 03:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CFvNFnSL;
 spf=pass (domain: linaro.org, ip: 209.85.215.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-pg1-f194.google.com with SMTP id h10so209665pgq.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OfeB+1LrpGcX7YbDOG4IpU2yUelmVDffvMVshJRKTd0=;
        b=CFvNFnSL2VmYFdHX33oDVxmIZqMQgCOzJezdmkiIgnt22azU2gmc/SlTPZrBgWGJcT
         JVx98+O4d/XpBrknlAwYc9iMYSFrdYr/tkCN7CVsXaLL0EFy1Is1hm6fhjbmZUBEQ6Ng
         ey2YReTXY7j04yOt71IuXwNpDT+TpfvDMVuZUXaUSd8MDHqzeymtqYUwmvE9zBHhzBNr
         mbdNVdgYbczmsOZ96g+2UXBu3R3cJ+TzGRyGQL0TpYucDixVoSceJo79e2leTdMFEDHz
         FWaqDJTe8QWteTLYrWvtynOLkAGmHTGXZ/svWJ2hGpmTLr1JS85fqH+lFZ4AVdTqobfk
         DoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OfeB+1LrpGcX7YbDOG4IpU2yUelmVDffvMVshJRKTd0=;
        b=eksR3HSIGV51RS6XzqpjSRBuFw34S2mICysZr9UcmANDYCaCAqsK8C+bpfNnccocgg
         LGZRyfJ0QQmvH5gvc/+ypH5ndUtG+G6vX8nLUjbyb2WxAB6WGuR1y9habQjb2T/NZQr8
         Y5WB+zezP08jowqyT/JWqYLkEnzKBehrQn+tKIBIDdVMKj14+AihL0AYCnvjvkYcBsGz
         AEyhT5ME7YNjScBPHbYllAoKPF1ZHhiCzyifH8GEkWcJ/dLH5kEqLio9LBhvVPKBMO3U
         Xhp/6rY32//u7tesS/B5DH5/inqk6eqRtftOqiFxYvkd/UBFsfnxp4U/deakSKdNS8j6
         MQ+A==
X-Gm-Message-State: AOAM532c5K/TeAVVim7T3unX7QrpW29LFLHRauzgVrD7Pyn4zHe3p8H/
	nu4Du+zBDFUmpCcoE2Ot3f17GTGsKSU=
X-Google-Smtp-Source: ABdhPJymRGn3Fuj7013ajX9z26yhyJs2ZOCNY4LetDjeU0WI+DNgYN6JEP0lyox78Q9+IOHGqzUaRw==
X-Received: by 2002:aa7:859a:: with SMTP id w26mr10600403pfn.10.1591957978137;
        Fri, 12 Jun 2020 03:32:58 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id y81sm5871606pfb.33.2020.06.12.03.32.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 03:32:57 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v3 5/5] external-arm-toolchain: Add package specific licenses
Date: Fri, 12 Jun 2020 16:02:08 +0530
Message-Id: <1591957928-5959-6-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>

Add license.inc file to state license of various packages provided by
pre-built Arm tool-set.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Denys Dmytriyenko <denys@ti.com>
---
 .../external-arm-toolchain.bb                      |  4 +-
 .../external-arm-toolchain/license.inc             | 76 ++++++++++++++++++++++
 2 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 4face74..9f2b2f6 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -1,9 +1,9 @@
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

