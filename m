Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB19D149D0
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:50:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.322.1729875009605192333
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 09:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fqPsp1iz;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d495d217bso1910630f8f.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729875008; x=1730479808; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49Sk2z4deS1Ncu4Wc8BtdW57y9TMizYakV6LWocWNRM=;
        b=fqPsp1izWeul1kYpoRO50aXiNgzjAZm5Jl4Y62GMzV1/FxAzEys0dLgyKIsSNi8+Qw
         pM2VU0jEA4huTHM4k5+kkfVWqhf6WTyhVb8gP0dvvpMj09jjmLd64dOMUaeJYx8Rc9Iv
         jJcMVMP5MPNES7MQeP/R89gFrvHaaWIMHZAv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875008; x=1730479808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49Sk2z4deS1Ncu4Wc8BtdW57y9TMizYakV6LWocWNRM=;
        b=Jn3hXprBjVQyN8P1M8PoeT0FhHZJR3lzPCAa8p2UtmJKZ4MJWbYm0HsWMYWfQn1lNv
         Zu/jReE14cflKZvHzrEAMYjNQhfJrmC0ypitm7TKKj8eRTlmnCa6X/wv+rsbyBQPkvcm
         Keu8SicWnRPTwjrqV5dIdV7a6jOeXrwlPqOu5nGl3bRRGfFVi49OHeWs6bcKlM9yGp3m
         LqpI1cIu9U3raTAOLJYh5KFsIrbIjPdJaOw6Ch60nVFxbsFw11OunU41hyrKraYuFv+/
         QjcaGlkxRPSClXTOTxKX81fiC9ktAFBTIYffaG8263q6dYpDEIeNVJpPXeABZNwD1lv/
         lbuQ==
X-Gm-Message-State: AOJu0YwK/fr+kKTowcm/X18uvBa2CJphOCwwaRLOzcHaOIroNsZaeL0B
	WGvFKvi6ahkdrZpnMgIPLo+X6hoYMXSacBDUlBIhT89UO8j5m+ctNNwAgMtPc57RgyRZboY9LiV
	O
X-Google-Smtp-Source: AGHT+IF6Gj3oDFOoteCgt1vjTAeiGNXHn2E9tybjkh7UAq6UleVIDUE+XCBsyxN01ToVyO2iWkuX4g==
X-Received: by 2002:a05:6000:48:b0:37d:4eeb:7370 with SMTP id ffacd0b85a97d-38061247a93mr42131f8f.56.1729875007884;
        Fri, 25 Oct 2024 09:50:07 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm1991778f8f.67.2024.10.25.09.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:50:07 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	Romain Naour <romain.naour@smile.fr>,
	"Parthiban" <parthiban@linumiz.com>
Subject: [PATCH v2 3/8] external-arm-toolchain: wrap symlink handling under usrmerge check
Date: Fri, 25 Oct 2024 18:49:57 +0200
Message-ID: <20241025165002.2794821-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241025165002.2794821-1-romain.naour@smile.fr>
References: <20241025165002.2794821-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 16:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6229

Rework the symlink handling when usermerge is enabled.
Indeed, "ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so" create a
dead link with usermerge...

