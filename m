Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22CAC6FA82
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 07:16:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.25696.1664176576875882399
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 00:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PAV6TOMn;
 spf=pass (domain: linaro.org, ip: 209.85.214.180,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pl1-f180.google.com with SMTP id d11so5406509pll.8
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 00:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hH5mm6RgbBxiQ0pjv2jXtAZ6uVg4GzOJZdb4e1pwOhE=;
        b=PAV6TOMnOQAZNd1cj1BWPJnKgD2FZfZdiW9eEY3mnPncHyHOyWaBhEIc0E5gMiVzn6
         TY/jzKWLN0lb9Jc5YQ+GBgGG7jJcnPhHmU16GJMJJysBwaBKPiGBwiWkMTpWn89zDiZD
         7wEMPqVkYqUWJ7dtlfP1p125AVk4geiELJI5nE/Wc6i+qbvI+PvUc2yZQUKXtkv2oRjm
         XuZMZA3mAHZyqipmW2AI5KEptw41RCwYjgQUckvfO6DYUpzDbNFbTB96NOS9MopsujGU
         //NoCg98HbEobtn9WyZXJZTIN+57eMRzMw0nMwqJRwyJYQ1mMqCwI0nozwjllYACb5Ic
         rxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hH5mm6RgbBxiQ0pjv2jXtAZ6uVg4GzOJZdb4e1pwOhE=;
        b=RDnejT2TlQkE7kFDMyLtyPmlcnojS57pYAaUoOlYMXKmxIxTpaPuUTc0z3Vl3CGp44
         HDWawq7Jm2fXWEZ/f7vXuObsxfduXZzsX9qxLN0Egfzi9864QmTMICjviEQtr1U2aEmI
         fIMLvOwHufXF3kuSdKtZe4OL8ywhZHK5tbRirZHmrEgjoV76jd5ycsqrN88/LHivce4a
         wQc4neLIsKM5QyLlO8EJTwW/mOAanTi5fLHV31rYQ7hFUKq3+S6jdhOeyCuIi9qqXlMC
         WOj4zm9Y8Ci+6wqRJYYVVV7KYycwYGGGujOj7RPemL7Tg7d6wERip7Qdo+roIuO1aZ+X
         TvjQ==
X-Gm-Message-State: ACrzQf3S6Vv4j5JLq3Zmg/zfHBBL81OUeAf0SalpSfy+Pem12EwG6Lod
	Sy2SxwAQIg9mLnPxFHEZjqGDQlPLvkjW4g==
X-Google-Smtp-Source: 
 AMsMyM68HiLGRD0y2jfXIz0ou6OTJbxjmVAmxPs19ednnfL6DiYn4GqaACUdZ60/UHbDCRvlpwSfWw==
X-Received: by 2002:a17:90b:4f45:b0:203:1cf4:6a54 with SMTP id
 pj5-20020a17090b4f4500b002031cf46a54mr34583227pjb.235.1664176574568;
        Mon, 26 Sep 2022 00:16:14 -0700 (PDT)
Received: from sumit-X1.. ([223.178.208.81])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a170902714b00b00176dac464e5sm10401408plm.173.2022.09.26.00.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:16:13 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	denis@denix.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 1/2] arm-toolchain: update Arm GCC to 11.3
Date: Mon, 26 Sep 2022 12:46:04 +0530
Message-Id: <20220926071605.123085-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 07:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3829

Along with that add a new variable ARM_GCC_SUB_VERSION as newer clubbed
Arm GNU toolchain releases includes a sub-version like the current
release being 11.3.rel1 where ARM_GCC_SUB_VERSION=rel1.

