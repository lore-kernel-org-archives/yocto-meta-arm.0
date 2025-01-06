Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0999EE7719B
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 10:12:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.56581.1736158365190383830
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jan 2025 02:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3MRQPlgd;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43675b1155bso134172745e9.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 02:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736158363; x=1736763163; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zFONjqPg+/SfIqYdaQMfT6VfOPnqZcA0pwUPy0rBDg=;
        b=3MRQPlgdp0HSRHUrNMtO9WkNmXxKvi8avdi2j8ESr9pCC8yP1tMsYRDWwCJcnmTDze
         9Kd0ucGso47u/DzFrLpPptYr0luEPbHZ+GRqiI6Zey1VP88gBA4sJEjo6hGIU1uW+ehw
         yJaVMbcmKHXl3rqj5UMHOcNiY4ZqNQKJPInKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158363; x=1736763163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zFONjqPg+/SfIqYdaQMfT6VfOPnqZcA0pwUPy0rBDg=;
        b=lM8j1ytpKSIYrVeyELTNIOmu/UR6d8mz6gJ6nJsk5KEYrmPBIhaN4m+eRw94wO9Dq9
         fQPD3rN4dKlcAj3awynjKjH1ffFVSrjMX5q7sExygjcG7BYLmEVz1iccv3bptCjNt26K
         0dl3yeQNhzM5WVqHzBAdh+0ybR7HjZaw9Eo1S5VprJf/D99IgdjQXlpN1SaA5SGWEjMv
         kcfVsbsBka9dLaWeOCvt7LpVclOP4KdTRzzivOeywO5vk8f1KK6XJw9Vr2Y2z8UdjHcx
         rTOTYhCtnXU3t/tbCEmKpgOvnMeuyxDnm3rP3McRdITey+R99fKDuaEUQT0FvSPtvka5
         DvmQ==
X-Gm-Message-State: AOJu0YwZW/hw95lBWawR5wmYLuC8F6gJ34mtEc/ZoDfIsoRsTOtoc0zk
	HAlDoPx2rYhv3OoZs0W/n5x2PNfKzwJEgDsTpLMCTAnvST1xHbH4fL4jlCCN+8NpaduSzfCjVro
	K
X-Gm-Gg: ASbGncvSvUER/+yFMwphpJIgKF5X6lVlhmAPx2rDKJmkRIX+RJYsb0fljOHYEQvqhnM
	nW5/dTdilzG8s1nL46CLenT7QbPfb3PkkydMOh951HgC43bfqZavJ279K6rkliaj6MIxfPUDJ6h
	xvKPqN1zgq7a4/cHZutni0IDm3j8AnLtZIFK4mxXjxUsNAa+JDdDBKU/eoE+cZQN3la/5D3vpsh
	13GiQT18F9kc0rZxO0gMiM8HXKla/bdw1+opxPpnM7VIeQqw2bhSB3m40W0Wm9wQFXMMGlZbvi2
	9gYN9V7Mr/m1X3MUKa4sTpNfktuO9fTr8+g//Y8lmQEoa8Dbn5Wlkg==
X-Google-Smtp-Source: AGHT+IEZcgppkNBTlaizwwc4FYq/J14CDpYZs0nwI6owCKhBz9YbC7ZKBSliBnzxRVK84ZW179DbHQ==
X-Received: by 2002:a5d:64c8:0:b0:385:ec8d:8ca9 with SMTP id ffacd0b85a97d-38a223f5c0dmr43786869f8f.42.1736158363631;
        Mon, 06 Jan 2025 02:12:43 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm46899397f8f.92.2025.01.06.02.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:12:43 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>,
	Romain Naour <romain.naour@smile.fr>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [scarthgap PATCH 4/7] external-arm-toolchain: in libc.so GNU ld script use base_libdir
Date: Mon,  6 Jan 2025 11:12:35 +0100
Message-ID: <20250106101238.982418-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106101238.982418-1-romain.naour@smile.fr>
References: <20250106101238.982418-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 10:12:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6307

From: Vasyl Vavrychuk <vvavrychuk@gmail.com>

`base_libdir` gets replaced with `/lib` or `/usr/lib` depending on
`usrmerge` distro feature.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Acked-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit 4b2cef379f94026d275e8455d1da17c29c8f9042)
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../external-arm-toolchain/external-arm-toolchain.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 78443526..cfadf248 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -224,9 +224,9 @@ do_install() {
 	rm -rf ${D}${includedir}/rpcsvc/rquota.*
 
 	if [ -f ${D}${libdir}/libc.so ];then
-		sed -i -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
+		sed -i -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${base_libdir}/ld-linux#g" ${D}${libdir}/libc.so
 		sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${libdir}/libc.so
-		sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
+		sed -i -e "s# /lib# ../../${base_libdir}#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
 	fi
 
 	if [ -f ${D}${base_libdir}/libc.so ];then
-- 
2.47.1


