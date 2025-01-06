Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AAFE7719C
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 10:12:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.56357.1736158365874043829
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jan 2025 02:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ExtJ6Eo6;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso88086505e9.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 02:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736158364; x=1736763164; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKUL3BFXcZpJR7ko1ERAnF2ItvYKsBlb+ApF6FB5I0w=;
        b=ExtJ6Eo62iWA9YoBmaCGi294LgpN0zx+rl2uE1C459LU/OWcyfNp+Kzp/wmzJQ1D7U
         Maudk08tOAVglqCu2yBxnYIaRSUw5NfZNP4SbR0+QxQE2iIUMKUdCSKor8JA7uFiYIxY
         R1sAKDTbB8spK7Z5o8+8tjNhwFDyLdpMtG5ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158364; x=1736763164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKUL3BFXcZpJR7ko1ERAnF2ItvYKsBlb+ApF6FB5I0w=;
        b=O1abDisxE0T/a0joEyWaNTXZY5gyW+3+APn18BIDGp/1/rZAGR7YM840GPlUbm86km
         fWzsQ4O8C2WkTtnqNvbq/melYBnZgu/tsti5lyRRVPImNHpviCeKsnQKZdnVkGTctyyW
         9+sp225MjCCqTwXGCsmdr8KLkifXA6VeHAcBL5MRhCiZ2bq1kDb1npFoRGjtO071wW4n
         9QaliCDHdFvlxxXaH137VuEtue5n1s9gRQZd0zOUfoTNBjjL9ksvXQRPqW79sHX28Mgn
         GROqV6lKWP7XUGsQzcgW4gA3JYbz0gZwb7IsjYQPTcNoCSnhpq44XXjlF76UXgPXsWJB
         AbNA==
X-Gm-Message-State: AOJu0Yy93K2sNFr2nyJ6fUlJqE91tVLAYxm5RXtkJAJe+4sZQtxplTGo
	LVNAbbF5Mtq9Yj2l3SYlG9yBA2k6f7Cm+xEC4AhfXOvEpzrfCkTC6Fz5qLjT/iGo0gZrsL9ozUi
	d
X-Gm-Gg: ASbGnct21PK0KJ6SDvGD1CVbIxHSregLuRbntZpdeKNxzHFkNkWxJO5x81qo0SV41kk
	gGas0sC3xFYmK9fTFwrFoHKlwBW2QKbV5e8+z4XJUygLUss2DBHJ7hWA1Rt4mCeC+RFMd8UoKi6
	5sEf7SSxYnaVkQjeC9dtBB+wlY7vFhecqWdotAa8vpivQVJHrGQb1U2osMa+b4EG36TXFn78eKA
	DG7bz21WcS7TglOKFOYPvDjQ88Zdr34OOsV6rVThBUKejlPmI397NuI4AQxpf8bsvHggdAsM+Ll
	1gYOlNgM/XPlQ1ZhCmmxotmUzXguA7L8JIb5fhdPnxrzcfEd4kRODA==
X-Google-Smtp-Source: AGHT+IEBx4yO5SrKmMImZCdfN6UmoidkHTLDrMsHCCljx2OY9J4pnN/9rNOqg60q2wE3PlQ1I4eMNQ==
X-Received: by 2002:a5d:6d8e:0:b0:386:3958:2ec5 with SMTP id ffacd0b85a97d-38a1a2749f8mr52610229f8f.28.1736158364249;
        Mon, 06 Jan 2025 02:12:44 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm46899397f8f.92.2025.01.06.02.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:12:43 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Romain Naour <romain.naour@smile.fr>,
	Jon Mason <jon.mason@arm.com>
Subject: [scarthgap PATCH 5/7] external-arm-toolchain: remove ${base_libdir}/libpthread*.so from FILES:${PN}
Date: Mon,  6 Jan 2025 11:12:36 +0100
Message-ID: <20250106101238.982418-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106101238.982418-1-romain.naour@smile.fr>
References: <20250106101238.982418-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 10:12:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6308

From: Vasyl Vavrychuk <vvavrychuk@gmail.com>

When `usrmerge` distro feature is not enabled, then `${base_libdir}`
resolves to `/lib` and `/lib/libpthread*.so` does not match any files.
But, with `usrmerge` distro feature, `${base_libdir}` is `/usr/lib`, so
removed line leads to `/usr/lib/libpthread.so` symlink included in
`${PN}` which causes QA check failure.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Acked-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit 8634bdc2f21e1b2801435ecc7b6f7aacde8a7a00)
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../external-arm-toolchain/external-arm-toolchain.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index cfadf248..4776b7f8 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -546,7 +546,6 @@ FILES:${PN} += "\
 	${base_libdir}/ld*.so.* \
 	${base_libdir}/ld-*.so \
 	${base_libdir}/libpthread*.so.* \
-	${base_libdir}/libpthread*.so \
 	${base_libdir}/libpthread-*.so \
 	${base_libdir}/libresolv*.so.* \
 	${base_libdir}/libresolv-*.so \
-- 
2.47.1