Also, update CI to this release.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 ci/armgcc.yml                                 |   2 +-
 .../gcc-arm-11.2/0009-cpp-honor-sysroot.patch |  59 ----------
 ...gcc-Fix-argument-list-too-long-error.patch |  38 -------
 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  31 ------
 .../{gcc-arm-11.2.inc => gcc-arm-11.3.inc}    |  72 +++++++------
 .../0001-CVE-2021-42574.patch                 |   0
 .../0001-CVE-2021-46195.patch                 |   0
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  10 +-
 .../0002-CVE-2021-42574.patch                 |   0
 .../0002-gcc-poison-system-directories.patch  |  26 ++---
 .../0003-64-bit-multilib-hack.patch}          |   2 +-
 .../0003-CVE-2021-42574.patch                 |   0
 .../0004-CVE-2021-42574.patch                 |   0
 ...s.h-in-B-instead-of-S-and-t-oe-in-B.patch} |  12 +--
 .../gcc-arm-11.3/0005-cpp-honor-sysroot.patch |  53 +++++++++
 ...MIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} | 101 ++++++++++--------
 ...gcc-Fix-argument-list-too-long-error.patch |  42 ++++++++
 .../0008-libtool.patch}                       |   2 +-
 ...-fix-v4bx-to-linker-to-support-EABI.patch} |   2 +-
 ...config-files-from-B-instead-of-usin.patch} |  14 +--
 ...r-from-.la-which-usually-points-to-.patch} |   2 +-
 ...-target-gcc-headers-can-be-included.patch} |   6 +-
 ...-directory-during-relink-if-inst_pr.patch} |   2 +-
 ...fix-libcc1-s-install-path-and-rpath.patch} |   8 +-
 ...e-build-CPP-CPPFLAGS-is-used-for-bu.patch} |  89 +++++++--------
 ...ins-something-unsupported-by-the-bu.patch} |  39 +++----
 ...e-sysroot-support-for-nativesdk-gcc.patch} |  14 +--
 ...root-gcc-version-specific-dirs-with.patch} |   8 +-
 ...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  25 +++++
 ...-to-link-commandline-for-musl-targe.patch} |  10 +-
 ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |   2 +-
 .../0022-sync-gcc-stddef.h-with-musl.patch}   |   2 +-
 ...e-introduce-spe-commandline-options.patch} |   4 +-
 ...s-for-__cpu_indicator_init-instead-.patch} |   6 +-
 ...-Do-not-use-__LINE__-for-maintainin.patch} |   4 +-
 ...gw32-Enable-operation_not_supported.patch} |   2 +-
 ...mic-Do-not-enforce-march-on-aarch64.patch} |  10 +-
 ...y-debug-prefix-maps-before-checksum.patch} |  24 +++--
 .../0029-Fix-install-path-of-linux64.h.patch} |  10 +-
 .../0030-rust-recursion-limit.patch           |  92 ++++++++++++++++
 ...11.2.bb => gcc-cross-canadian_arm-11.3.bb} |   0
 ...ross_arm-11.2.bb => gcc-cross_arm-11.3.bb} |   0
 ...k_arm-11.2.bb => gcc-crosssdk_arm-11.3.bb} |   0
 ...me_arm-11.2.bb => gcc-runtime_arm-11.3.bb} |   0
 ...arm-11.2.bb => gcc-sanitizers_arm-11.3.bb} |   0
 ...rce_arm-11.2.bb => gcc-source_arm-11.3.bb} |   0
 .../gcc/{gcc_arm-11.2.bb => gcc_arm-11.3.bb}  |   0
 ...arm-11.2.bb => libgcc-initial_arm-11.3.bb} |   0
 ...{libgcc_arm-11.2.bb => libgcc_arm-11.3.bb} |   0
 ...an_arm-11.2.bb => libgfortran_arm-11.3.bb} |   0
 50 files changed, 470 insertions(+), 355 deletions(-)
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0009-cpp-honor-sysroot.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0012-gcc-Fix-argument-list-too-long-error.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2.inc => gcc-arm-11.3.inc} (55%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2 => gcc-arm-11.3}/0001-CVE-2021-42574.patch (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2 => gcc-arm-11.3}/0001-CVE-2021-46195.patch (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2 => gcc-arm-11.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (84%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2 => gcc-arm-11.3}/0002-CVE-2021-42574.patch (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2 => gcc-arm-11.3}/0002-gcc-poison-system-directories.patch (93%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0004-64-bit-multilib-hack.patch => gcc-arm-11.3/0003-64-bit-multilib-hack.patch} (99%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2 => gcc-arm-11.3}/0003-CVE-2021-42574.patch (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2 => gcc-arm-11.3}/0004-CVE-2021-42574.patch (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch => gcc-arm-11.3/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch} (91%)
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0005-cpp-honor-sysroot.patch
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch => gcc-arm-11.3/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} (81%)
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0007-gcc-Fix-argument-list-too-long-error.patch
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0014-libtool.patch => gcc-arm-11.3/0008-libtool.patch} (94%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch => gcc-arm-11.3/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch} (95%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch => gcc-arm-11.3/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch} (89%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch => gcc-arm-11.3/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch} (92%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0019-Ensure-target-gcc-headers-can-be-included.patch => gcc-arm-11.3/0012-Ensure-target-gcc-headers-can-be-included.patch} (96%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch => gcc-arm-11.3/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch} (93%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch => gcc-arm-11.3/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch} (90%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0018-export-CPP.patch => gcc-arm-11.3/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch} (79%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch => gcc-arm-11.3/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch} (68%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch => gcc-arm-11.3/0017-handle-sysroot-support-for-nativesdk-gcc.patch} (98%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch => gcc-arm-11.3/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (92%)
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch => gcc-arm-11.3/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch} (84%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch => gcc-arm-11.3/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} (93%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0030-sync-gcc-stddef.h-with-musl.patch => gcc-arm-11.3/0022-sync-gcc-stddef.h-with-musl.patch} (97%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0033-Re-introduce-spe-commandline-options.patch => gcc-arm-11.3/0023-Re-introduce-spe-commandline-options.patch} (90%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch => gcc-arm-11.3/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch} (94%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch => gcc-arm-11.3/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch} (98%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0036-mingw32-Enable-operation_not_supported.patch => gcc-arm-11.3/0026-mingw32-Enable-operation_not_supported.patch} (93%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch => gcc-arm-11.3/0027-libatomic-Do-not-enforce-march-on-aarch64.patch} (85%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch => gcc-arm-11.3/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch} (81%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-11.2/0001-Fix-install-path-of-linux64.h.patch => gcc-arm-11.3/0029-Fix-install-path-of-linux64.h.patch} (81%)
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0030-rust-recursion-limit.patch
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-cross-canadian_arm-11.2.bb => gcc-cross-canadian_arm-11.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-cross_arm-11.2.bb => gcc-cross_arm-11.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-crosssdk_arm-11.2.bb => gcc-crosssdk_arm-11.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-runtime_arm-11.2.bb => gcc-runtime_arm-11.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-sanitizers_arm-11.2.bb => gcc-sanitizers_arm-11.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-source_arm-11.2.bb => gcc-source_arm-11.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc_arm-11.2.bb => gcc_arm-11.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{libgcc-initial_arm-11.2.bb => libgcc-initial_arm-11.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{libgcc_arm-11.2.bb => libgcc_arm-11.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{libgfortran_arm-11.2.bb => libgfortran_arm-11.3.bb} (100%)

diff --git a/ci/armgcc.yml b/ci/armgcc.yml
index d46f0b36..a7971722 100644
--- a/ci/armgcc.yml
+++ b/ci/armgcc.yml
@@ -3,4 +3,4 @@ header:
 
 local_conf_header:
   cc: |
-    GCCVERSION = "arm-11.2"
+    GCCVERSION = "arm-11.3"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0009-cpp-honor-sysroot.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0009-cpp-honor-sysroot.patch
deleted file mode 100644
index 37f26f07..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0009-cpp-honor-sysroot.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 5/5] gcc: Pass sysroot options to cpp for preprocessed source
-
-OpenEmbedded/Yocto Project extensively uses the --sysroot support within gcc.
-We discovered that when compiling preprocessed source (.i or .ii files), the
-compiler will try and access the builtin sysroot location rather than the
---sysroot option specified on the commandline. If access to that directory is
-permission denied (unreadable), gcc will error. This is particularly problematic
-when ccache is involved.
-
-This patch adds %I to the cpp-output spec macro so the default substitutions for
--iprefix, -isystem, -isysroot happen and the correct sysroot is used.
-
-2021-10-27 Richard Purdie <richard.purdie@linuxfoundation.org>
-
-gcc/cp/ChangeLog:
-
-    * lang-specs.h: Pass sysroot options to cpp for preprocessed source
-
-gcc/ChangeLog:
-
-    * gcc.c: Pass sysroot options to cpp for preprocessed source
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-[YOCTO #2074]
-
-Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582725.html]
----
- gcc/cp/lang-specs.h | 2 +-
- gcc/gcc.c           | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: gcc-11.2.0/gcc/cp/lang-specs.h
-===================================================================
---- gcc-11.2.0.orig/gcc/cp/lang-specs.h
-+++ gcc-11.2.0/gcc/cp/lang-specs.h
-@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.
-   {".ii", "@c++-cpp-output", 0, 0, 0},
-   {"@c++-cpp-output",
-       "%{!E:%{!M:%{!MM:"
--      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
-+      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
-       "  %{!fsyntax-only:"
-       "    %{fmodule-only:%{!S:-o %g.s%V}}"
-       "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
-Index: gcc-11.2.0/gcc/gcc.c
-===================================================================
---- gcc-11.2.0.orig/gcc/gcc.c
-+++ gcc-11.2.0/gcc/gcc.c
-@@ -1470,7 +1470,7 @@ static const struct compiler default_com
- 					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
-   {".i", "@cpp-output", 0, 0, 0},
-   {"@cpp-output",
--   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
-+   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
-   {".s", "@assembler", 0, 0, 0},
-   {"@assembler",
-    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0012-gcc-Fix-argument-list-too-long-error.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0012-gcc-Fix-argument-list-too-long-error.patch
deleted file mode 100644
index ebee30bb..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0012-gcc-Fix-argument-list-too-long-error.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 2/5] gcc: Fix "argument list too long" from install-plugins
-
-When building in longer build paths (200+ characters), the
-"echo $(PLUGIN_HEADERS)" from the install-plugins target would cause an
-"argument list too long error" on some systems.
-
-Avoid this by calling make's sort function on the list which removes
-duplicates and stops the overflow from reaching the echo command.
-The original sort is left to handle the the .h and .def files.
-
-2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
-
-gcc/ChangeLog:
-
-    * Makefile.in: Fix "argument list too long" from install-plugins
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582722.html]
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=66e157188bd2f789809e17e85f917534c9381599]
----
- gcc/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: gcc-11.2.0/gcc/Makefile.in
-===================================================================
---- gcc-11.2.0.orig/gcc/Makefile.in
-+++ gcc-11.2.0/gcc/Makefile.in
-@@ -3678,7 +3678,7 @@ install-plugin: installdirs lang.install
- # We keep the directory structure for files in config, common/config or
- # c-family and .def files. All other files are flattened to a single directory.
- 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
--	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
-+	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
- 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
- 	for file in $$headers; do \
- 	  if [ -f $$file ] ; then \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
deleted file mode 100644
index 97c27137..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 4/5] gcc/nios2: Define the musl linker
-
-Add a definition of the musl linker used on the nios2 platform.
-
-2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
-
-gcc/ChangeLog:
-
-    * config/nios2/linux.h (MUSL_DYNAMIC_LINKER): Add musl linker
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582723.html]
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e5ddbbf992b909d8e38851bd3179d29389e6ac97]
----
- gcc/config/nios2/linux.h | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: gcc-11.2.0/gcc/config/nios2/linux.h
-===================================================================
---- gcc-11.2.0.orig/gcc/config/nios2/linux.h
-+++ gcc-11.2.0/gcc/config/nios2/linux.h
-@@ -30,6 +30,7 @@
- #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
-+#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
- 
- #undef LINK_SPEC
- #define LINK_SPEC LINK_SPEC_ENDIAN \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
similarity index 55%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2.inc
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
index 04c6751c..8eba9599 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
@@ -1,22 +1,23 @@
 require recipes-devtools/gcc/gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
-ARM_GCC_VERSION = "11.2"
+ARM_GCC_VERSION = "11.3"
+ARM_GCC_SUB_VERSION = "rel1"
 PV = "arm-${ARM_GCC_VERSION}"
-CVE_VERSION = "11.2"
+CVE_VERSION = "11.3"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "11.2.1"
+BINV = "11.3.1"
 
-MMYY = "22.02"
+MMYY = "22.08"
 RELEASE = "20${MMYY}"
 PR = "r${RELEASE}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-${ARM_GCC_VERSION}:${FILE_DIRNAME}/gcc-arm-${ARM_GCC_VERSION}/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 
@@ -28,47 +29,48 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
 "
 
-BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_GCC_VERSION}-${RELEASE}/srcrel/gcc-arm-src-snapshot-${ARM_GCC_VERSION}-${RELEASE}.tar.xz"
+BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}/srcrel/arm-gnu-toolchain-src-snapshot-${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}.tar.xz"
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
            file://0002-gcc-poison-system-directories.patch \
-           file://0004-64-bit-multilib-hack.patch \
-           file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
-           file://0009-cpp-honor-sysroot.patch \
-           file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
-           file://0012-gcc-Fix-argument-list-too-long-error.patch \
-           file://0014-libtool.patch \
-           file://0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
-           file://0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
-           file://0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
-           file://0018-export-CPP.patch \
-           file://0019-Ensure-target-gcc-headers-can-be-included.patch \
-           file://0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
-           file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
-           file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
-           file://0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
-           file://0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
-           file://0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
-           file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
-           file://0030-sync-gcc-stddef.h-with-musl.patch \
-           file://0033-Re-introduce-spe-commandline-options.patch \
-           file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
-           file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
-           file://0036-mingw32-Enable-operation_not_supported.patch \
-           file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
-           file://0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
-           file://0001-Fix-install-path-of-linux64.h.patch \
+           file://0003-64-bit-multilib-hack.patch \
+           file://0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
+           file://0005-cpp-honor-sysroot.patch \
+           file://0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
+           file://0007-gcc-Fix-argument-list-too-long-error.patch \
+           file://0008-libtool.patch \
+           file://0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
+           file://0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
+           file://0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
+           file://0012-Ensure-target-gcc-headers-can-be-included.patch \
+           file://0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
+           file://0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
+           file://0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch \
+           file://0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
+           file://0017-handle-sysroot-support-for-nativesdk-gcc.patch \
+           file://0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
+           file://0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
+           file://0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
+           file://0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
+           file://0022-sync-gcc-stddef.h-with-musl.patch \
+           file://0023-Re-introduce-spe-commandline-options.patch \
+           file://0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
+           file://0026-mingw32-Enable-operation_not_supported.patch \
+           file://0027-libatomic-Do-not-enforce-march-on-aarch64.patch \
+           file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
+           file://0029-Fix-install-path-of-linux64.h.patch \
+           file://0030-rust-recursion-limit.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0001-CVE-2021-46195.patch \
 "
-SRC_URI[sha256sum] = "417662cd4e79e74b9fbac67bf1edac1c03d11ea58f10144487b7e25e58ff4931"
+SRC_URI[sha256sum] = "4fb9a3c58c94deb91bd75bc503962fae347f05d4d47a0e079141350f08919fb5"
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-${ARM_GCC_VERSION}-${RELEASE}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/arm-gnu-toolchain-src-snapshot-${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}"
 
 # For dev release snapshotting
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-CVE-2021-42574.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0001-CVE-2021-42574.patch
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-CVE-2021-42574.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0001-CVE-2021-42574.patch
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-CVE-2021-46195.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0001-CVE-2021-46195.patch
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-CVE-2021-46195.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0001-CVE-2021-46195.patch
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 84%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 0a108ee5..0bf8834b 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 368eaf1846733a9920c7cf5bc547a377e7167785 Mon Sep 17 00:00:00 2001
+From 6badb97389cae4ff9a533d38dc7cceefe21b97a8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 504f6410274..bcebad264ec 100755
+index e218a19e333..45744e6e471 100755
 --- a/configure
 +++ b/configure
-@@ -9728,7 +9728,7 @@ fi
+@@ -9750,7 +9750,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index 504f6410274..bcebad264ec 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index 088e735c5db..1289fe08760 100644
+index 7e8e628b325..bf66b51373c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3240,7 +3240,7 @@ fi
+@@ -3255,7 +3255,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0002-CVE-2021-42574.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0002-CVE-2021-42574.patch
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0002-CVE-2021-42574.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0002-CVE-2021-42574.patch
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0002-gcc-poison-system-directories.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0002-gcc-poison-system-directories.patch
similarity index 93%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0002-gcc-poison-system-directories.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0002-gcc-poison-system-directories.patch
index 18a9fb87..d19cefbd 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0002-gcc-poison-system-directories.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From 118c6f054711d437167ff125a88c9236bfc8099c Mon Sep 17 00:00:00 2001
+From 863f1f9dc78839ecd021b2cb01d501e8c9e00ef7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Mar 2021 16:04:20 -0800
 Subject: [PATCH] gcc: poison-system-directories
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  7 files changed, 86 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index c75dd36843e..49acbd6ed44 100644
+index a75b44ee47e..d15105a73f3 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
 @@ -683,6 +683,10 @@ Wreturn-local-addr
@@ -40,10 +40,10 @@ index c75dd36843e..49acbd6ed44 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index 10a13cde586..8848284da41 100644
+index 048bf52e8c2..4f973f7906a 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
-@@ -218,6 +218,16 @@
+@@ -230,6 +230,16 @@
  #endif
  
  
@@ -61,10 +61,10 @@ index 10a13cde586..8848284da41 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 9bb436ce7bd..3f0734bff11 100755
+index 7218b0c331a..d7445339f9a 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -1020,6 +1020,7 @@ enable_maintainer_mode
+@@ -1019,6 +1019,7 @@ enable_maintainer_mode
  enable_link_mutex
  enable_link_serialization
  enable_version_specific_runtime_libs
@@ -72,7 +72,7 @@ index 9bb436ce7bd..3f0734bff11 100755
  enable_plugin
  enable_host_shared
  enable_libquadmath_support
-@@ -1782,6 +1783,8 @@ Optional Features:
+@@ -1781,6 +1782,8 @@ Optional Features:
    --enable-version-specific-runtime-libs
                            specify that runtime libraries should be installed
                            in a compiler-specific directory
@@ -81,7 +81,7 @@ index 9bb436ce7bd..3f0734bff11 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -31325,6 +31328,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -31932,6 +31935,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -105,10 +105,10 @@ index 9bb436ce7bd..3f0734bff11 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index caa611933df..54e21764b3e 100644
+index 49f043ed29b..fe488f2232b 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -7123,6 +7123,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -7393,6 +7393,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -132,7 +132,7 @@ index caa611933df..54e21764b3e 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 7a368959e5e..6659a903bf0 100644
+index 35508efb4ef..40f798eac78 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -369,6 +369,7 @@ Objective-C and Objective-C++ Dialects}.
@@ -143,7 +143,7 @@ index 7a368959e5e..6659a903bf0 100644
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
  -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
  -Wno-scalar-storage-order  -Wsequence-point @gol