Based on: https://lists.yoctoproject.org/g/meta-arm/message/5765

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: "Parthiban" <parthiban@linumiz.com>
---
 .../external-arm-toolchain.bb                 | 49 +++++++++++++------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index c22fed0e..cc30f756 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -126,24 +126,25 @@ do_install() {
 	else
 		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/lib/${linker_name} ${D}${base_libdir}/
 	fi
-	ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
-	ln -sf ../../lib/libcrypt.so.1 ${D}${libdir}/libcrypt.so
-	ln -sf ../../lib/libresolv.so.2 ${D}${libdir}/libresolv.so
-	ln -sf ../../lib/libnss_hesiod.so.2 ${D}${libdir}/libnss_hesiod.so
-	ln -sf ../../lib/libutil.so.1 ${D}${libdir}/libutil.so
-	ln -sf ../../lib/libBrokenLocale.so.1 ${D}${libdir}/libBrokenLocale.so
-	ln -sf ../../lib/libpthread.so.0 ${D}${libdir}/libpthread.so
-	ln -sf ../../lib/libthread_db.so.1 ${D}${libdir}/libthread_db.so
-	ln -sf ../../lib/libanl.so.1 ${D}${libdir}/libanl.so
-	ln -sf ../../lib/libdl.so.2 ${D}${libdir}/libdl.so
-	ln -sf ../../lib/libnss_db.so.2 ${D}${libdir}/libnss_db.so
-	ln -sf ../../lib/libnss_dns.so.2 ${D}${libdir}/libnss_dns.so
-	ln -sf ../../lib/libnss_files.so.2 ${D}${libdir}/libnss_files.so
-	ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
-	ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
-	ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'false', 'true', d)}; then
+		ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
+		ln -sf ../../lib/libcrypt.so.1 ${D}${libdir}/libcrypt.so
+		ln -sf ../../lib/libresolv.so.2 ${D}${libdir}/libresolv.so
+		ln -sf ../../lib/libnss_hesiod.so.2 ${D}${libdir}/libnss_hesiod.so
+		ln -sf ../../lib/libutil.so.1 ${D}${libdir}/libutil.so
+		ln -sf ../../lib/libBrokenLocale.so.1 ${D}${libdir}/libBrokenLocale.so
+		ln -sf ../../lib/libpthread.so.0 ${D}${libdir}/libpthread.so
+		ln -sf ../../lib/libthread_db.so.1 ${D}${libdir}/libthread_db.so
+		ln -sf ../../lib/libanl.so.1 ${D}${libdir}/libanl.so
+		ln -sf ../../lib/libdl.so.2 ${D}${libdir}/libdl.so
+		ln -sf ../../lib/libnss_db.so.2 ${D}${libdir}/libnss_db.so
+		ln -sf ../../lib/libnss_dns.so.2 ${D}${libdir}/libnss_dns.so
+		ln -sf ../../lib/libnss_files.so.2 ${D}${libdir}/libnss_files.so
+		ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
+		ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
+		ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
+
 		# remove potential .so duplicates from base_libdir
 		# for all symlinks created above in libdir
 		rm -f ${D}${base_libdir}/librt.so
@@ -175,6 +176,22 @@ do_install() {
 
 		# Clean up duplicate libs that are both in base_libdir and libdir
 		rm -f ${D}${libdir}/libgcc*
+	else
+		ln -sf libcrypt.so.1 ${D}${libdir}/libcrypt.so
+		ln -sf libresolv.so.2 ${D}${libdir}/libresolv.so
+		ln -sf libnss_hesiod.so.2 ${D}${libdir}/libnss_hesiod.so
+		ln -sf libutil.so.1 ${D}${libdir}/libutil.so
+		ln -sf libBrokenLocale.so.1 ${D}${libdir}/libBrokenLocale.so
+		ln -sf libpthread.so.0 ${D}${libdir}/libpthread.so
+		ln -sf libthread_db.so.1 ${D}${libdir}/libthread_db.so
+		ln -sf libanl.so.1 ${D}${libdir}/libanl.so
+		ln -sf libdl.so.2 ${D}${libdir}/libdl.so
+		ln -sf libnss_db.so.2 ${D}${libdir}/libnss_db.so
+		ln -sf libnss_dns.so.2 ${D}${libdir}/libnss_dns.so
+		ln -sf libnss_files.so.2 ${D}${libdir}/libnss_files.so
+		ln -sf libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
+		ln -sf libm.so.6 ${D}${libdir}/libm.so
+		ln -sf libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
 	fi
 
 	# Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates like lib*-${EAT_VER_LIBC}.so
-- 
2.45.0


