Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CE7E7719F
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 10:12:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.56580.1736158364039417227
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jan 2025 02:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2rQl0Ipj;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so15871215e9.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736158362; x=1736763162; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcWHEFoLC5em3YcHj+AH0HVD6/vl8D0A9xSe6wtZDdw=;
        b=2rQl0Ipj+lOBkH88FVpCqoYO5Wvhy8XTQQKeZJc2ls5OxD9wdacmknFAybnQWWVnN8
         UopNL9O6Sv9WRlmrIp1nP5JMSw9w2y7LqmxO6vrgVbIq8oUX8h7VOkYvEStE4dr6wz1w
         j/VxXOf1b3Y6ICl8vgEMR1ZIPOp9ImegauoWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158362; x=1736763162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcWHEFoLC5em3YcHj+AH0HVD6/vl8D0A9xSe6wtZDdw=;
        b=qi7FF/2wfoDASBvNM+lRHhVY4xrqFNfqZ68bkbAoA5TAczwO8KpAT2Et7O1+S+LTcs
         C5GVAsQKqEr7ZNr5HRGarkXTZnXqldKS+FNN1vLD7E7lTRBfZOxgULyHbrPjUdmsXMpD
         U6CY/yoDNcTy+PMWuu02vQBhC8TD6WttpWtNi9n2V3iyIrGuYcqXoBs5FmyEMi45T9kF
         1mKS+VmkZMFcsQAL3eip/o42ZFTtE9BGtpPOjPtWUflOa3161lifsNd9vYf7pL7f4jBy
         2p5mspQbROlNDvMbDzAOZo7xrzVHirEEEahUX7VheKXas+VSNZ/3OlFjMOUESPyXOAEP
         kndw==
X-Gm-Message-State: AOJu0YzGIUC9sUfIVnC0pVMOtmNy06u1kEDSJiEmA1xw6fZB6rF6Whfz
	dcX6JFbr3UjS89t5AJcBeGVqfWqhx7YAJ2MWhKKpyghw2pYJDRs8slpWMX44DMFpMYS9E0qJCtC
	B
X-Gm-Gg: ASbGncsJO158tfk3c4HudLbMDt54mr+EQbiZwLRpk+XpMVgLnD7BQtZ5KboSs6vQecH
	h9VIHJbwDlnGE79BUOES+QMbzKRlvmvNjQekcuSaDoa9wLaeS0D5yZbwr6KDSvuHqa9PjYgaSSY
	5illatYnbMlfROu4Vpa7jSJfA+PSMjyv97b1fayJygZCjPoPlOdA+7N36L6zA7Vf2Ec9CmlDj3U
	XoSi/BYTL9NraVLZt5DEWoG4o3qV5d1nKoxfspAL8ffMLB5LRwnmrD9KG33cc7o1+R/dvYoIAR/
	F7pAqz6Mpr4wqZUX6qVHIcmM+QRkpCGmdM+/GvcBUp0TKchH4Y3Lfw==
X-Google-Smtp-Source: AGHT+IH/Sc63god/USO+lf05K5aZFUjMRYXmERUrGQu+CdsccJsRksQn1l1ZZQ4HZOAR4IM+PYv0zQ==
X-Received: by 2002:a5d:5e09:0:b0:385:f092:e00 with SMTP id ffacd0b85a97d-38a223fd2bdmr49222085f8f.50.1736158362500;
        Mon, 06 Jan 2025 02:12:42 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm46899397f8f.92.2025.01.06.02.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:12:42 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Romain Naour <romain.naour@smile.fr>,
	Jon Mason <jon.mason@arm.com>
Subject: [scarthgap PATCH 2/7] external-arm-toolchain: wrap base_libdir vs libdir manipulations under usrmerge check
Date: Mon,  6 Jan 2025 11:12:33 +0100
Message-ID: <20250106101238.982418-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106101238.982418-1-romain.naour@smile.fr>
References: <20250106101238.982418-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 10:12:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6305

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
Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit 98eea6296290b5aead0e8d9281a91fbd94c3bf4e)
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../external-arm-toolchain.bb                 | 62 ++++++++++---------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 91714f21..0250ea9e 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -135,37 +135,39 @@ do_install() {
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
2.47.1