-@@ -7735,6 +7736,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -7728,6 +7729,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -159,7 +159,7 @@ index 7a368959e5e..6659a903bf0 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 7837553958b..19c75b6e20d 100644
+index 0af888c7d78..b047fc31c2f 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -1152,6 +1152,8 @@ proper position among the other output files.  */
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0004-64-bit-multilib-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0003-64-bit-multilib-hack.patch
similarity index 99%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0004-64-bit-multilib-hack.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0003-64-bit-multilib-hack.patch
index 5f14dd2a..c0e8cbd4 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0004-64-bit-multilib-hack.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0003-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From 2fa5c93641b75a662839c1b6eee172b6c481c70e Mon Sep 17 00:00:00 2001
+From b87a3ac51df372128be2fda992238c5aab4a719a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack.
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0003-CVE-2021-42574.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0003-CVE-2021-42574.patch
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0003-CVE-2021-42574.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0003-CVE-2021-42574.patch
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0004-CVE-2021-42574.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0004-CVE-2021-42574.patch
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0004-CVE-2021-42574.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0004-CVE-2021-42574.patch
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 91%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 9844c2ae..55a58851 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From e64342df647829d3e1c52fd480a5be7c1281ced0 Mon Sep 17 00:00:00 2001
+From 1766cf28fd7d917df510b1c262c47211b9ea70fa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
@@ -26,7 +26,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 8a5fb3fd99c..7da6f439fff 100644
+index 7bfd6ce653f..95962ae37b6 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -552,7 +552,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
@@ -39,10 +39,10 @@ index 8a5fb3fd99c..7da6f439fff 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index 3f0734bff11..c5d3bc4ee2d 100755
+index d7445339f9a..f5b99d1cf7d 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -13090,8 +13090,8 @@ for f in $tm_file; do
+@@ -13131,8 +13131,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -54,10 +54,10 @@ index 3f0734bff11..c5d3bc4ee2d 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 54e21764b3e..f83420326d6 100644
+index fe488f2232b..29005f6d18f 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2263,8 +2263,8 @@ for f in $tm_file; do
+@@ -2294,8 +2294,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0005-cpp-honor-sysroot.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0005-cpp-honor-sysroot.patch
new file mode 100644
index 00000000..f2883fe0
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0005-cpp-honor-sysroot.patch
@@ -0,0 +1,53 @@
+From e6a820a19c4cd115d8af7c235c5f9700c7a24730 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:22:00 +0400
+Subject: [PATCH] cpp: honor sysroot.
+
+Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
+preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location
+rather than the --sysroot option specified on the commandline. If access to that directory is
+permission denied (unreadable), gcc will error.
+
+This happens when ccache is in use due to the fact it uses preprocessed source files.
+
+The fix below adds %I to the cpp-output spec macro so the default substitutions for -iprefix,
+-isystem, -isysroot happen and the correct sysroot is used.
+
+[YOCTO #2074]
+
+RP 2012/04/13
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582725.html]
+---
+ gcc/cp/lang-specs.h | 2 +-
+ gcc/gcc.c           | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
+index 8902ae1d2ed..e99e2fcd6ad 100644
+--- a/gcc/cp/lang-specs.h
++++ b/gcc/cp/lang-specs.h
+@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.  If not see
+   {".ii", "@c++-cpp-output", 0, 0, 0},
+   {"@c++-cpp-output",
+       "%{!E:%{!M:%{!MM:"
+-      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
++      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
+       "  %{!fsyntax-only:"
+       "    %{fmodule-only:%{!S:-o %g.s%V}}"
+       "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index b047fc31c2f..bdee2671532 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1469,7 +1469,7 @@ static const struct compiler default_compilers[] =
+ 					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
+   {".i", "@cpp-output", 0, 0, 0},
+   {"@cpp-output",
+-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
+   {".s", "@assembler", 0, 0, 0},
+   {"@assembler",
+    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 81%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 08847307..ef19eef8 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 8e9d6efecdc8c42f47e3a012dee764b13c3dad59 Mon Sep 17 00:00:00 2001
+From 84dd8ea4c982fc2c82af642293d29e9c1880de5b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -12,25 +12,43 @@ SH, sparc, alpha for possible future support (if any)
 
 Removes the do_headerfix task in metadata
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 Upstream-Status: Inappropriate [OE configuration]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gcc/config/alpha/linux-elf.h |  4 ++--
- gcc/config/arm/linux-eabi.h  |  4 ++--
- gcc/config/arm/linux-elf.h   |  2 +-
- gcc/config/i386/linux.h      |  2 +-
- gcc/config/i386/linux64.h    |  6 +++---
- gcc/config/linux.h           |  8 ++++----
- gcc/config/mips/linux.h      | 12 ++++++------
- gcc/config/riscv/linux.h     |  2 +-
- gcc/config/rs6000/linux64.h  | 15 +++++----------
- gcc/config/sh/linux.h        |  2 +-
- gcc/config/sparc/linux.h     |  2 +-
- gcc/config/sparc/linux64.h   |  4 ++--
- 12 files changed, 29 insertions(+), 34 deletions(-)
+ gcc/config/aarch64/aarch64-linux.h |  4 ++--
+ gcc/config/alpha/linux-elf.h       |  4 ++--
+ gcc/config/arm/linux-eabi.h        |  4 ++--
+ gcc/config/arm/linux-elf.h         |  2 +-
+ gcc/config/i386/linux.h            |  2 +-
+ gcc/config/i386/linux64.h          |  6 +++---
+ gcc/config/linux.h                 |  8 ++++----
+ gcc/config/mips/linux.h            | 12 ++++++------
+ gcc/config/riscv/linux.h           |  2 +-
+ gcc/config/rs6000/linux64.h        | 15 +++++----------
+ gcc/config/sh/linux.h              |  2 +-
+ gcc/config/sparc/linux.h           |  2 +-
+ gcc/config/sparc/linux64.h         |  4 ++--
+ 13 files changed, 31 insertions(+), 36 deletions(-)
 
-unchanged:
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index 7f2529a2a1d..4bcae7f3110 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -21,10 +21,10 @@
+ #ifndef GCC_AARCH64_LINUX_H
+ #define GCC_AARCH64_LINUX_H
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef  ASAN_CC1_SPEC
+ #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
+diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
+index c1dae8ca2cf..3ce2b76c1a4 100644
 --- a/gcc/config/alpha/linux-elf.h
 +++ b/gcc/config/alpha/linux-elf.h
 @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
@@ -44,7 +62,8 @@ unchanged:
  #if DEFAULT_LIBC == LIBC_UCLIBC
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
-unchanged:
+diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
+index 85d0136e76e..6bd95855827 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
 @@ -65,8 +65,8 @@
@@ -58,7 +77,8 @@ unchanged:
  #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
  
  #define GLIBC_DYNAMIC_LINKER \
-unchanged:
+diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
+index 0c1c4e70b6b..6bd643ade11 100644
 --- a/gcc/config/arm/linux-elf.h
 +++ b/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
@@ -70,7 +90,8 @@ unchanged:
  
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
-unchanged:
+diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
+index 04b274f1654..7aafcf3ac2d 100644
 --- a/gcc/config/i386/linux.h
 +++ b/gcc/config/i386/linux.h
 @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -82,7 +103,8 @@ unchanged:
  
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
-unchanged:
+diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
+index b3822ced528..92d303e80d6 100644
 --- a/gcc/config/i386/linux64.h
 +++ b/gcc/config/i386/linux64.h
 @@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -98,7 +120,8 @@ unchanged:
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
-unchanged:
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index 4e1db60fced..87efc5f69fe 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
 @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -116,7 +139,8 @@ unchanged:
  #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
-unchanged:
+diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
+index 44a85e410d9..8d41b5574f6 100644
 --- a/gcc/config/mips/linux.h
 +++ b/gcc/config/mips/linux.h
 @@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
@@ -146,7 +170,8 @@ unchanged:
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
-unchanged:
+diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
+index fce5b896e6e..03aa55cb5ab 100644
 --- a/gcc/config/riscv/linux.h
 +++ b/gcc/config/riscv/linux.h
 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -158,7 +183,8 @@ unchanged:
  
  #define MUSL_ABI_SUFFIX \
    "%{mabi=ilp32:-sf}" \
-unchanged:
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index e3f2cd254f6..a11e01faa3d 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -336,24 +336,19 @@ extern int dot_symbols;
@@ -191,7 +217,8 @@ unchanged:
  
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
-unchanged:
+diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
+index 7558d2f7195..3aaa6c3a078 100644
 --- a/gcc/config/sh/linux.h
 +++ b/gcc/config/sh/linux.h
 @@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -203,7 +230,8 @@ unchanged:
  
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
-unchanged:
+diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
+index 2550d7ee8f0..a94f4cd8ba2 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
 @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
@@ -215,7 +243,8 @@ unchanged:
  
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
-unchanged:
+diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
+index 95af8afa9b5..63127afb074 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
 @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
@@ -229,19 +258,3 @@ unchanged:
  
  #ifdef SPARC_BI_ARCH
  
-diff -u b/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
---- b/gcc/config/aarch64/aarch64-linux.h
-+++ b/gcc/config/aarch64/aarch64-linux.h
-@@ -21,10 +21,10 @@
- #ifndef GCC_AARCH64_LINUX_H
- #define GCC_AARCH64_LINUX_H
- 
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
-+#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
- 
- #undef MUSL_DYNAMIC_LINKER
--#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
-+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
- 
- #undef  ASAN_CC1_SPEC
- #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0007-gcc-Fix-argument-list-too-long-error.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0007-gcc-Fix-argument-list-too-long-error.patch
new file mode 100644
index 00000000..9f9f8cc8
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0007-gcc-Fix-argument-list-too-long-error.patch
@@ -0,0 +1,42 @@
+From 768e9075e88d811b00207d991123438bb996e4ea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:26:37 +0400
+Subject: [PATCH] gcc: Fix argument list too long error.
+
+There would be an "Argument list too long" error when the
+build directory is longer than 200, this is caused by:
+
+headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
+
+The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
+it, use the $(sort list) of GNU make which can handle the too long list
+would fix the problem, the header would be short enough after sorted.
+The "tr ' ' '\012'" was used for translating the space to "\n", the
+$(sort list) doesn't need this.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+RP: gcc then added *.h and *.def additions to this list, breaking the original
+fix. Add the sort to the original gcc code, leaving the tr+sort to fix the original
+issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=66e157188bd2f789809e17e85f917534c9381599]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 95962ae37b6..d1d4512bba3 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -3671,7 +3671,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config, common/config or
+ # c-family and .def files. All other files are flattened to a single directory.
+ 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
+-	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
++	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
+ 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
+ 	for file in $$headers; do \
+ 	  if [ -f $$file ] ; then \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0014-libtool.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0008-libtool.patch
similarity index 94%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0014-libtool.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0008-libtool.patch
index f2b8924e..358e1d7b 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0014-libtool.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0008-libtool.patch
@@ -1,4 +1,4 @@
-From a5b984db9669cf38a7bd76c3fcdb41c086f740db Mon Sep 17 00:00:00 2001
+From b19700ef0103f9414416b9a779a64d6138c58b1f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 95%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index 1ccf39ce..ac139542 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From 0ae7090dec149cb2ff0c87eef87c043d4000ece1 Mon Sep 17 00:00:00 2001
+From 10d23d93697167396e223711bf6210e1642ee926 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 89%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index bde7ec66..4912fa9d 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 5ce8aa4615a3816d12c43752323154744517ae9f Mon Sep 17 00:00:00 2001
+From 5970fb3fadccd8c43f7f7030e6ff51e0295731ef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 5160917d73e..e663052cad2 100755
+index f5b99d1cf7d..ec3c24482df 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -13070,10 +13070,20 @@ done
+@@ -13111,10 +13111,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index 5160917d73e..e663052cad2 100755
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -13084,6 +13094,10 @@ tm_file_list="options.h"
+@@ -13125,6 +13135,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index 5160917d73e..e663052cad2 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 50f78308e8a..2b84875b028 100644
+index 29005f6d18f..ea794cd1763 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2243,10 +2243,20 @@ done
+@@ -2274,10 +2274,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -86,7 +86,7 @@ index 50f78308e8a..2b84875b028 100644
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -2257,6 +2267,10 @@ tm_file_list="options.h"
+@@ -2288,6 +2298,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 92%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 3e0a1b41..e3e35942 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From 75a1ce0265ca123f74f17a40ad8bd8f26d9c2ab3 Mon Sep 17 00:00:00 2001
+From 2af537b9ff0018945a27a7f89efad736a0f647d4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0012-Ensure-target-gcc-headers-can-be-included.patch
similarity index 96%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0019-Ensure-target-gcc-headers-can-be-included.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0012-Ensure-target-gcc-headers-can-be-included.patch
index 120d5a29..d33925eb 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0012-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 6f410ed8fb7eee11ba7a25634c2257666b98ef52 Mon Sep 17 00:00:00 2001
+From 9427c6cedf88e15f747c48cb4fcf9eda6f5c4555 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 22 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 59c45c81393..9b17d120aa1 100644
+index d1d4512bba3..06eb0d27a28 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -630,6 +630,7 @@ libexecdir = @libexecdir@
@@ -36,7 +36,7 @@ index 59c45c81393..9b17d120aa1 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -3016,6 +3017,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -3009,6 +3010,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 93%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index bb2a3671..5b5d229e 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From cd09adb1e7f2a7e81a9f595a17c36f24911b90ac Mon Sep 17 00:00:00 2001
+From ab6e6af5deca6f4b35b089a6b197776df38780e6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 90%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index fb4511cc..b82277cc 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From 2cfc5ee38b3f5ec1d7965aae0991bcd48b5dc2e6 Mon Sep 17 00:00:00 2001
+From fd862c8c112067d8613d921ae89c99056aca54a1 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
@@ -20,10 +20,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index f148fdd7aa2..0b6eb8f2855 100644
+index 3b75e7d9290..d3a4c4f9ddf 100644
 --- a/libcc1/Makefile.am
 +++ b/libcc1/Makefile.am
-@@ -40,8 +40,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+@@ -41,8 +41,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
  	    $(Wc)$(libiberty_normal)))
  libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
  
