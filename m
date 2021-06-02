Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.1847.1622657997650206497
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 11:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QiZIs9Zp;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id c13so1559958plz.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Jun 2021 11:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h5c6O2y4ZwxJk8pwtOm56YOikBlYfetRkx4sYfj82fI=;
        b=QiZIs9Zp45B2y5afKFLF7DHkz9L62BoTDBKd73eB8ZqPtes2LiTjM001y0rGncpKbE
         1DaN79GDtCKX/PZXADp3g/hLVqhk4rPlIBhffHoaRDwS3IYWoZln0i/kvoBMFWUogS4V
         oPfjUsWpe4CBtWLpwJEyj9WDCh3aXA0YESyZclXOI6RMdCONaRcpuCHEhAMwFMvWFWVT
         J9QsAEA4U/252X2lfdhz0eQwgJNM1tl0iKv00g+TLyEl0k7TtkZNIYxRzhlJnS+DQQE/
         JFfKHEw/Gws0GX0HVPqaJ1g1OvDgb2NcinU/5MH6IGJcTnorrnz44tvkGUufLw0A4Oap
         tyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h5c6O2y4ZwxJk8pwtOm56YOikBlYfetRkx4sYfj82fI=;
        b=OVl8yY0GJ0qHvHDZbXn1cjgzJSR/AQocZkk0aiVKMFTSRa51eky3xGar9x3ikik9nR
         7RGDeh1walEqdW2aHf/Rz7BGnlG94mBpIXq8hTF/w2TJ4l+efIWIAP83XSvTkfXb9eJm
         lIwFBQpZdwtMzzYxjsd9x1FGcMjqlRNqCfJyhox3BHI0aLg+iWNAWpf0rC3LIpLJWie5
         YhD1Ib5oCfZes2KdyucU8OFOSPxVxT9breYlfTnrk0FmgcWY+UQvfuIiecKAo0e52xRG
         eaIq1pCM32A1L5n6xl5HSDbNalxWtO5NZLdVtZUe+0+VnmAKyRqGtkHbkWHKlknB31MW
         Xv4w==
X-Gm-Message-State: AOAM532lakrKc/ejjdfLpFcennqJIuRWD6q1moib016EW++WlhNVc9wq
	plsB42eLCYNtv0P22Pen+JZxaTpz8bJROQ==
X-Google-Smtp-Source: ABdhPJye1JU1oJvsFvmTtzL36TSL+qTVKTZu8/bbrluBbjd0hZLNE2wy8+60s0b1AgwE15q2DJZTag==
X-Received: by 2002:a17:90a:f0d5:: with SMTP id fa21mr21351711pjb.4.1622657996791;
        Wed, 02 Jun 2021 11:19:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id t1sm272837pfe.61.2021.06.02.11.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:19:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] sbsa-acs: Fix build on hosts with gcc11
Date: Wed,  2 Jun 2021 11:19:53 -0700
Message-Id: <20210602181953.3029563-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a brotli patch which fixes a VLA warning seen with gcc 11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 .../0001-Fix-VLA-parameter-warning.patch      | 44 +++++++++++++++++++
 .../recipes-test/sbsa-acs/sbsa-acs_3.0.bb     |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-Fix-VLA-parameter-warning.patch

diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-Fix-VLA-parameter-warning.patch b/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-Fix-VLA-parameter-warning.patch
new file mode 100644
index 0000000..66dede8
--- /dev/null
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-Fix-VLA-parameter-warning.patch
@@ -0,0 +1,44 @@
+From 498627ebda6271b59920f43a0b9b6187edeb7b09 Mon Sep 17 00:00:00 2001
+From: Adrian Herrera <adr.her.arc.95@gmail.com>
+Date: Mon, 22 Mar 2021 21:06:47 +0000
+Subject: [PATCH] Fix VLA parameter warning
+
+Make VLA buffer types consistent in declarations and definitions.
+Resolves build crash when using -Werror due to "vla-parameter" warning.
+
+Upstream-Status: Submitted [https://github.com/google/brotli/pull/893]
+Signed-off-by: Adrian Herrera <adr.her.arc.95@gmail.com>
+---
+ c/dec/decode.c | 6 ++++--
+ c/enc/encode.c | 5 +++--
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+--- a/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
++++ b/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
+@@ -2030,8 +2030,10 @@ static BROTLI_NOINLINE BrotliDecoderErro
+ }
+ 
+ BrotliDecoderResult BrotliDecoderDecompress(
+-    size_t encoded_size, const uint8_t* encoded_buffer, size_t* decoded_size,
+-    uint8_t* decoded_buffer) {
++    size_t encoded_size,
++    const uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(encoded_size)],
++    size_t* decoded_size,
++    uint8_t decoded_buffer[BROTLI_ARRAY_PARAM(*decoded_size)]) {
+   BrotliDecoderState s;
+   BrotliDecoderResult result;
+   size_t total_out = 0;
+--- a/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
++++ b/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
+@@ -1470,8 +1470,9 @@ static size_t MakeUncompressedStream(
+ 
+ BROTLI_BOOL BrotliEncoderCompress(
+     int quality, int lgwin, BrotliEncoderMode mode, size_t input_size,
+-    const uint8_t* input_buffer, size_t* encoded_size,
+-    uint8_t* encoded_buffer) {
++    const uint8_t input_buffer[BROTLI_ARRAY_PARAM(input_size)],
++    size_t* encoded_size,
++    uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(*encoded_size)]) {
+   BrotliEncoderState* s;
+   size_t out_size = *encoded_size;
+   const uint8_t* input_start = input_buffer;
diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
index 2116fc2..173cfa7 100644
--- a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
@@ -9,7 +9,9 @@ SRC_URI += "git://github.com/ARM-software/sbsa-acs;destsuffix=edk2/ShellPkg/Appl
             git://github.com/tianocore/edk2-libc;destsuffix=edk2/edk2-libc;protocol=https;branch=master;name=libc \
             file://shell.patch \
             file://0001-pal_uefi-Fix-enum-conversion.patch \
-            file://use_bfd_linker.patch"
+            file://use_bfd_linker.patch \
+            file://0001-Fix-VLA-parameter-warning.patch \
+            "
 
 SRCREV_acs = "1b3a37214fe6809e07e471f79d1ef856461bc803"
 SRCREV_libc = "61687168fe02ac4d933a36c9145fdd242ac424d1"
-- 
2.31.1

