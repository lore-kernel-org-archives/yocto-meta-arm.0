Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F55C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 11:32:12 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.10467.1713353524982436299
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 04:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eq7hGm6J;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: vvavrychuk@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a5269c3f9c7so408837566b.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 04:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713353523; x=1713958323; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H25OSKlW0R4RIO7T97PCUoyzD2O6Sbij+MxYY/q3VfA=;
        b=Eq7hGm6JkINX+jug5z+U36UqOyUcxfiCEX9Wrg8fvxmoYzyHTadxhw4Yvcv1vi7zfq
         om6U6UGckvrp1rIu3m6jJWlV/HPJiS2PhYoXuaiY+kPwhsHRVEqRcGSuFOv+UyqXnLmP
         UYfdb8la7XIOehAtjG+jO3leeX84UvZTX+XIQfANOoWviztwO/NvIxeF/tB7uttHULrY
         ED28Exyect/b2co3nsHRaNjrmxgdOx65W+kmPifs0fZFpfyvlJgpF+XvYtgkTliILJZx
         7L9Y9hFBIdVAL0z0uFRJGyydsQ8mo/TGCs7KClxZxhOjMlVn2rOSxsJ+5GlmDMfQOS3Q
         1ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713353523; x=1713958323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H25OSKlW0R4RIO7T97PCUoyzD2O6Sbij+MxYY/q3VfA=;
        b=D9QT0KkIzIgw1dt+7JjYbVzAqvtYyrnjrV9xxnR9wNciN17F5xIwClBzPaKZtishGb
         jcE+FPkkcVmWGv+6hfIyRNnsIeROqT2tgHxmqmNtmydkRfqWgVtR4UPSV/zuvdUMz1cu
         SlhTKNZSDv3yzB9MqUWNQF7eL4rNINGCXJ/crYFtuBhvouoLqqpVEQUvL6+RHQ9Dnhjn
         4Itx+neXBYIhnfhS1hR9wgv17Ii46TdM0va4bvhrpO6CD0rU0Ke646i5D0WiaU652FF7
         h6B0+RmH7ZbFBe+POyIysYOJCqXWRJfwt/RSsUfXRGQKE9zmjr3/rkY3g60N6iqgnflY
         Sy9g==
X-Forwarded-Encrypted: i=1; AJvYcCVUJ8afIyS41VHVQrPmYokjKjyTFAGcO7CblSn0BPyGgz7LOgnVQlzTnfmZVeQ1hM2PIwgP33S0u0PIm6rVDcgwOeZfpB8vPvc1zZgO7kmG
X-Gm-Message-State: AOJu0Yz1IMEyaTWjfuz/FYO1S7UUO+NQTuv3Ed1/itNeo3MjHJMF/w4C
	w6887q7JVkqaJSMFqIr6awc5KcP7q9WbiQgzYizbJhixSxxj9iNm
X-Google-Smtp-Source: AGHT+IGGNBQ8oC3BFdjZBURWHyfBeFu7aKyfjQ55UXT7uz9jGrd5pNuNfpsIIz3RbKh0BrtB7ACkLQ==
X-Received: by 2002:a17:906:6a1d:b0:a52:527a:63fa with SMTP id qw29-20020a1709066a1d00b00a52527a63famr9229683ejc.33.1713353522960;
        Wed, 17 Apr 2024 04:32:02 -0700 (PDT)
Received: from LWO1-LHP-A10856.synapse.com ([213.130.23.14])
        by smtp.gmail.com with ESMTPSA id re3-20020a170906d8c300b00a5559f0f9dcsm623127ejb.79.2024.04.17.04.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 04:32:02 -0700 (PDT)
From: Vasyl Vavrychuk <vvavrychuk@gmail.com>
To: Ross Burton <ross.burton@arm.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arm@lists.yoctoproject.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Subject: [PATCH 1/3] external-arm-toolchain: wrap base_libdir vs libdir manipulations under usrmerge check
Date: Wed, 17 Apr 2024 14:30:40 +0300
Message-Id: <20240417113042.91880-2-vvavrychuk@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417113042.91880-1-vvavrychuk@gmail.com>
References: <20240417113042.91880-1-vvavrychuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 11:32:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5557

With `usrmerge` disto feature `base_libdir` and `libdir` are the same,
so it does not make sense to:

* removing "duplicates" between them
* move files from `base_libdir` to `libdir`

This fixes build error

| mv: '.../tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/external-arm-toolchain/12.2.Rel1/image/usr/lib/libasan.a' and '.../tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/external-arm-toolchain/12.2.Rel1/image/usr/lib/libasan.a' are the same file

in case of `usrmerge` feature enabled.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
---
 .../external-arm-toolchain.bb                 | 62 ++++++++++---------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index fab17611..27aadffd 100644
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
2.40.0


