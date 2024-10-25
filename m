Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095BED149CD
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:50:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.380.1729875011921504795
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 09:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pqnVgT4h;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37ec4e349f4so1606174f8f.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729875010; x=1730479810; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHAo/wF9gGU9cKVjV6b2wlj3lI5GaJV6dbJreVXcrgc=;
        b=pqnVgT4hFk+L9QvMuBlMz7ykF5FMeQvS6XhyUIUoiXz6GJvXKZKGHWfq5WKZ/n/Msr
         7zxDWPZRUR/F9K9M0nX/j+++zsCF3SB0pTHZQSGgJDUtnD/0vz5hQ+Dw6jhrW3/4Omud
         fmMY5ly2KHbk0Q90oFXEYenKnGtuBKLPInbO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875010; x=1730479810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHAo/wF9gGU9cKVjV6b2wlj3lI5GaJV6dbJreVXcrgc=;
        b=qMqGYOxklld+o6MqvCFF+sILmCD8FII+3gePGveoD+OSuSCAJOIGwVkRkOmfvyrLhW
         j0DNDAO1PCBVa/YWghK8WfIHzj6W7YMefiBcoDsYSTnIp/OEMTWULufjEOve9iWopTTL
         yK2rrFVr0bm8fRwew9NldhI0xxICRnv1UbbvufBadZUxOkVn8l/O1w3h6He9PwgCAiwg
         MnA29FEoQuJfrxTlvL6BGxiBae16DVQDHsUX9lt1rcuk6khn3DqCGeWYrJeiHgAmx2OM
         j2mWgshTYeDacKTKAoMQ0QW04HhXb5tl0MwlUGeVHE0rz6pkt3AkUi/Ru1ue6Np1OEP9
         3nrw==
X-Gm-Message-State: AOJu0YwXLPqY5WvmstrCw0yGLo/xY40KmM0XV/B2gBbm3eOjLNcjuth4
	QFe3Fx1KCD+5h4fjZ9polO+Nq7lfzCxyCl2K3KlH6AfiQU79vAkFOk5DRqIcZ9AHYNaGdmTrGlo
	7
X-Google-Smtp-Source: AGHT+IFSbXF0vs0+NovmSlAo65Hy4WxOqt240B5+c3T8nHXbXt90Cnm0JhMM54qI1Sa22ySLgLPPTA==
X-Received: by 2002:adf:e0c2:0:b0:37d:940c:7391 with SMTP id ffacd0b85a97d-380611e75b9mr51125f8f.41.1729875010291;
        Fri, 25 Oct 2024 09:50:10 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm1991778f8f.67.2024.10.25.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:50:10 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	Romain Naour <romain.naour@smile.fr>
Subject: [PATCH v2 7/8] external-arm-toolchain: rebuild libmvec.so symlink if any
Date: Fri, 25 Oct 2024 18:50:01 +0200
Message-ID: <20241025165002.2794821-7-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241025165002.2794821-1-romain.naour@smile.fr>
References: <20241025165002.2794821-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 16:50:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6233

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
---
 .../external-arm-toolchain/external-arm-toolchain.bb       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index fee0da89..fbb3cbf4 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -144,6 +144,9 @@ do_install() {
 		ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
 		ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
 		ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
+		if [ -f ${D}${base_libdir}/libmvec.so.1 ]; then
+			ln -sf ../../lib/libmvec.so.1 ${D}${libdir}/libmvec.so
+		fi
 
 		# remove potential .so duplicates from base_libdir
 		# for all symlinks created above in libdir
@@ -162,6 +165,7 @@ do_install() {
 		rm -f ${D}${base_libdir}/libnss_files.so
 		rm -f ${D}${base_libdir}/libnss_compat.so
 		rm -f ${D}${base_libdir}/libm.so
+		rm -f ${D}${base_libdir}/libmvec.so
 
 		# Move these completely to ${libdir} and delete duplicates in ${base_libdir}
 		for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
@@ -192,6 +196,9 @@ do_install() {
 		ln -sf libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
 		ln -sf libm.so.6 ${D}${libdir}/libm.so
 		ln -sf libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
+		if [ -f ${D}${libdir}/libmvec.so.1 ]; then
+			ln -sf libmvec.so.1 ${D}${libdir}/libmvec.so
+		fi
 	fi
 
 	# Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates like lib*-${EAT_VER_LIBC}.so
-- 
2.45.0