@@ -35,7 +35,7 @@ index f148fdd7aa2..0b6eb8f2855 100644
  if ENABLE_PLUGIN
  plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
 diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
-index 753d435c9cb..455627b0a3b 100644
+index 07fa9d94c83..a9f737d78f2 100644
 --- a/libcc1/Makefile.in
 +++ b/libcc1/Makefile.in
 @@ -398,8 +398,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0018-export-CPP.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
similarity index 79%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0018-export-CPP.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
index 86ab6574..45953f86 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0018-export-CPP.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
@@ -1,5 +1,8 @@
+From 667b302f637be0a4b6ef714b5eb0026c54425386 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 1/5] Makefile.in: Ensure build CPP/CPPFLAGS is used for build targets
+Date: Sun, 31 Oct 2021 17:40:12 -0700
+Subject: [PATCH] Makefile.in: Ensure build CPP/CPPFLAGS is used for build
+ targets
 
 During cross compiling, CPP is being set to the target compiler even for
 build targets. As an example, when building a cross compiler targetting
@@ -42,6 +45,8 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582727.html]
 Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=84401ce5fb4ecab55decb472b168100e7593e01f]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.in      | 6 ++++++
  Makefile.tpl     | 6 ++++++
@@ -51,11 +56,11 @@ Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=844
  gcc/configure.ac | 2 +-
  6 files changed, 22 insertions(+), 2 deletions(-)
 
-Index: gcc-11.2.0/Makefile.in
-===================================================================
---- gcc-11.2.0.orig/Makefile.in
-+++ gcc-11.2.0/Makefile.in
-@@ -151,6 +151,8 @@ BUILD_EXPORTS = \
+diff --git a/Makefile.in b/Makefile.in
+index 20cbbe2906d..33476d53327 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -154,6 +154,8 @@ BUILD_EXPORTS = \
  	CC="$(CC_FOR_BUILD)"; export CC; \
  	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
@@ -64,7 +69,7 @@ Index: gcc-11.2.0/Makefile.in
  	CXX="$(CXX_FOR_BUILD)"; export CXX; \
  	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
  	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
-@@ -198,6 +200,8 @@ HOST_EXPORTS = \
+@@ -202,6 +204,8 @@ HOST_EXPORTS = \
  	AR="$(AR)"; export AR; \
  	AS="$(AS)"; export AS; \
  	CC_FOR_BUILD="$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
@@ -72,8 +77,8 @@ Index: gcc-11.2.0/Makefile.in
 +	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
  	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
  	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
- 	LD="$(LD)"; export LD; \
-@@ -353,6 +357,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
+ 	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
+@@ -360,6 +364,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
  AS_FOR_BUILD = @AS_FOR_BUILD@
  CC_FOR_BUILD = @CC_FOR_BUILD@
  CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
@@ -82,11 +87,11 @@ Index: gcc-11.2.0/Makefile.in
  CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
  CXX_FOR_BUILD = @CXX_FOR_BUILD@
  DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
-Index: gcc-11.2.0/Makefile.tpl
-===================================================================
---- gcc-11.2.0.orig/Makefile.tpl
-+++ gcc-11.2.0/Makefile.tpl
-@@ -154,6 +154,8 @@ BUILD_EXPORTS = \
+diff --git a/Makefile.tpl b/Makefile.tpl
+index 9adf4f94728..e39d85d1109 100644
+--- a/Makefile.tpl
++++ b/Makefile.tpl
+@@ -157,6 +157,8 @@ BUILD_EXPORTS = \
  	CC="$(CC_FOR_BUILD)"; export CC; \
  	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
@@ -95,7 +100,7 @@ Index: gcc-11.2.0/Makefile.tpl
  	CXX="$(CXX_FOR_BUILD)"; export CXX; \
  	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
  	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
-@@ -201,6 +203,8 @@ HOST_EXPORTS = \
+@@ -205,6 +207,8 @@ HOST_EXPORTS = \
  	AR="$(AR)"; export AR; \
  	AS="$(AS)"; export AS; \
  	CC_FOR_BUILD="$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
@@ -103,8 +108,8 @@ Index: gcc-11.2.0/Makefile.tpl
 +	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
  	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
  	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
