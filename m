Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D861AD15DA2
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 14:38:58 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.47506.1729521529740518646
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 07:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=P/9TU43F;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so50996075e9.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Oct 2024 07:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729521528; x=1730126328; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u/vI/vkuPE3OGiOcUwtcvjK1rcH2TQdaF9W4AEia/Yc=;
        b=P/9TU43FyWuNj74IcKRAiATLZal+FxCUO9/xh0SDVSACYkuuateBpGYvDijFViRAA/
         882kWa9zJ6v6x36bLC2zVYA5sjJyrsiovug5oVCeEg7tRrl6TiDDQinYgbYPmm8Hc5vT
         CHazZmXLWjkKixTOXzztiULiKxIfHh6C5QT2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521528; x=1730126328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/vI/vkuPE3OGiOcUwtcvjK1rcH2TQdaF9W4AEia/Yc=;
        b=n8ceYUK5zO4XxkGcYFHtwuPnHiJKn9e5aQT6RtTGNtZIMQRfVNSH4x4pnS4A7vzRbX
         5UVlJQTeuiq/9/0hzB79rIQ2WMFfdrxZzuOPW5eIC08hrCL7SEsX3Cca/HDoRGqZs8s0
         B9ezvUNDQ6Trg3FwXk8z0dJDF3SSjVCpv87frId66q4NeOz0RBdNXNraMUNjFZ9HH92Y
         f1YQqi6g58EMgSJOBpoTHJI0Cvvhj6HhjdcAGUaNXoKOT1M3HhuDuDjQ+th2oyzCYyJk
         I23R16cyNfPWgNt9Mn0+gdxCLvT2r3pB9nSy8IK7ojz2kMFSfT5oE5pM/0rFIv6c2bdw
         sQmg==
X-Gm-Message-State: AOJu0Yynz30SrrwtH4xfRECpJJXrHMYzstIJnLxxqmxRBGYkjB3BvrfV
	k9kj31io6WN51LfjLjLIQfGpBc1omkzSz8I9ZaZ7wLqFZ+EDSQg9EdwPxZ7JgYuXb2nuEeVB/Ot
	D
X-Google-Smtp-Source: AGHT+IHJVQHalIoaLGPUbdoNP+iiXcCzgsm8FL63ZSgHL31JyPpi0cOavif3eYmohSHqjjEkIwmRQg==
X-Received: by 2002:a5d:4581:0:b0:37d:492c:4f54 with SMTP id ffacd0b85a97d-37ea21de09fmr6838495f8f.3.1729521527927;
        Mon, 21 Oct 2024 07:38:47 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc4c7sm58935205e9.48.2024.10.21.07.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:38:47 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	Romain Naour <romain.naour@smile.fr>
Subject: [PATCH] CI: test external-arm-toolchain with usrmerge enabled
Date: Mon, 21 Oct 2024 16:38:41 +0200
Message-ID: <20241021143841.110336-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Oct 2024 14:38:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6215

We want to test meta-arm-toolchain layer with usrmerge enabled [1]
since it produce some breakage with current external ARM toolchains [2].

Instead of using a custom setting (poky + usrmerge enabled), use the
existing poky-altcfg provided by Yocto. poky-altcfg uses systemd as
init system and imply usermerge being enabled since Yocto scarthgap
(new systemd v255 requirement) [3].

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
index f211ea97..0e9ad688 100644
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


