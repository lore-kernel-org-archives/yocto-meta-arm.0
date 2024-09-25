Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D29CF9C77
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 14:37:48 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.17780.1727275062496480383
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 07:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lrDtbNye;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f75d044201so10571941fa.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727275061; x=1727879861; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mGZxP3kgNoYsmADEL7lMmI6aX7eHeClLHrE/Nlw/n8=;
        b=lrDtbNyenb8J1dEnNroqEpTXpsVREMorFsgIJrJQu1sKZDjT6s/5xzGjCIWMGGlaMj
         AzURAILSKRMZQrdOBlIlf6lXkasK81hqDNAEV0bRpw72MQ1CG6WgldUbcWytvMepSxNW
         YT8m1IA5O29wk6Podt1d1jBHPbWnV/lP0GxEHMAD9rWpa/QIkZby+H3yYUnLGTvWALfV
         0GVOc69Zyd4L1aW0pETEMkrcyMHqN6FTyeSFtVqNOn8aFls9dzHIAliaBIRHEl+BAhAi
         Phxdqx/N7faLk/c8O3YgV5PTTMK4rYi4VoWJBKcGpRqwlgmh23XJ/25BKC5FXEUCi78U
         pb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727275061; x=1727879861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mGZxP3kgNoYsmADEL7lMmI6aX7eHeClLHrE/Nlw/n8=;
        b=K6es5gieBg4NCdwsTjlt72AReYoc2IsHrU+nKq+MX3tPiAKBkFBZq8zXc+HvHtPMTO
         nFMOkggrnMsUEGsXkKU9TqB9i80OrUqW35L9I+fnJqt0QvTyL8yP/DC+zvAmZ/Ys+p1A
         8E27lHq1FuFJOWMJjg69dHv8khTp4Fal6EQ0ArY11hQQCoQRjiQtjARZEfNAjn3W1OB3
         P6yQUsIHKiK9XBjcTkf8SQBu118tR2tbS91tdOiIPeSHQexaeX3Zwucz48skvA6HQ4B4
         dc838bkbYvaqSAgzO0JDFS3uP202uvo5mpzFTVtA/q59j+DVzcOhsD0Zzpm6Ax8rGSez
         V+xA==
X-Gm-Message-State: AOJu0YyJukRccx3hSqbxYLVi9NyLAC2HkqH9um1m8m+fO+tAfZvk9m3E
	Op9EAzwfuSxkYOPRL4jjJ6vKwkWkeXHtgZi7HOjIUjBvz1rhRw9FvemHRNyG5CGaoZe6iNvITb/
	Kk7g=
X-Google-Smtp-Source: AGHT+IHpT8+qcbyQVCLJ7wga14cQsNYaTcH2SDNlGw2gI+WJPhKIRcdL+2Qa/g/S+DYpeo872q8+Dg==
X-Received: by 2002:a2e:a985:0:b0:2ef:2d83:c136 with SMTP id 38308e7fff4ca-2f94d730b48mr12870611fa.1.1727275060520;
        Wed, 25 Sep 2024 07:37:40 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289b54bsm5137861fa.109.2024.09.25.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 07:37:38 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] Revert "arm/optee: disable clang due to breakage"
Date: Wed, 25 Sep 2024 17:37:21 +0300
Message-ID: <20240925143721.106211-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 14:37:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6113

This reverts commit 67901eb5cbb774f5eac69374ee75b6dddac893c6.
With optee 4.3 all clang related issues are resolved upstream.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-security/optee/optee.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index 37676f14..c5514f56 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -14,9 +14,6 @@ OPTEE_ARCH:arm = "arm32"
 OPTEE_ARCH:aarch64 = "arm64"
 OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
 
-# FIXME - breaks with Clang 18.  See https://github.com/OP-TEE/optee_os/issues/6754
-TOOLCHAIN = "gcc"
-
 OPTEE_TOOLCHAIN = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 OPTEE_COMPILER = "${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-layer", "${OPTEE_TOOLCHAIN}", "gcc", d)}"
 
-- 
2.34.1


