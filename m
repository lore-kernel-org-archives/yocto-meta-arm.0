Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEF0D149CF
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:50:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.379.1729875010921652828
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 09:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cJWySawL;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43155afca99so22808465e9.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729875009; x=1730479809; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXfIoX+XCW8D9Gs79OojrALjWeoolgWnO/E22qDRYDQ=;
        b=cJWySawLeGke+9AVx46j41dt+/8id7Uxt8k2AelYVjLLfM37i8fPfS/kC9OSpi7+S+
         EXStUmw4//9xmKHtsGxB9ZWsHDPAj0ZxIwfVXMhcvCOfPEYyG211/trs3c5zsXkQdXdG
         2tVLKBdy/xx6mAT9/CRewhLdfHZgwivYE+66Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875009; x=1730479809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXfIoX+XCW8D9Gs79OojrALjWeoolgWnO/E22qDRYDQ=;
        b=vqlPi2rptbSV9Fg6TDECjZb4CA8OO+aNvHqEot6zWYss27w0AA0oxqHwW4rjsO9V2c
         uUBEbf+3h97gCPco509UVuwbz/MOzCLH4QReofot6hcecwI9iPK3ymrrFjvKGerGa9wr
         nrJzmhXI3CcIrmg63XagF57ScL3eP3G415tAEr7DMYaTpMC88Ji7I15wVEV9ayelKMkf
         H9rUZhk9t8lloohVC9TH0c3V7f50xtcrCIgOkUjot6JlVCq143t+f+e401AiKXHC6X4K
         nhnaNH5U/8neV3Uxd3u867mBmNMqA/Y7HRFFE6jqL9LbseYPX2Djp4xv5PC2yvYzCMxQ
         Sfjg==
X-Gm-Message-State: AOJu0Yw8y47L9dUjbrRE2tzmEI6XdnPJ1V0T8rWOvHabQfhuVlXvJITt
	z1hqtS0E1Rq/FKTr+CNgtgNaLNtB14ab5Lil7w6jw0yYV8UIy48e7+l6poSSwGJw6NpxRqXg4Oi
	3
X-Google-Smtp-Source: AGHT+IFmlQIoTGQOvMmAEfd9+pGgAXiKmgG6qaEyVXj5yeNeB9du1lbqupvORvqsSGXPf+pmNg1LRg==
X-Received: by 2002:a5d:6c6a:0:b0:37d:5251:e5ad with SMTP id ffacd0b85a97d-3803abc525cmr5661078f8f.2.1729875009152;
        Fri, 25 Oct 2024 09:50:09 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm1991778f8f.67.2024.10.25.09.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:50:08 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	Vasyl Vavrychuk <vvavrychuk@gmail.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Romain Naour <romain.naour@smile.fr>
Subject: [PATCH v2 5/8] external-arm-toolchain: remove ${base_libdir}/libpthread*.so from FILES:${PN}
Date: Fri, 25 Oct 2024 18:49:59 +0200
Message-ID: <20241025165002.2794821-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241025165002.2794821-1-romain.naour@smile.fr>
References: <20241025165002.2794821-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 16:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6231

From: Vasyl Vavrychuk <vvavrychuk@gmail.com>

When `usrmerge` distro feature is not enabled, then `${base_libdir}`
resolves to `/lib` and `/lib/libpthread*.so` does not match any files.
But, with `usrmerge` distro feature, `${base_libdir}` is `/usr/lib`, so
removed line leads to `/usr/lib/libpthread.so` symlink included in
`${PN}` which causes QA check failure.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Acked-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../external-arm-toolchain/external-arm-toolchain.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index d73d1727..fee0da89 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -554,7 +554,6 @@ FILES:${PN} += "\
 	${base_libdir}/ld*.so.* \
 	${base_libdir}/ld-*.so \
 	${base_libdir}/libpthread*.so.* \
-	${base_libdir}/libpthread*.so \
 	${base_libdir}/libpthread-*.so \
 	${base_libdir}/libresolv*.so.* \
 	${base_libdir}/libresolv-*.so \
-- 
2.45.0


