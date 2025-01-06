Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE17E77198
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 10:12:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.56583.1736158366877208258
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jan 2025 02:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FVGCSfON;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43635796b48so85388915e9.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 02:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736158365; x=1736763165; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D836ZJSpNvaUTatGZH8WEl9fxj/UK9v9mq28u98ybkM=;
        b=FVGCSfONyxRDs93QqjlKV0PO/Bshd4ExX7fMo3N+CnGjrfbcy1mh/S8hK9tondxvi1
         EkghsXdVwxvTxq4ud5WQ8p3u1fqxxtq3UlofUo4z4mIsGqlMv+lotlEzw6PgQN1icKH1
         EAt7fZPp3f8Nros/Dol8FwGIns4mXzJqs4TsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158365; x=1736763165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D836ZJSpNvaUTatGZH8WEl9fxj/UK9v9mq28u98ybkM=;
        b=izMaUJlCUi+/AJ0E27dBINi8GXLyfPCxmgTNBkKP9Ts2hWc2m+OeFolUlf9aFUSYT/
         h/CKnx+6OStUDRxNICc2flekNqVrP9xeW4Bv3W9RPNYIUxzqFA632vxEr29W/vjUcKKy
         9R4rNwa0RO6lBwPl5m+VIHp03Gn8J/n7L01QuuWcWM8oVkEbclTk6DaZYX5DSkQ5y/8t
         ojxmd1DnFy08zcrLGylFzQgMCFPzHgEZc9KebLAwAx4tyzM1Vu3rIvP3hzNX1sghq37r
         M+IPMnmft3Oy5duPZ0jevDKqkMo6i4+8KoRWPZaXRCc1jgdkx7b/8jYYHNsmEMDvfZJz
         CPPA==
X-Gm-Message-State: AOJu0YyfmMRG5VLdCbA4uvdBpzEYE9OHjSZs96/9NJJordJWO9GIq2h4
	FGE/YM4ySbhpL2OJ2auGxXS68ukIgCuDbAtOLj38L+YOhSxrxiRJ1u0tMplo5+/ZLCRBNcoTVOH
	8
X-Gm-Gg: ASbGnctN+Ry8VC+e2s+BOcdFbDpIXHRtKeV1t2o/aZv+pgRTrHSxw2NmNFFGZBoMojj
	EtsjDK5/kc1DJqgfu+ShnD/+lfAzZkJCAZRJO5zGTqgag0eK0sS5EcL4oH5YftV6YLBl7aHXhoh
	8uSD6/S4VAeYPTPjz8r9VDbNT6ozSgyIrApFdc9DEtJfErcN+Ol48uU8vfIvMboYGgvE0j1rto+
	N0IJlZv3b4/Hlky+UtLvI+lyu38cCw81NaFTR0LSCbVdFRpKkJ8DzX5w19PUeBTMyYsCMq0Iwkz
	q16xSJqnbCiUjmSfysw7YpkmZKaEndhzwqpVDQYT0+d/nL3Y9w3EVw==
X-Google-Smtp-Source: AGHT+IHFHmWvkckkGUgv1ipNyVBf+ScIrIVIwwCs15/TMWllt+ZLAiE4I4mf6GtJmfhEl/SvaeZTjw==
X-Received: by 2002:a7b:c7cd:0:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-4365c51e2a3mr489998415e9.0.1736158365353;
        Mon, 06 Jan 2025 02:12:45 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm46899397f8f.92.2025.01.06.02.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:12:45 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [scarthgap PATCH 7/7] external-arm-toolchain: rebuild libmvec.so symlink if any
Date: Mon,  6 Jan 2025 11:12:38 +0100
Message-ID: <20250106101238.982418-8-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106101238.982418-1-romain.naour@smile.fr>
References: <20250106101238.982418-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 10:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6310

On some architectures (namely Aarch64), glibc may provide a libmvec
library since glibc 2.22, which programs built with gcc OpenMP
support might get linked to.

In order for these programs to work on the target, we need to copy this
library to the target filesystem.

Make sure that libmvec.so symlink is correct with or without usermerge
enabled otherwise libmvec.so symlink is broken.

For more details on libmvec, see
https://sourceware.org/glibc/wiki/libmvec.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Acked-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit de47f836e282ad07bdaa72086a96c59e847b880b)
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../external-arm-toolchain/external-arm-toolchain.bb       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 4776b7f8..6a03308d 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -136,6 +136,9 @@ do_install() {
 		ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
 		ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
 		ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
+		if [ -f ${D}${base_libdir}/libmvec.so.1 ]; then
+			ln -sf ../../lib/libmvec.so.1 ${D}${libdir}/libmvec.so
+		fi
 
 		# remove potential .so duplicates from base_libdir
 		# for all symlinks created above in libdir
@@ -154,6 +157,7 @@ do_install() {
 		rm -f ${D}${base_libdir}/libnss_files.so
 		rm -f ${D}${base_libdir}/libnss_compat.so
 		rm -f ${D}${base_libdir}/libm.so
+		rm -f ${D}${base_libdir}/libmvec.so
 
 		# Move these completely to ${libdir} and delete duplicates in ${base_libdir}
 		for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
@@ -184,6 +188,9 @@ do_install() {
 		ln -sf libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
 		ln -sf libm.so.6 ${D}${libdir}/libm.so
 		ln -sf libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
+		if [ -f ${D}${libdir}/libmvec.so.1 ]; then
+			ln -sf libmvec.so.1 ${D}${libdir}/libmvec.so
+		fi
 	fi
 
 	# Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates like lib*-${EAT_VER_LIBC}.so
-- 
2.47.1


