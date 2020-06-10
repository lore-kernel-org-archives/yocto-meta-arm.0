Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.11118.1591796613554058918
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 06:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wVJaG1Ua;
 spf=pass (domain: linaro.org, ip: 209.85.215.195, mailfrom: sumit.garg@linaro.org)
Received: by mail-pg1-f195.google.com with SMTP id w20so1011377pga.6
        for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2020 06:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=m4kCH126ozbqYfxImq4A0tgN3RqOo5j/ltqxuugGR8Q=;
        b=wVJaG1UaL0P/GxG8/e3NhqG5yIOsILwFCGVua75dk1fZj03XdYyiBCBAG8hrIPo8hv
         uxGimY4OR8mfvyZc4UOqSRLhSytMyFTEaOAgGmrD7sl8hUeC3yUmRmAnbZ7XrPGwjrWS
         4EK/Lz4RqG7/Gq/MpxM26Skw7dlabIhRWAkTSQRIECz700sXlr2w1Si4u19xW1OGY1Fr
         T/fR5o8ixPSspnbKrBjhxUGNAExI8hwaqYy4y/Hr8rWuPV72Jd+hE2DZ1VVMH3a5dkDE
         k0VtxGTSf6cuYwBOCxQ/lKLSR+5hlE5SOAF49rV7tFRAXbG4gC10jlTYwQvT6Ygi2UOU
         XxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=m4kCH126ozbqYfxImq4A0tgN3RqOo5j/ltqxuugGR8Q=;
        b=Ou6oyMxQY8Oy17I1PyKA2ixraa1PT9oS3ku+Jnz2Asp3ScBNy+2zd1p/C4rYDAwGu9
         GCch86xv25WHVZMPtU10alrKPDwBJfMDeNsXzgKf7oscNejjEk2G6C0YOmNNk8IvS/id
         NWT86HCkfJUYa9I5l30a0ArW8NG5CfDk3o4TSJy1E0Q6A68wU/7dXDi3jFmB2yeQcSnj
         k6vyuIJi7BKB+teR+xdwjnx/mS/a7eq+OdYAvQCYLFo7+wFanyl+vdohn62aUBQi3HBy
         5bSBf1KxJJvg2PQjJ3v22kKEXP/XuoRsPMwTRslj1np9vTFxoCX0XFfczowBZjItHbSF
         Ix6w==
X-Gm-Message-State: AOAM533AbseJwiMnGdkaveUJ0qcDtlVAJiKOv3yFXIWCLjA2PIVGtVTT
	fkQRHjXXHmvMYcSZh3qbDbHWETZZ0N8=
X-Google-Smtp-Source: ABdhPJwSyE7tXlE5vY4Zx0LkB0xZXVd29Z71Cyot6ZfxktiJokFSy2mJ9Ztb1ZtljIkIcG05ZNCrAQ==
X-Received: by 2002:a62:76d5:: with SMTP id r204mr2869329pfc.46.1591796612434;
        Wed, 10 Jun 2020 06:43:32 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id u12sm5227530pjy.37.2020.06.10.06.43.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:43:31 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2 2/5] external-arm-toolchain: Refine dev libraries/headers packaging
Date: Wed, 10 Jun 2020 19:12:59 +0530
Message-Id: <1591796582-5015-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>

OE core by default package all libraries/headers installed as
"${libdir}/lib*.so", "${libdir}/*.la" and {includedir} as part of
FILES_${PN}-dev" but in case of external Arm toolchain recipe, multiple
packages are provided which needs to include specific libraries and
headers. So define "FILES_${PN}-dev" from scratch in order to package
dev libraries/headers as part of intended packages and only package
remaining libraries/headers as part of "FILES_${PN}-dev".

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .../external-arm-toolchain.bb                      | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 8cfc208..5d9a0a8 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -546,6 +546,54 @@ FILES_${PN} += "\
 	${base_libdir}/libpcprofile.so \
     "
 
+FILES_${PN}-dev = "\
+	${includedir}/*.h \
+	${includedir}/netatalk/ \
+	${includedir}/netiucv/ \
+	${includedir}/neteconet/ \
+	${includedir}/nfs/ \
+	${includedir}/rpcsvc/ \
+	${includedir}/netipx/ \
+	${includedir}/misc/ \
+	${includedir}/rpc/ \
+	${includedir}/sys/ \
+	${includedir}/netrose/ \
+	${includedir}/arpa/ \
+	${includedir}/netinet/ \
+	${includedir}/netrom/ \
+	${includedir}/finclude/ \
+	${includedir}/netax25/ \
+	${includedir}/netash/ \
+	${includedir}/bits/ \
+	${includedir}/xen/ \
+	${includedir}/netpacket/ \
+	${includedir}/drm/ \
+	${includedir}/net/ \
+	${includedir}/protocols/ \
+	${includedir}/gnu/ \
+	${base_libdir}/*_nonshared.a \
+	${base_libdir}/*.o \
+	${datadir}/aclocal \
+	${libdir}/*.o \
+	${libdir}/*_nonshared.a \
+	${libdir}/libcrypt.so \
+	${libdir}/libc.so \
+	${libdir}/libm.so \
+	${libdir}/libpthread.so \
+	${libdir}/libresolv.so \
+	${libdir}/librt.so \
+	${libdir}/libutil.so \
+	${libdir}/libnss_files.so \
+	${libdir}/libnss_compat.so \
+	${libdir}/libnss_dns.so \
+	${libdir}/libnss_hesiod.so \
+	${libdir}/libnss_db.so \
+	${libdir}/libdl.so \
+	${libdir}/libanl.so \
+	${libdir}/libBrokenLocale.so \
+	${libdir}/libthread_db.so \
+    "
+
 FILES_${PN}-dbg += "${base_libdir}/debug"
 
 # From gcc-runtime.inc
-- 
2.7.4

