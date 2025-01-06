Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166C1E77199
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 10:12:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.56356.1736158364792206013
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jan 2025 02:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=F1wxBMOu;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361815b96cso93990555e9.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 02:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736158363; x=1736763163; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6xJuB2RYYZIkal3L24Ez3N+NbKopysGEDhMLT3PQQ0=;
        b=F1wxBMOuuywpMg5zh2WJLbEWeL0JDj7u7lUgmNolxO/pCPSnU579BB6SF1/I1jVj5g
         sjsXfzGBRnbyNyCsxqy5QMct6ym38KfRJJ0KoSnAvSFSNYAyuhV1nni7RpgS/k+cM/6U
         tQJTbX+935eos6j8cJr82vVCgXXXfOyITdUM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158363; x=1736763163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6xJuB2RYYZIkal3L24Ez3N+NbKopysGEDhMLT3PQQ0=;
        b=tElkcJ3n+nTIDv+HsEvEyzqSkIVuiq5IeJ4kO9yvdX2JEtqbtlZrPvIVYrn/lxVyvs
         RnY5zRcd9czP1Gvt58Gd1bOK2l5KxrAVY7Twp5ciiJ/Q1GkUlciIfrxr0uaU0vQicwtO
         QcZaeqdb4XXrj+b3syQnouDxS9eeiWecftqaVyU1ogmfE9AO9V0Tcd3HAlBHG9bmk8+C
         bNAAgeoPZDg8JbLmcdJj/Qg9aKwO2S30glBL3iDdwYk9FaQRSF270PSgf8OKgoeS1bJA
         e1HBPbwcElOMEYHC5+2m5gZKt5hLv8tZcb6yPUTBUshjzVEVD73HZvykSpUjhn/Kz5gr
         0bEw==
X-Gm-Message-State: AOJu0YwbJ7RN2SXF7BR6iTposRj4wGPYTgvsIJbZcdeTpUTLLM1QcUCb
	q1WOJJ1Kz1BiexvLSL/qHN8GpmXUT0L1fmnvMWOplUqd7oQmIKsxpqvzQhRj0fPuUjUduvriiiN
	T
X-Gm-Gg: ASbGnctKkGsOjKiV+vXYTmWChdXJ6OHCxPad7jzsQcfUSz8Ru8oTDXBHagzPQm+9dkt
	nJD4s6a+DLYyPGgAVBiIV2uqHjY4IDx2SPqEH2dI/jmTQ09cV2q+PAQoXciQFe6t8pO2BrKCzCC
	bictBOeDToRpTXKE7ZAyVdDj4dP+M5AVTc1HT85WNTpOjCyJ7z/9tEy53GOOY7dZCoKTDSBk/vW
	Mmuz6cHmn3lsJV5WxOni3kvOk4/50Zg4hVfidP7WPGFzzkKu9q4zBbB5gyXUvadlVuTdXTTkLdC
	ev9UFvyJj/wSxU/EZp7eS6+zaIr+1xbioHPvLG/LPan3Udy1zf6zug==
X-Google-Smtp-Source: AGHT+IF+owJDrG0CD9COCxuj/ALfMZnwArEHIRO9O/GS2tcMs4BUUICpli7Lgxn2KsoLtnX3M3q68g==
X-Received: by 2002:a5d:5e09:0:b0:385:e38f:8cc with SMTP id ffacd0b85a97d-38a223ffa1emr47038012f8f.38.1736158363057;
        Mon, 06 Jan 2025 02:12:43 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm46899397f8f.92.2025.01.06.02.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:12:42 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: Romain Naour <romain.naour@smile.fr>,
	"Parthiban" <parthiban@linumiz.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [scarthgap PATCH 3/7] external-arm-toolchain: wrap symlink handling under usrmerge check
Date: Mon,  6 Jan 2025 11:12:34 +0100
Message-ID: <20250106101238.982418-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106101238.982418-1-romain.naour@smile.fr>
References: <20250106101238.982418-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 10:12:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6306

Rework the symlink handling when usermerge is enabled.
Indeed, "ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so" create a
dead link with usermerge...

Based on: https://lists.yoctoproject.org/g/meta-arm/message/5765

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: "Parthiban" <parthiban@linumiz.com>
Acked-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit a6f44bbb8042124abeeb4914205d6941cff7a4e8)
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../external-arm-toolchain.bb                 | 49 +++++++++++++------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 0250ea9e..78443526 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -118,24 +118,25 @@ do_install() {
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
@@ -167,6 +168,22 @@ do_install() {
 
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
2.47.1


