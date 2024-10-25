Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F0AD149D0
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:50:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.325.1729875012452768047
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 09:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2KLjUudk;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d41894a32so1740876f8f.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729875011; x=1730479811; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPhqwY0dLwxK7rWHXj51wrm9cpqT2jrOnwObtREonVg=;
        b=2KLjUudkqzN+gfNLnpVzR4e04kej+s+6Ly7wmnsTQ/InoHgQIxP854vG15Vj17iclQ
         Ylp8h4Xm0xW5ZjGOLGwqjHxNCqr/I0PUAfDTHJ+ujruakVCeG+kgc/PNgEtL7ppEVqeK
         uQIbnl5Ah9M037eqtyYKnzZNtnrTgLdQIDRlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875011; x=1730479811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPhqwY0dLwxK7rWHXj51wrm9cpqT2jrOnwObtREonVg=;
        b=ACfFL4dkaNl4LPn3OphS+L9ZbuJpfuliToibL6NlfI5CZD/RgXuT9x3cicl+aY+O3x
         mpU3kbnpaMcss9dtqQl2gZnyk/vi3QmWtQ7Tuz7bOwwxuswa1NMir7nTTy7da/OPzGQb
         Yvp05WJZRd0qTyYJsh1g/Qkcg9lA2nAROorz/AmSZESl2OioMCKfQImIrSehtg13aWx8
         2klpJx196Bo91w/0CUQhXMlQtSk8n+eUgaQbYGlxsIVHG3Iakb4UCaf1K5gVBUH80SeA
         OQLF37fRr+kJfF77/SBq8ryvsVukb6hX5MvPwj3Yjj9IfKeS3C3EAjPBqBVhK1hc0snR
         CJkQ==
X-Gm-Message-State: AOJu0YzV1nqJc758U4fE/GYr1D1KeDRxvuQDtj82PahslF5jsinxLcl8
	OY3hE1ffIRUpLBUG/c/rrwaDcDbhk1ChTWVQ3PTeEPV0AVwAtTmQ90wOvwWEAG2bnwypgnWWGs/
	F
X-Google-Smtp-Source: AGHT+IExLXInzK8F93YB9fzDzrCUphPUVo+TVvYBX43Z4Hfd84WnH5T8WZ65Khn+KSzvleIyuPL31A==
X-Received: by 2002:a5d:524d:0:b0:37d:47eb:b586 with SMTP id ffacd0b85a97d-3803abc5246mr5067968f8f.4.1729875010795;
        Fri, 25 Oct 2024 09:50:10 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm1991778f8f.67.2024.10.25.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:50:10 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	Romain Naour <romain.naour@smile.fr>
Subject: [PATCH v2 8/8] CI: test external-arm-toolchain with usrmerge enabled
Date: Fri, 25 Oct 2024 18:50:02 +0200
Message-ID: <20241025165002.2794821-8-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241025165002.2794821-1-romain.naour@smile.fr>
References: <20241025165002.2794821-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 16:50:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6234

We want to test meta-arm-toolchain layer with usrmerge enabled [1]
since it produce some breakage with current external ARM toolchains [2].

Instead of using a custom setting (poky + usrmerge enabled), use the
existing poky-altcfg provided by Yocto. poky-altcfg uses systemd as
init system and imply usermerge being enabled (new systemd v255
requirement) [3].

Note: It must be a 32bit machine, since there are currently no aarch64
host toolchains for aarch64 (some gitlab runner used by meta-arm are
aarch64 host) [4].

[1] https://docs.yoctoproject.org/scarthgap/ref-manual/features.html?highlight=usrmerge#distro-features
[2] https://lists.yoctoproject.org/g/meta-arm/message/5557
[3] https://git.openembedded.org/openembedded-core/commit/?id=802e853eeddf16d73db1900546cc5f045d1fb7ed
[4] 4bfa191ada5c44baaa1f4b8aabbeb314961c0134

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .gitlab-ci.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 550dfff5..454e6ae8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -295,7 +295,8 @@ qemuarm-secureboot:
         TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
         TESTING: testimage
-      - TOOLCHAINS: external-gccarm
+      - DISTRO: [poky, poky-altcfg]
+        TOOLCHAINS: external-gccarm
         TESTING: testimage
       - KERNEL: linux-yocto-dev
         TESTING: testimage
-- 
2.45.0


