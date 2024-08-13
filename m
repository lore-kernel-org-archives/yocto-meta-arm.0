Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CC2C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 14:12:53 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.73058.1723558367942740223
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Aug 2024 07:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Zr68O8f3;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso60185481fa.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 Aug 2024 07:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723558366; x=1724163166; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rp2dPj9C9dLJRRrDJlCiaheF60JELYr7YCgrtgAks64=;
        b=Zr68O8f3KZbJjOA3wpMrZbIBuUOLSIduefDQIQYQO9trxUWLCaatK/hWSeqhHeUOR+
         xMeHzmB/E9iGeB4iUwOrg8vMucm+jTt+XnhpAJ8qaOzhqx4nPpiq2AL3yLTnHTjpHHJq
         FMiI1cBXNRHH0G/z1Svcuios5OiuPtwfKPtR4XAiL6/vQ7wUeOC4yK5msQaUuXABQ+e/
         InUJI9R1MjFwZcIvcVngoJfNmL/xbIfQ281ISfD4DymueFpohRSPzq6Bx/Hf1/d6xuMD
         Ytu07zs2RO0hUlx9QWmh/ABGrLiZQ+Sfyrb85vtKcTzKaZavw0UnE4GkDshbbGsZEwoL
         1uAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723558366; x=1724163166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rp2dPj9C9dLJRRrDJlCiaheF60JELYr7YCgrtgAks64=;
        b=WpwbMZKTvxYR0v/LmEq1Vpb4cbhIGMJ32ZEVLHzX9lz1A8ZAABXGsUMYiqMttHXPUJ
         c1MOtazVGV+eRRAhyuTROzC0gBD1yo0LK9c0tu/HM0fbMkF6uTDJa/p+dUYOIpfiJT/5
         fpIxBc6jDCjl8b9WBoG5p1rmq3dG78fh7y6e2dAuetDyVDopF3MRz3QU9sDouEPOW/NB
         RHPOji9MDzVueoyGdzUck8fEcdPRTNtMF0EJsTU8WDsB2BJjW6jC+K23R8uSIKbNympW
         OmSAbPOIlTbGiliAmFyPQhu9XztKw+4nnR1znpl2WYvMBjRU5TH0XcWqf2gUHYIuBp6f
         2gww==
X-Gm-Message-State: AOJu0YxQHpctsgCMc0hoPIoHJ78yHeIhG/WeBWUjTv9OoGwbvc17hv3N
	MAgkB8Y8RQ4PVbDLE0Q0qFRMPgoJf2i/e1TrMvLUilnRslpAbXdvn0Z0k+A7vR4c17D/EolsJtX
	b
X-Google-Smtp-Source: AGHT+IEPTSptadKrmVX3749+8vb81mrNPl2urgQfC+2sVaRZPHiaHqlw5FOgB5VSsOqXP3chKOyLzg==
X-Received: by 2002:a2e:a98e:0:b0:2f2:bbcf:1b83 with SMTP id 38308e7fff4ca-2f2bbcf1bcfmr15861411fa.45.1723558365779;
        Tue, 13 Aug 2024 07:12:45 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f291df3c37sm11735741fa.38.2024.08.13.07.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 07:12:44 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] ts-newlib: setup git with check_git_config
Date: Tue, 13 Aug 2024 17:12:21 +0300
Message-ID: <20240813141221.68592-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Aug 2024 14:12:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5963

ts-newlib has a custom do_patch function which is not setting
up git like poky do_patch. Build without working git config
may fail:

| *** Please tell me who you are.
|
| Run
|
|   git config --global user.email "you@example.com"
|   git config --global user.name "Your Name"
|
| to set your account's default identity.
| Omit --global to set the identity only in this repository.
|
| fatal: unable to auto-detect email address (got 'tuxbake@81d82e1ac791.(none)')

Fix this by calling check_git_config from poky utils
to setup git correctly.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../recipes-security/trusted-services/ts-newlib_4.1.0.bb  | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
index 866276b3..1fda415a 100644
--- a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
@@ -25,7 +25,13 @@ export NEWLIB_CFLAGS_TARGET = "-Wno-implicit-function-declaration -Wno-int-conve
 
 # TS ships a patch that needs to be applied to newlib
 apply_ts_patch() {
-    ( cd ${WORKDIR}/git/newlib;    git stash; git branch -f bf_am; git am ${S}/external/newlib/*.patch; git reset bf_am )
+    set -ex
+    cd ${WORKDIR}/git/newlib
+    check_git_config
+    git stash
+    git branch -f bf_am
+    git am ${S}/external/newlib/*.patch
+    git reset bf_am
 }
 do_patch[postfuncs] += "apply_ts_patch"
 
-- 
2.34.1


