Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CB7C5321D
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:58 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.4040.1724291033154939382
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SuX7vzUc;
 spf=pass (domain: linaro.org, ip: 209.85.128.172, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6b8d96aa4c3so3204737b3.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291032; x=1724895832; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5+tBxeFbiWkfJkiZMiVStk0WUgY+OMHmCiMHBeRQPM=;
        b=SuX7vzUcx7padaCNgq+b2qFSHbS0lhsNDxHTcOo43n8xDSlue7mpt21i4G7ppc/p+x
         2/Z0/GivD+MMg75xhBTrpZSoC7PPKZ3YiOKa3h8aMOUv5l1mpPsixEO54p4APzIILSUi
         fb0Gn1AIIt8cRM+nWzQejW+TC9/kMwTtZ/nxBKeZjBr8W2chpKLQm9dt6oopE40+C2Sy
         O2fE/TZzaPJ/rBnFdLIdUSeuWe3L9XIdT2GCtxBg187eV2FCbK6Z/jdBHmCC0S+VWX+0
         ewE4kTjnUiadoR3AEfmyuZqeTbuq2ZmNrIFYE1KvQO4rE1kbBMHYaGc8Qo1y0rTkQ0Qu
         Ixog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291032; x=1724895832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5+tBxeFbiWkfJkiZMiVStk0WUgY+OMHmCiMHBeRQPM=;
        b=rP57ZmINazbEvsTQzZwG6ZhhzKpXQBMOXvHjayPhEubEJAZ6LvrZ2xGT3za1Z3i0Gm
         fbzH6B2XsMSo/sHhvqUtzZI0VCFpMxaUUCz9UgWREdaq0aifwn1/HMIOoMHoXfhRPKG+
         JJAu+g2EXaCbWKB3PufRDqJxTqIpWCMk/yhb4e1LoWJbIfbWKgdi8r9bdBBOLZztTW5S
         gRyy1sjyO6n6zcrhaBWumItkryDlwsIv97/cJOpBKoOTe53hqPDu0BnBbQzxtcgp743y
         GWbJfdzBx/i8Vy2CZQ6brdnumQqI7K6QzNaAKZYuJFKXcVM4GisIT09LH4wdjaVybjjb
         kF+Q==
X-Gm-Message-State: AOJu0Yw3SGH91AiGGpbQ75Kg3CML6voRwpbe39FE6WFbMp7OnlzIH81m
	09H9ZMgfdh9Hv8z60nx03j33bwt7eh3pC8ww0Do1LuLi9sfxzhpiyLfOL6EBIGqb39fUia+yCXL
	9
X-Google-Smtp-Source: AGHT+IE9ug0jzwpgVZEpwL1cKdT0A8eNpLtgEOkEZssLvu5gDm1s2yp1BJeMItNB2/9Aiq46UzbafQ==
X-Received: by 2002:a05:690c:e1f:b0:6ad:91df:8fad with SMTP id 00721157ae682-6c09e65fa77mr56226337b3.26.1724291032110;
        Wed, 21 Aug 2024 18:43:52 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:51 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 09/13] qemuarm64-secureboot: Add meta-secure-core layer as dependency
Date: Wed, 21 Aug 2024 19:43:31 -0600
Message-ID: <20240822014335.3394568-10-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5999

meta-secure-core is required because of sbsigntool.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index b26941e0..958a1ff1 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -4,13 +4,15 @@ header:
   version: 14
   includes:
     - ci/base.yml
-
-machine: qemuarm64-secureboot
-
-target:
-  - core-image-base
+    - ci/meta-openembedded.yml
+    - ci/meta-secure-core.yml
 
 local_conf_header:
   optee: |
     IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
     TEST_SUITES:append = " optee ftpm"
+
+machine: qemuarm64-secureboot
+
+target:
+  - core-image-base
-- 
2.46.0