- 	LD="$(LD)"; export LD; \
-@@ -356,6 +360,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
+ 	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
+@@ -363,6 +367,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
  AS_FOR_BUILD = @AS_FOR_BUILD@
  CC_FOR_BUILD = @CC_FOR_BUILD@
  CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
@@ -113,11 +118,11 @@ Index: gcc-11.2.0/Makefile.tpl
  CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
  CXX_FOR_BUILD = @CXX_FOR_BUILD@
  DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
-Index: gcc-11.2.0/configure
-===================================================================
---- gcc-11.2.0.orig/configure
-+++ gcc-11.2.0/configure
-@@ -652,6 +652,8 @@ GFORTRAN_FOR_BUILD
+diff --git a/configure b/configure
+index 45744e6e471..ff0de8a68b4 100755
+--- a/configure
++++ b/configure
+@@ -655,6 +655,8 @@ DSYMUTIL_FOR_BUILD
  DLLTOOL_FOR_BUILD
  CXX_FOR_BUILD
  CXXFLAGS_FOR_BUILD
@@ -126,15 +131,15 @@ Index: gcc-11.2.0/configure
  CFLAGS_FOR_BUILD
  CC_FOR_BUILD
  AS_FOR_BUILD
-@@ -4092,6 +4094,7 @@ if test "${build}" != "${host}" ; then
+@@ -4100,6 +4102,7 @@ if test "${build}" != "${host}" ; then
    AR_FOR_BUILD=${AR_FOR_BUILD-ar}
    AS_FOR_BUILD=${AS_FOR_BUILD-as}
    CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
 +  CPP_FOR_BUILD="${CPP_FOR_BUILD-\$(CPP)}"
    CXX_FOR_BUILD=${CXX_FOR_BUILD-g++}
+   DSYMUTIL_FOR_BUILD=${DSYMUTIL_FOR_BUILD-dsymutil}
    GFORTRAN_FOR_BUILD=${GFORTRAN_FOR_BUILD-gfortran}
-   GOC_FOR_BUILD=${GOC_FOR_BUILD-gccgo}
-@@ -9809,6 +9812,7 @@ esac
+@@ -9831,6 +9834,7 @@ esac
  # our build compiler if desired.
  if test x"${build}" = x"${host}" ; then
    CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
@@ -142,19 +147,19 @@ Index: gcc-11.2.0/configure
    CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
    LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
  fi
-Index: gcc-11.2.0/configure.ac
-===================================================================
---- gcc-11.2.0.orig/configure.ac
-+++ gcc-11.2.0/configure.ac
+diff --git a/configure.ac b/configure.ac
+index bf66b51373c..09fa3896dc7 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -1347,6 +1347,7 @@ if test "${build}" != "${host}" ; then
    AR_FOR_BUILD=${AR_FOR_BUILD-ar}
    AS_FOR_BUILD=${AS_FOR_BUILD-as}
    CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
 +  CPP_FOR_BUILD="${CPP_FOR_BUILD-\$(CPP)}"
    CXX_FOR_BUILD=${CXX_FOR_BUILD-g++}
+   DSYMUTIL_FOR_BUILD=${DSYMUTIL_FOR_BUILD-dsymutil}
    GFORTRAN_FOR_BUILD=${GFORTRAN_FOR_BUILD-gfortran}
-   GOC_FOR_BUILD=${GOC_FOR_BUILD-gccgo}
-@@ -3321,6 +3322,7 @@ esac
+@@ -3336,6 +3337,7 @@ esac
  # our build compiler if desired.
  if test x"${build}" = x"${host}" ; then
    CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
@@ -162,7 +167,7 @@ Index: gcc-11.2.0/configure.ac
    CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
    LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
  fi
-@@ -3387,6 +3389,8 @@ AC_SUBST(AR_FOR_BUILD)
+@@ -3402,6 +3404,8 @@ AC_SUBST(AR_FOR_BUILD)
  AC_SUBST(AS_FOR_BUILD)
  AC_SUBST(CC_FOR_BUILD)
  AC_SUBST(CFLAGS_FOR_BUILD)
@@ -171,11 +176,11 @@ Index: gcc-11.2.0/configure.ac
  AC_SUBST(CXXFLAGS_FOR_BUILD)
  AC_SUBST(CXX_FOR_BUILD)
  AC_SUBST(DLLTOOL_FOR_BUILD)
-Index: gcc-11.2.0/gcc/configure
-===================================================================
---- gcc-11.2.0.orig/gcc/configure
-+++ gcc-11.2.0/gcc/configure
-@@ -12699,7 +12699,7 @@ else
+diff --git a/gcc/configure b/gcc/configure
+index ec3c24482df..31a460dc9d0 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -12740,7 +12740,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
@@ -184,11 +189,11 @@ Index: gcc-11.2.0/gcc/configure
  	${realsrcdir}/configure \
  		--enable-languages=${enable_languages-all} \
  		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
-Index: gcc-11.2.0/gcc/configure.ac
-===================================================================
---- gcc-11.2.0.orig/gcc/configure.ac
-+++ gcc-11.2.0/gcc/configure.ac
-@@ -2023,7 +2023,7 @@ else
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index ea794cd1763..b965eb036bc 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -2054,7 +2054,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
similarity index 68%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
index 98a1bb2a..7f807a99 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
@@ -1,8 +1,8 @@
-From e700190743fa29ddaebd6ee075298a24b1688773 Mon Sep 17 00:00:00 2001
+From 2c2a92573598ddbc33c023fe5d499191491fb523 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 28 Oct 2021 11:33:40 +0100
-Subject: [PATCH 6/6] If CXXFLAGS contains something unsupported by the build
- CXX, we see build failures (e.g. using -fmacro-prefix-map for the target).
+Subject: [PATCH] If CXXFLAGS contains something unsupported by the build CXX,
+ we see build failures (e.g. using -fmacro-prefix-map for the target).
 
 Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these errors.
 
@@ -13,19 +13,20 @@ ChangeLog:
     * Makefile.in: Regenerate.
     * Makefile.tpl: Add missing CXXFLAGS_FOR_BUILD overrides
 
+Upstream-Status: Pending [should be submittable]
+
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.in  | 2 ++
  Makefile.tpl | 2 ++
  2 files changed, 4 insertions(+)
 
-Upstream-Status: Pending [should be submittable]
-
-Index: gcc-11.2.0/Makefile.in
-===================================================================
---- gcc-11.2.0.orig/Makefile.in
-+++ gcc-11.2.0/Makefile.in
-@@ -172,6 +172,7 @@ BUILD_EXPORTS = \
+diff --git a/Makefile.in b/Makefile.in
+index 33476d53327..b949dffee0e 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -176,6 +176,7 @@ BUILD_EXPORTS = \
  # built for the build system to override those in BASE_FLAGS_TO_PASS.
  EXTRA_BUILD_FLAGS = \
  	CFLAGS="$(CFLAGS_FOR_BUILD)" \
@@ -33,19 +34,19 @@ Index: gcc-11.2.0/Makefile.in
  	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
  
  # This is the list of directories to built for the host system.
-@@ -203,6 +204,7 @@ HOST_EXPORTS = \
+@@ -207,6 +208,7 @@ HOST_EXPORTS = \
  	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
  	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
  	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
 +	CXXFLAGS_FOR_BUILD="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS_FOR_BUILD; \
  	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
+ 	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
  	LD="$(LD)"; export LD; \
- 	LDFLAGS="$(STAGE1_LDFLAGS) $(LDFLAGS)"; export LDFLAGS; \
-Index: gcc-11.2.0/Makefile.tpl
-===================================================================
---- gcc-11.2.0.orig/Makefile.tpl
-+++ gcc-11.2.0/Makefile.tpl
-@@ -175,6 +175,7 @@ BUILD_EXPORTS = \
+diff --git a/Makefile.tpl b/Makefile.tpl
+index e39d85d1109..d8520cbb164 100644
+--- a/Makefile.tpl
++++ b/Makefile.tpl
+@@ -179,6 +179,7 @@ BUILD_EXPORTS = \
  # built for the build system to override those in BASE_FLAGS_TO_PASS.
  EXTRA_BUILD_FLAGS = \
  	CFLAGS="$(CFLAGS_FOR_BUILD)" \
@@ -53,11 +54,11 @@ Index: gcc-11.2.0/Makefile.tpl
  	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
  
  # This is the list of directories to built for the host system.
