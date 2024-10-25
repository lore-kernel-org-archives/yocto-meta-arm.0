Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04243D149D4
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:50:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.375.1729875008947090995
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 09:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RiktxbNM;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so1457251f8f.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729875007; x=1730479807; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmI+WdWdQBcsmoM++RX7QOPqkEmB9Fe+yB3xz6LPvDs=;
        b=RiktxbNMlR/1uvCZk70TlGUpSc80O4pQwv+3OJoPz/KHbUfM4aeE8FOJEbsJxXOh/f
         Ez1NZc8W5X50Sp66GA74yOH00kZmTcipsQ08f5P0i61F6a+i4u/BX6VDoEcmiasiDdZk
         29Uxikz19OA1lVzqAQJR4N63ARgHOjlgzKOXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875007; x=1730479807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmI+WdWdQBcsmoM++RX7QOPqkEmB9Fe+yB3xz6LPvDs=;
        b=cdlO6HbYV45f/hpDrmDVFgs8Hq5mX7FJeberipzIkRnCPrXBRsGVpDKBmG1rfrjuFk
         WUZJdbx2Fj6Bhf4PG+BbpgKd4QY/ged62SRda/6w46/cK9ujsdLFJBn5561ZfPB/MgEz
         enCElrNE0+VE78MmDrZTgN4WCC9qniCaxRiIwmFsyZPYx6UlxS5f4mRrIeAtpap5Hlxd
         +3jI3u1+QxGFQ6ZOTTCYCODdRZvT3vT05A8vWmFSU96JEwg8+U/1dpqlMzyv3IAZ7NSk
         UcNx26HBRvsIdoti98oW/AHiOUyd98SD3qxVZ7C9PwbtLELNR1Sb+7nNwDxowD5vnVA8
         ad3Q==
X-Gm-Message-State: AOJu0Yy9UDxgex4Z00uG1wEjtdxtdfLWLUR3EVgyINblllg1LoHUdsMp
	6f/Nij6sgm1yJKVAlCUPajibkF2QFLfwDqTiYDg4SSuJqw84DuupTwpCS56cb3w7q2dGlVXZpLa
	W
X-Google-Smtp-Source: AGHT+IHszR4NQ4R+wmJOLnmbGrQHg8wlPmy4YlW3x33miyKLtDztt+7kbFjjtnT7zGmij0UWdyjiNA==
X-Received: by 2002:a05:6000:1f06:b0:37d:5173:7a54 with SMTP id ffacd0b85a97d-3806120d083mr34913f8f.52.1729875007264;
        Fri, 25 Oct 2024 09:50:07 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm1991778f8f.67.2024.10.25.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:50:07 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	Vasyl Vavrychuk <vvavrychuk@gmail.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Romain Naour <romain.naour@smile.fr>
Subject: [PATCH v2 2/8] external-arm-toolchain: wrap base_libdir vs libdir manipulations under usrmerge check
Date: Fri, 25 Oct 2024 18:49:56 +0200
Message-ID: <20241025165002.2794821-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241025165002.2794821-1-romain.naour@smile.fr>
References: <20241025165002.2794821-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 16:50:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6228

From: Vasyl Vavrychuk <vvavrychuk@gmail.com>

With `usrmerge` disto feature `base_libdir` and `libdir` are the same,
so it does not make sense to:

* removing "duplicates" between them
* move files from `base_libdir` to `libdir`

This fixes build error

| mv: '.../tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/external-arm-toolchain/12.2.Rel1/image/usr/lib/libasan.a' and '.../tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/external-arm-toolchain/12.2.Rel1/image/usr/lib/libasan.a' are the same file

in case of `usrmerge` feature enabled.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Acked-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../external-arm-toolchain.bb                 | 62 ++++++++++---------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 1095736b..c22fed0e 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -143,37 +143,39 @@ do_install() {
 	ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
 	ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
 
-	# remove potential .so duplicates from base_libdir
-	# for all symlinks created above in libdir
-	rm -f ${D}${base_libdir}/librt.so
-	rm -f ${D}${base_libdir}/libcrypt.so
-	rm -f ${D}${base_libdir}/libresolv.so
-	rm -f ${D}${base_libdir}/libnss_hesiod.so
-	rm -f ${D}${base_libdir}/libutil.so
-	rm -f ${D}${base_libdir}/libBrokenLocale.so
-	rm -f ${D}${base_libdir}/libpthread.so
-	rm -f ${D}${base_libdir}/libthread_db.so
-	rm -f ${D}${base_libdir}/libanl.so
-	rm -f ${D}${base_libdir}/libdl.so
-	rm -f ${D}${base_libdir}/libnss_db.so
-	rm -f ${D}${base_libdir}/libnss_dns.so
-	rm -f ${D}${base_libdir}/libnss_files.so
-	rm -f ${D}${base_libdir}/libnss_compat.so
-	rm -f ${D}${base_libdir}/libm.so
-
-	# Move these completely to ${libdir} and delete duplicates in ${base_libdir}
-	for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
-		if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
-			mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdir}
-		fi
-		if [ -e ${D}${base_libdir}/lib${lib}.a ] ; then
-			mv ${D}${base_libdir}/lib${lib}.a ${D}${libdir}
-		fi
-		rm -f ${D}${base_libdir}/lib${lib}*
-	done
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'false', 'true', d)}; then
+		# remove potential .so duplicates from base_libdir
+		# for all symlinks created above in libdir
+		rm -f ${D}${base_libdir}/librt.so
+		rm -f ${D}${base_libdir}/libcrypt.so
+		rm -f ${D}${base_libdir}/libresolv.so
+		rm -f ${D}${base_libdir}/libnss_hesiod.so
+		rm -f ${D}${base_libdir}/libutil.so
+		rm -f ${D}${base_libdir}/libBrokenLocale.so
+		rm -f ${D}${base_libdir}/libpthread.so
+		rm -f ${D}${base_libdir}/libthread_db.so
+		rm -f ${D}${base_libdir}/libanl.so
+		rm -f ${D}${base_libdir}/libdl.so
+		rm -f ${D}${base_libdir}/libnss_db.so
+		rm -f ${D}${base_libdir}/libnss_dns.so
+		rm -f ${D}${base_libdir}/libnss_files.so
+		rm -f ${D}${base_libdir}/libnss_compat.so
+		rm -f ${D}${base_libdir}/libm.so
+
+		# Move these completely to ${libdir} and delete duplicates in ${base_libdir}
+		for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
+			if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
+				mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdir}
+			fi
+			if [ -e ${D}${base_libdir}/lib${lib}.a ] ; then
+				mv ${D}${base_libdir}/lib${lib}.a ${D}${libdir}
+			fi
+			rm -f ${D}${base_libdir}/lib${lib}*
+		done
 
-	# Clean up duplicate libs that are both in base_libdir and libdir
-	rm -f ${D}${libdir}/libgcc*
+		# Clean up duplicate libs that are both in base_libdir and libdir
+		rm -f ${D}${libdir}/libgcc*
+	fi
 
 	# Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates like lib*-${EAT_VER_LIBC}.so
 	# Only remove them if both are regular files and are identical
-- 
2.45.0


