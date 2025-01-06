Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218CBE7719D
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 10:12:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.56579.1736158363426623464
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jan 2025 02:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sUYqJ5FU;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e2880606so10304030f8f.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736158362; x=1736763162; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BnX9RZk7Gw4mpWeX/rIMC1Jl1reSK28/lMw2c+u6dE=;
        b=sUYqJ5FUChQp+4WXnF4f2ieKBCzgLGmoqCZesfRDpG1SQIlFAOutcY86hs7COyETub
         8Df47Fxtnx6eIZj3SE89llZxqUlxU/Y9haWIWNaR0Tm0wvMbLnAdknWU++P6BATR2GUz
         5BguHu1YzVCf7qrlthHeV2DM8r6fnJNZKIaWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158362; x=1736763162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BnX9RZk7Gw4mpWeX/rIMC1Jl1reSK28/lMw2c+u6dE=;
        b=kvSWitZFJZ+rFhezuRu/Uyo98wJ1opIlUdFWQ9afbfgCbBqYEtUclMJZvh5PfrdBG4
         UN2o1VxlXQ+RKv5Ua78X7+2XndkknWX48NXuFcztCCTtaScK9R3S8AZ9RVGODQB5GlFD
         i+B5MvIJ0XSwJ/Rjoge0gpqa8nMJ3qhyZCNe5pYqYEh5apH9hkHgFEtKslgn8d2NOvEC
         qk0BQVmHx9xvA+e7L5FOCb6P+wOhnCvTpOJXUsjjFIfjWxDXC9iNlfl4DNMPnD8L+yNZ
         aYiXKVvW2XIYHQi34YMFz3VVrpKWLbPeAopXOmm4GF0WIVlCR5gEzq1zq8UiRa+0LO3v
         Wc7g==
X-Gm-Message-State: AOJu0YyGkh6kG4+rKCs5Ady3Ue8KtHmhT7PQf5+VZ1uGb4cEMMv+do2k
	5+dJL4eMx5phRsHysUH4yPQzKyPrbCRO5PTogyWYN6pM3ON5TvXLEO/dhK/2gwhvBNt3ytaysLH
	D
X-Gm-Gg: ASbGncvUQjKleegYm673fUxl4tX/dnaD7MU1jJGOQpmh7szlrf9sh5MRNApVv7i6z8V
	XurQXZgKPeU8oTLXLGa9nxsPABMVYfgWkWcqlCEyvNK4Izdu1IyY2ZBj1/9cZuM7m7y+naKAs1S
	/W5hh3PNsCaLT9E4ZRH+iEjzNPL8uRw9c3MSs6foGz1QPo7SbFStwnQUNMUFXZU7YmHZjRqJxX2
	fdMz8m9X7CkHlIXbSXkDn5nEkB/fLfkogLB16rffcNtwi4qjOkIKl9wwnAkb2/7zBHDteuch4Wv
	7W9KtEm6WJKE/oLxZUIGIaW7/+s4NCLhps3DxhksqOGd65dw2p5m/g==
X-Google-Smtp-Source: AGHT+IFrhvpkS5KxN33HpFM+MLMhULxEarEPu7ad3YjprehQxDxLF/x42LCLeqlRR/tL9pOqGxgWKw==
X-Received: by 2002:a05:6000:1846:b0:385:e88a:7037 with SMTP id ffacd0b85a97d-38a221e27afmr49001760f8f.6.1736158361885;
        Mon, 06 Jan 2025 02:12:41 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm46899397f8f.92.2025.01.06.02.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:12:41 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [scarthgap PATCH 1/7] external-arm-toolchain: remove old sed fixup for libc.so
Date: Mon,  6 Jan 2025 11:12:32 +0100
Message-ID: <20250106101238.982418-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106101238.982418-1-romain.naour@smile.fr>
References: <20250106101238.982418-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 10:12:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6304

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
Acked-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit 9a0451a959bdcc95986dad85555cb2757e65bea3)
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../external-arm-toolchain/external-arm-toolchain.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 49ad7442..91714f21 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -205,13 +205,13 @@ do_install() {
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
2.47.1


