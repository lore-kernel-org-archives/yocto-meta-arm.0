Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBE1D149CE
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:50:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.321.1729875008322874570
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 09:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sx2Z1Q4c;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so1415220f8f.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729875007; x=1730479807; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izWXXfvyrdcv7ioV92TF7iDBp1KSzue0zqihTit9pMU=;
        b=sx2Z1Q4cuTuIN3GI2RSWNNW/cnC9VMnKE/E9FqTGiOtFu/1uk4JCBIzOmA08aJqdGF
         VpCDcrFthF8HwpTOaFm1n+TVSWbXi6mJu1PQEXalyTCSfIOpi91V11smFTRBSpoXX5PF
         gCwoaWWM8R7uf22eZopdkWXMIZxQ6pAPeNxCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875007; x=1730479807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izWXXfvyrdcv7ioV92TF7iDBp1KSzue0zqihTit9pMU=;
        b=J8Z2wc0S4g9TGV0ZMFxkrv+2k1drEPKWoDXVEFlpVxe7weo3qKe97fE16bNB2f8rFv
         wZiNXveo5pOgunGLK2so+UDGPwlxKK/SUweJqhPAoAKpGkQD/lw8WMTKPTRzUJyY5Rlw
         dH1zRtnMnh6mj+i0+XeHSD5NQPEcxf/3cI2YGpeU0p6/+ikvneKR4TQSjG5gYBQEBy2U
         lD3nWwMMCXYJ07/tpTSoBUTP2cR2/kDqDu7jVDdcAj/Hbl6ZKzYgmXuA+R+a8hj9hw5h
         5i81zB+ZxtxlVZCG2ScQkzYPkZqyJuv5poUm4uSN2Wlrre0NQykqnMqFEMPHA5n8x6ce
         Fx4g==
X-Gm-Message-State: AOJu0Yx5YwwBf/iPZhGgxdZEfTIR9qbtdr95Nc5NznJ52M+dwQth2AAw
	qYbxrjpwomsWJVTCVejDcpjBJHoJlNcNEaBz7DXbqP7Bu9Gxiao3n7HIJmDD+cWIvOMoomZq1cI
	9
X-Google-Smtp-Source: AGHT+IHEgIgG5Cbpr03uF9pc1dZ1Mav/65E0ccFCFZLrh7SbswnIKcT/o1qRer2ldQ64EttYfmo4+A==
X-Received: by 2002:a5d:614f:0:b0:37d:398f:44f9 with SMTP id ffacd0b85a97d-3806115ae92mr46305f8f.32.1729875006651;
        Fri, 25 Oct 2024 09:50:06 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm1991778f8f.67.2024.10.25.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:50:06 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	Romain Naour <romain.naour@smile.fr>
Subject: [PATCH v2 1/8] external-arm-toolchain: remove old sed fixup for libc.so
Date: Fri, 25 Oct 2024 18:49:55 +0200
Message-ID: <20241025165002.2794821-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 16:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6227

As reported by Vasyl Vavrychuk [1], /${EAT_LIBDIR}/${EAT_TARGET_SYS}
is not present in libc.so in the latest prebuilt toolchains:

ARM32:
  $ cat ./gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/lib/libc.so
  OUTPUT_FORMAT(elf32-littlearm)
  GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )

  $ cat ./gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
  OUTPUT_FORMAT(elf32-littlearm)
  GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )

  $ cat ./arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
  OUTPUT_FORMAT(elf32-littlearm)
  GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )

  $ cat ./arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
  OUTPUT_FORMAT(elf32-littlearm)
  GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )

Aarch64:
  $ cat ./gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/aarch64-linux-gnu/libc/usr/lib/libc.so
  OUTPUT_FORMAT(elf64-littleaarch64)
  GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )

  $ cat ./gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
  OUTPUT_FORMAT(elf64-littleaarch64)
  GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )

  $ cat ./arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
  OUTPUT_FORMAT(elf64-littleaarch64)
  GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )

  $ cat ./arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
  OUTPUT_FORMAT(elf64-littleaarch64)
  GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )

We can safely remove old sed fixup for libc.so.

[1] https://lists.yoctoproject.org/g/meta-arm/message/5565

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../external-arm-toolchain/external-arm-toolchain.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 1e8c1116..1095736b 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -213,13 +213,13 @@ do_install() {
 	rm -rf ${D}${includedir}/rpcsvc/rquota.*
 
 	if [ -f ${D}${libdir}/libc.so ];then
-		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
+		sed -i -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
 		sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${libdir}/libc.so
 		sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
 	fi
 
 	if [ -f ${D}${base_libdir}/libc.so ];then
-		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
+		sed -i -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
 		if [ -f ${D}${base_libdir}/libc.so.6 ]; then
 			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
 		fi
-- 
2.45.0