-@@ -206,6 +207,7 @@ HOST_EXPORTS = \
+@@ -210,6 +211,7 @@ HOST_EXPORTS = \
  	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
  	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
  	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
 +	CXXFLAGS_FOR_BUILD="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS_FOR_BUILD; \
  	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
+ 	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
  	LD="$(LD)"; export LD; \
- 	LDFLAGS="$(STAGE1_LDFLAGS) $(LDFLAGS)"; export LDFLAGS; \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0017-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 98%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0017-handle-sysroot-support-for-nativesdk-gcc.patch
index b1054fa7..5d86e4c1 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0017-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 354682ad8f71f62643dcd83f64b51b5979615a0c Mon Sep 17 00:00:00 2001
+From 68802ca536b01ab21cfa58e11ef332e30d9a3c5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -46,10 +46,10 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
  8 files changed, 94 insertions(+), 72 deletions(-)
 
 diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
-index 89e05a4c551..5577383665d 100644
+index 6f001e0bb6c..55ab07c278f 100644
 --- a/gcc/c-family/c-opts.c
 +++ b/gcc/c-family/c-opts.c
-@@ -1436,8 +1436,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
+@@ -1438,8 +1438,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
    size_t prefix_len, suffix_len;
  
    suffix_len = strlen (suffix);
@@ -378,7 +378,7 @@ index fd3c655db1c..20669ac427d 100644
     subdirectory of the actual installation.  */
  extern const char *gcc_exec_prefix;
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 8737bae5353..aa6fbe43965 100644
+index bdee2671532..36e8af38630 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -252,6 +252,8 @@ FILE *report_times_to_file = NULL;
@@ -398,7 +398,7 @@ index 8737bae5353..aa6fbe43965 100644
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
   %C     process CPP_SPEC as a spec.
-@@ -1621,10 +1624,10 @@ static const char *gcc_libexec_prefix;
+@@ -1620,10 +1623,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -413,7 +413,7 @@ index 8737bae5353..aa6fbe43965 100644
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1632,9 +1635,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+@@ -1631,9 +1634,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -425,7 +425,7 @@ index 8737bae5353..aa6fbe43965 100644
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -6564,6 +6567,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+@@ -6570,6 +6573,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 92%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index ff622b10..0f43e985 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From c55e24459370ad96577496ecd87475e3a9de7dad Mon Sep 17 00:00:00 2001
+From 14291076874b133e7fb67ef1714b768a2c48ea44 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
@@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index aa6fbe43965..f8a71a13826 100644
+index 36e8af38630..d1faa788d60 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -2811,7 +2811,7 @@ for_each_path (const struct path_prefix *paths,
+@@ -2810,7 +2810,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -63,7 +63,7 @@ index aa6fbe43965..f8a71a13826 100644
  	  path = XNEWVEC (char, len);
  	}
  
-@@ -2823,6 +2823,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2822,6 +2822,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
new file mode 100644
index 00000000..76ebfd7f
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -0,0 +1,25 @@
+From 9ec4db8e910d9a51ae43f6b20d4bf1dac2d8cca8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Feb 2016 10:26:10 -0800
+Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e5ddbbf992b909d8e38851bd3179d29389e6ac97]
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/nios2/linux.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
+index 08edf1521f6..15696d86241 100644
+--- a/gcc/config/nios2/linux.h
++++ b/gcc/config/nios2/linux.h
+@@ -30,6 +30,7 @@
+ #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
+ 
+ #undef LINK_SPEC
+ #define LINK_SPEC LINK_SPEC_ENDIAN \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 84%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 9c616d24..b82fa445 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From 745a2ac7825c73102b888226c54397d21512f86b Mon Sep 17 00:00:00 2001
+From af72a47a677ce98c08cb73444bdd741ca8e28422 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
@@ -22,9 +22,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/config/rs6000/linux64.h | 10 ++++++++++
  3 files changed, 27 insertions(+)
 
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index ba02c013e30..8fcaa0c9faf 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTI
+@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
      { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
    }
@@ -38,6 +40,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
+diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
+index 47c9d9ac0b6..d065f88b377 100644
 --- a/gcc/config/rs6000/linux.h
 +++ b/gcc/config/rs6000/linux.h
 @@ -94,6 +94,16 @@
@@ -57,6 +61,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #undef LINK_OS_LINUX_SPEC
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index a11e01faa3d..ce464f3626b 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -369,6 +369,16 @@ extern int dot_symbols;
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 93%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
index b74aeb8b..9b7c5c56 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -1,4 +1,4 @@
-From 695adb4dffb23c6f5cbc757e05cf4187a2bd6528 Mon Sep 17 00:00:00 2001
+From 79a568dec47baa264eb6290fed3df3244450a92e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 May 2016 21:11:34 -0700
 Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0030-sync-gcc-stddef.h-with-musl.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0022-sync-gcc-stddef.h-with-musl.patch
similarity index 97%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0030-sync-gcc-stddef.h-with-musl.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0022-sync-gcc-stddef.h-with-musl.patch
index fd7d604e..86fb22ff 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0030-sync-gcc-stddef.h-with-musl.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0022-sync-gcc-stddef.h-with-musl.patch
@@ -1,4 +1,4 @@
-From a9173429ae256c4b4a3ab4d758a6adf42f8c4239 Mon Sep 17 00:00:00 2001
+From 07a06aa8e8285c1bb06d0bebeaa9ad04eb76f2e2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Feb 2017 12:56:00 -0800
 Subject: [PATCH] sync gcc stddef.h with musl
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0033-Re-introduce-spe-commandline-options.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0023-Re-introduce-spe-commandline-options.patch
similarity index 90%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0033-Re-introduce-spe-commandline-options.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0023-Re-introduce-spe-commandline-options.patch
index 129f555a..23cf02a6 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0033-Re-introduce-spe-commandline-options.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0023-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From 0b900d6410b7c1938e86eceb87b032fd538566a9 Mon Sep 17 00:00:00 2001
+From ca73043041c3c7aa86af9a3d4f316abc87eb3254 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+)
 
 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index 0dbdf753673..b273eb65c35 100644
+index 6b0a3e27529..1bd2e356ac9 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
 @@ -352,6 +352,19 @@ mdebug=
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 94%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 3f666dc7..f915f284 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From ea9154338cb3acbd75945fddde4202e73c20dd1a Mon Sep 17 00:00:00 2001
+From b3957bc1fd52ec427a1b71b10055905cab4bbc7c Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand.c
-index ac69eed4d32..ffaa44a16fc 100644
+index 31eae75d277..ec7e858ec83 100644
 --- a/gcc/config/i386/i386-expand.c
 +++ b/gcc/config/i386/i386-expand.c
-@@ -11038,10 +11038,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+@@ -11066,10 +11066,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
similarity index 98%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index 874cd779..f33193eb 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From 520411cf364ee4b0b5a8f0857498aaabd790afb3 Mon Sep 17 00:00:00 2001
+From 5fd90d243ae14034a4699443110070dafc0d4d30 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/gengtype.c b/gcc/gengtype.c
-index 5f50242e857..cbaca9b8cd0 100644
+index 98d4626f87e..f602da8b501 100644
 --- a/gcc/gengtype.c
 +++ b/gcc/gengtype.c
 @@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const char *name, options_p opt,
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0036-mingw32-Enable-operation_not_supported.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0026-mingw32-Enable-operation_not_supported.patch
similarity index 93%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0036-mingw32-Enable-operation_not_supported.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0026-mingw32-Enable-operation_not_supported.patch
index 3a7618c8..b46bde1e 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0036-mingw32-Enable-operation_not_supported.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0026-mingw32-Enable-operation_not_supported.patch
@@ -1,4 +1,4 @@
-From 96d895c8d5dc895d24fe37aa2b4f201a2566b4cc Mon Sep 17 00:00:00 2001
+From 7bc34769f0b055e25286576e4ba6d211e8159834 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 12 May 2020 10:39:09 -0700
 Subject: [PATCH] mingw32: Enable operation_not_supported
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
similarity index 85%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
index 4c9a79cb..85b12514 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From 36d4fdbc99e69f9d70a29e2bada40cc3c1534557 Mon Sep 17 00:00:00 2001
+From df1c63bbd7a520e8c6d0d0692b4d8bff56952394 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 deletions(-)
 
 diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index 0f3cd6f7121..c8124c1d5aa 100644
+index ab8c2da24a1..f614a46b34d 100644
 --- a/libatomic/Makefile.am
 +++ b/libatomic/Makefile.am
 @@ -125,7 +125,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix _$(s)_.lo,$(SIZEOBJS)))
