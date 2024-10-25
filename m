Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3F3D149CD
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:50:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.377.1729875010075865476
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 09:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WZxZHrlm;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d5aedd177so1382614f8f.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729875008; x=1730479808; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgmsGjgD9CTAZLlYLiUUHH8+Li7HRjWyMZ5RvamyZyY=;
        b=WZxZHrlmtLGdHA1KE9diNudFx9oLIIg6RAkkIlohHNeStKbDffWUUy4S6jA3UhEdou
         fHxTXqZxjWPXKy5YL6shMWssc96fuU0f6F5BpE6KWwe1IMlBYxm0bnuQzUcazhwdL+Mr
         B9BVNo2ktXf8RsMTWQOQn7MlM9x3+RFIkfhA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875008; x=1730479808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgmsGjgD9CTAZLlYLiUUHH8+Li7HRjWyMZ5RvamyZyY=;
        b=NkMEe2YAUvwHc4NSOijPTTkchKFGjPJrVRjvWvdDJ6Nv8+eXCQSyrYKTzHtJzwNlas
         Gnu0qIMB8FSmji/K5HnLoZCGdsUWmv5/pqpxo3n8tSevCCnkb42JnymEMwXhFYy/fWBL
         HOZluFh1gqHrq2Hp2x3ZX3dYeUAZo7rYN4vDtSBlhKJ99dOzRr8JoCgfO3POb9woFJS0
         xsNJrxYf2J0+uLwrxNqvqp1oMdcWoXwignVuSmmzaRtThLNX5tzbpjmUV/wIgEHiIoLv
         WNkBjp0rv2FHIx+MOgde7xd3l6FD394ayRc+mbEC+AkhXmnnHC0g+rCqGVaIB5s1jXae
         vFMg==
X-Gm-Message-State: AOJu0YwhGIZkrOV3/EevxfwbbcZI+UTlfRIYATD1eWOP8/Hty7K9cDto
	B/eUppGIbmzy1tW+gvhcoF66ZVbtuiDvRq7tWr3SJmhPwgwnZ0mP7aKG6I7HgnymhfpckVBimIO
	L
X-Google-Smtp-Source: AGHT+IE41iTgB5MMnkuNKCar2OPFfpZ5hlVBRK3bMevAwMlxossaju/9zLCHa32GeGwu4/ptBUVNKw==
X-Received: by 2002:adf:cb0c:0:b0:37d:4ebe:1650 with SMTP id ffacd0b85a97d-38061200b50mr35865f8f.46.1729875008464;
        Fri, 25 Oct 2024 09:50:08 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm1991778f8f.67.2024.10.25.09.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:50:08 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	Vasyl Vavrychuk <vvavrychuk@gmail.com>,
	Romain Naour <romain.naour@smile.fr>
Subject: [PATCH v2 4/8] external-arm-toolchain: in libc.so GNU ld script use base_libdir
Date: Fri, 25 Oct 2024 18:49:58 +0200
Message-ID: <20241025165002.2794821-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241025165002.2794821-1-romain.naour@smile.fr>
References: <20241025165002.2794821-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 16:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6230

From: Vasyl Vavrychuk <vvavrychuk@gmail.com>

`base_libdir` gets replaced with `/lib` or `/usr/lib` depending on
`usrmerge` distro feature.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../external-arm-toolchain/external-arm-toolchain.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index cc30f756..d73d1727 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -232,9 +232,9 @@ do_install() {
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
2.45.0


