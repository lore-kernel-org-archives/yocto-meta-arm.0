Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.10967.1591796626450212167
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 06:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MXxnWge/;
 spf=pass (domain: linaro.org, ip: 209.85.214.195, mailfrom: sumit.garg@linaro.org)
Received: by mail-pl1-f195.google.com with SMTP id t16so976300plo.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2020 06:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ljzw+ZbMhIJ3GrC6q6dtIMm4rVWwo+jJqKZy40Sg9LY=;
        b=MXxnWge/G0KC3DmJSHhgVN24XvaGXuop/+6M4BCwS7QFx/RXmMns659of5FX1Xy9EO
         dTM+km5pWOo7l88ONdTDJZwiA3vlnN+nhBzmhcK/uqUs8Wwp/a4vEi221ODg3P+J1mFN
         +rTThm7LdB2P1pO0tlKqzjHNAXDeRK4bTZYdaE8EulR4Yaijfd2r/kS8wOOgNTR0+Su6
         fcwtEBfYfnbVWq97XfRI3v4dVUt53wRzBcivd649Mg9nLuTCrqgobufhI2fcGXexo2Xy
         kwtq6J4tH1Sy+4N7iN9yUIgoruxX7OiIQq5gCaSnxz01dsLhb3ZXF2CW8lWn4Be6/6C6
         X5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ljzw+ZbMhIJ3GrC6q6dtIMm4rVWwo+jJqKZy40Sg9LY=;
        b=n1Jrfk6iaXc6yGQF0sDM4Dg8nwx5vH+I5Gkf9KHyIF4qVFMruAhx4XLHzLydDhPkiT
         Bk3Kk50tGyFL7hOjF945Mvw1BBOBaujqJLSBgmEwOB3XbTwqI3KADc3Wo5XkpBxRK7l0
         04azsaIv9ggqCNWAYcgPqja4ZhzvP1sMZnkvW6eO39UU63AE1vFMsDDXdS8LxR+PkDHD
         aquyyBqwY54XrU60GhWTmvlDtwlxNFeRSGtFEaArkzSl6q4fIwQemnabF7nI80viKOo4
         8LKgUweN8draXdl6QnH0/AUo3kTjcpLARaGpTE0k9c26fawDErvB5kuwRUSwnOIs0k9U
         Qmyg==
X-Gm-Message-State: AOAM53295f4Fl24G1JlZvQjUzkQL7mkxq/bA01wHDRqnxvxvQzEOllCI
	ynW82kEu3JF+RlEHZrUee4L1u7EZlGI=
X-Google-Smtp-Source: ABdhPJyMtIyMy+Mzy6A0i94eTYQYIeATfO6wzWOxntgtkqB2Z/NWdqFMPcPXVJi/CEOYtIuD6BajRw==
X-Received: by 2002:a17:902:7403:: with SMTP id g3mr2853979pll.342.1591796625243;
        Wed, 10 Jun 2020 06:43:45 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id u12sm5227530pjy.37.2020.06.10.06.43.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:43:44 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2 5/5] external-arm-toolchain: Add package specific licenses
Date: Wed, 10 Jun 2020 19:13:02 +0530
Message-Id: <1591796582-5015-6-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>

Add license.inc file to state license of various packages provided by
pre-built Arm tool-set.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .../external-arm-toolchain.bb                      |  4 +-
 .../external-arm-toolchain/license.inc             | 76 ++++++++++++++++++++++
 2 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 7c7c607..6968536 100644
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