@@ -29,14 +29,14 @@ index 0f3cd6f7121..c8124c1d5aa 100644
  endif
  if ARCH_ARM_LINUX
 diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 0a51bd55f01..6d5b1581706 100644
+index 80d25653dc7..7377689ab34 100644
 --- a/libatomic/Makefile.in
 +++ b/libatomic/Makefile.in
-@@ -432,7 +432,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
+@@ -434,7 +434,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
  libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
  	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
  	$(am__append_3) $(am__append_4)
 -@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv8-a+lse
  @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
  @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
- @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
+ @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16 -mcx16
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
similarity index 81%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
index c8dcd74b..de067934 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
@@ -1,7 +1,8 @@
-From 7cc2df084b7977653a9b59cbc34a9ad500ae619c Mon Sep 17 00:00:00 2001
+From 49008eeedc97014f44e12afe179d3785e4438372 Mon Sep 17 00:00:00 2001
 From: Richard Biener <rguenther@suse.de>
 Date: Tue, 20 Jul 2021 11:00:33 +0200
-Subject: [PATCH] debug/101473 - apply debug prefix maps before checksumming DIEs
+Subject: [PATCH] debug/101473 - apply debug prefix maps before checksumming
+ DIEs
 
 The following makes sure to apply the debug prefix maps to filenames
 before checksumming DIEs to create the global symbol for the CU DIE
@@ -36,10 +37,15 @@ The upstream patch was modified to compensate for the definition of
 this version of gcc.
 
 Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
---- a/gcc/dwarf2out.c	2021-04-27 06:00:13.000000000 -0400
-+++ b/gcc/dwarf2out.c	2021-07-23 16:40:06.141886167 -0400
+ gcc/dwarf2out.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+index e5d3ce4966d..41ac3008507 100644
+--- a/gcc/dwarf2out.c
++++ b/gcc/dwarf2out.c
 @@ -1283,6 +1283,7 @@ dwarf2out_switch_text_section (void)
  
  /* Data about a single source file.  */
@@ -48,7 +54,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
    const char * filename;
    int emitted_number;
  };
-@@ -12334,7 +12335,7 @@ file_name_acquire (dwarf_file_data **slo
+@@ -12335,7 +12336,7 @@ file_name_acquire (dwarf_file_data **slot, file_name_acquire_data *fnad)
  
    fi = fnad->files + fnad->used_files++;
  
@@ -57,7 +63,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
  
    /* Skip all leading "./".  */
    while (f[0] == '.' && IS_DIR_SEPARATOR (f[1]))
-@@ -27231,13 +27232,13 @@ dwarf2out_ignore_block (const_tree block
+@@ -27259,13 +27260,13 @@ dwarf2out_ignore_block (const_tree block)
  bool
  dwarf_file_hasher::equal (dwarf_file_data *p1, const char *p2)
  {
@@ -73,7 +79,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
  }
  
  /* Lookup FILE_NAME (in the list of filenames that we know about here in
-@@ -27267,7 +27268,8 @@ lookup_filename (const char *file_name)
+@@ -27295,7 +27296,8 @@ lookup_filename (const char *file_name)
      return *slot;
  
    created = ggc_alloc<dwarf_file_data> ();
@@ -83,7 +89,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
    created->emitted_number = 0;
    *slot = created;
    return created;
-@@ -27293,8 +27295,7 @@ maybe_emit_file (struct dwarf_file_data
+@@ -27321,8 +27323,7 @@ maybe_emit_file (struct dwarf_file_data * fd)
        if (output_asm_line_debug_info ())
  	{
  	  fprintf (asm_out_file, "\t.file %u ", fd->emitted_number);
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-Fix-install-path-of-linux64.h.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0029-Fix-install-path-of-linux64.h.patch
similarity index 81%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-Fix-install-path-of-linux64.h.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0029-Fix-install-path-of-linux64.h.patch
index 5bf895d6..d7e156e7 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-Fix-install-path-of-linux64.h.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0029-Fix-install-path-of-linux64.h.patch
@@ -1,4 +1,4 @@
-From 58211c7ceb0510b2a11a7f1da3c7fa968c658749 Mon Sep 17 00:00:00 2001
+From 8a62cc0a64670e39f462c1dbbf82e04d2f03b89e Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei.gherzan@huawei.com>
 Date: Wed, 22 Dec 2021 12:49:25 +0100
 Subject: [PATCH] Fix install path of linux64.h
@@ -11,15 +11,16 @@ adapts the install path of linux64.h to match the include in tm.h.
 Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
 
 Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/Makefile.in | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 9b17d120a..d175ec4e3 100644
+index 06eb0d27a28..a8678ca24ed 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3693,6 +3693,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -3686,6 +3686,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  	  "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
  	  | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
  	    base=`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
@@ -28,6 +29,3 @@ index 9b17d120a..d175ec4e3 100644
  	  *) base=`basename $$path` ;; \
  	  esac; \
  	  dest=$(plugin_includedir)/$$base; \
--- 
-2.25.1
-
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0030-rust-recursion-limit.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0030-rust-recursion-limit.patch
new file mode 100644
index 00000000..bbe2f18f
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3/0030-rust-recursion-limit.patch
@@ -0,0 +1,92 @@
+From 9234cdca6ee88badfc00297e72f13dac4e540c79 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 1 Jul 2022 15:58:52 +0100
+Subject: [PATCH] Add a recursion limit to the demangle_const function in the
+ Rust demangler.
+
+libiberty/
+	PR demangler/105039
+	* rust-demangle.c (demangle_const): Add recursion limit.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=9234cdca6ee88badfc00297e72f13dac4e540c79]
+---
+ libiberty/rust-demangle.c | 29 ++++++++++++++++++++---------
+ 1 file changed, 20 insertions(+), 9 deletions(-)
+
+diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
+index bb58d900e27..36afcfae278 100644
+--- a/libiberty/rust-demangle.c
++++ b/libiberty/rust-demangle.c
+@@ -126,7 +126,7 @@ parse_integer_62 (struct rust_demangler *rdm)
+     return 0;
+ 
+   x = 0;
+-  while (!eat (rdm, '_'))
++  while (!eat (rdm, '_') && !rdm->errored)
+     {
+       c = next (rdm);
+       x *= 62;
+@@ -1148,6 +1148,15 @@ demangle_const (struct rust_demangler *rdm)
+   if (rdm->errored)
+     return;
+ 
++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    {
++      ++ rdm->recursion;
++      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
++	/* FIXME: There ought to be a way to report
++	   that the recursion limit has been reached.  */
++	goto fail_return;
++    }
++
+   if (eat (rdm, 'B'))
+     {
+       backref = parse_integer_62 (rdm);
+@@ -1158,7 +1167,7 @@ demangle_const (struct rust_demangler *rdm)
+           demangle_const (rdm);
+           rdm->next = old_next;
+         }
+-      return;
++      goto pass_return;
+     }
+ 
+   ty_tag = next (rdm);
+@@ -1167,7 +1176,7 @@ demangle_const (struct rust_demangler *rdm)
+     /* Placeholder. */
+     case 'p':
+       PRINT ("_");
+-      return;
++      goto pass_return;
+ 
+     /* Unsigned integer types. */
+     case 'h':
+@@ -1200,18 +1209,20 @@ demangle_const (struct rust_demangler *rdm)
+       break;
+ 
+     default:
+-      rdm->errored = 1;
+-      return;
++      goto fail_return;
+     }
+ 
+-  if (rdm->errored)
+-    return;
+-
+-  if (rdm->verbose)
++  if (!rdm->errored && rdm->verbose)
+     {
+       PRINT (": ");
+       PRINT (basic_type (ty_tag));
+     }
++
++ fail_return:
++  rdm->errored = 1;
++ pass_return:
++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    -- rdm->recursion;
+ }
+ 
+ static void
+-- 
+2.31.1
+
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-11.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-11.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-11.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-11.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-11.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-11.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-11.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-11.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-11.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-11.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-11.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-11.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-11.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-11.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-11.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-11.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-11.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-11.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-11.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-11.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-11.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-11.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-11.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-11.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-11.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-11.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-11.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-11.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-11.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-11.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-11.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-11.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-11.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-11.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-11.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-11.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-11.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-11.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-11.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-11.3.bb
-- 
2.17.1


