Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E164E95A7E
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:30:43 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web10.28007.1696717833224013871
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 07 Oct 2023 15:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Z7hRuSi/;
 spf=pass (domain: linaro.org, ip: 209.85.222.49, mailfrom: javier.tia@linaro.org)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7b0a16f0338so1403003241.0
        for <meta-arm@lists.yoctoproject.org>; Sat, 07 Oct 2023 15:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696717832; x=1697322632; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9m2MPydM57cV1+MnkOpUM2Gdid93YACg1e85QTvr1w=;
        b=Z7hRuSi/Var+OJRE6kK5KJksR2qU0jNmGYuZYyEB+JNZeRPj0SHpaPt8Tb0K/026D4
         xNfkZ2WKV6w17tNoPDfTf0FHr1uzKcQr8OfYSAG4Gkzyyvi+Mi0Jub7VEGmizh18AWbV
         tWXQ+KXFMujd0CNCslYP1oOnxztEJhyFM+2DP4d0euNiBbKI67mgPvzs3tO+t7LieB6n
         fCLtoEgUaDFmhDX4IMnqB4SVxPGt/ARw+PDpSyP3Lt2iFyahtxFmREqelsc+s75cTfQ8
         rd6BPDPlhVYGYAzI6FUcD+xRAEmk+xoZDhyTWlYmfn36OPJYN37PWvW+u8XikLbpsqcC
         ts6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717832; x=1697322632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9m2MPydM57cV1+MnkOpUM2Gdid93YACg1e85QTvr1w=;
        b=IJdO1FI9ChdQY+cqgq4jdxHmWYO+fcxd/9E6C5Qwl8wW1IESAgaD+U7Nq0K/a4bm89
         3AXgYPS/yCKlMTOQ3lkiE0UnkDKij7SLBy/GLhPWY07jKUZ0FRV3gezGa5D7LKrOrjuQ
         +s/AbgE2464/QHJx11o9KJ/B/cl4AOWKMWvm8OHmldGywnaMFjeKNH8SIAXco2DzLSVV
         o2hkXmffbmhbapDkGazan2NskzHI9KpFwhv8kNsIid6VAgRJSitWdJ3k+qv5uI4l7kix
         mCMaWs8kAn98YvPMg5fBgzOzYmS4VCnOXHfE6Po/4HhcSdSH31CThWfJoHW4A4/Kwadt
         rFGg==
X-Gm-Message-State: AOJu0Yzb4EUwNUIyE8FJ+eeNVOCpGxWH608uTgOVRCJ8aySPy/ieG1hM
	/tGdDjL0TmQBvYHi11vAUbB8Pv706E6jYVqwSmA=
X-Google-Smtp-Source: AGHT+IGmB0z4DsUvLbm9XU3rTp39zN9PVWJS2sDuFL8jyXwvELHp+rqevHu6rXwfUe8KX+SaKwWP4A==
X-Received: by 2002:a05:6102:3f12:b0:457:6b58:b44f with SMTP id k18-20020a0561023f1200b004576b58b44fmr1327471vsv.14.1696717831842;
        Sat, 07 Oct 2023 15:30:31 -0700 (PDT)
Received: from jetm-rog-x670e-gene.. ([177.93.3.194])
        by smtp.gmail.com with ESMTPSA id a20-20020a056122013400b0049ab260f526sm1151150vko.43.2023.10.07.15.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:30:31 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH] trusted-firmware-a: fix build error when using ccache
Date: Sat,  7 Oct 2023 16:30:19 -0600
Message-ID: <20231007223019.2557075-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 07 Oct 2023 22:30:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5104

When ccache is enabled trusted-firmware-a recipe fails with this
error message:

    make: *** No rule to make target 'aarch64-poky-linux-gcc'. Stop.

ccache prefix CC variable with 'ccache' word before compiler. Because
there are no quotes assigned to CC, only 'ccache' is assigned. The
compiler becomes a make target, producing the build error.

Add single quotes to LD is a good measure to prevent this kind of error.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 4d3b0bad..2bdf2211 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -103,9 +103,9 @@ def remove_options_tail (in_string):
     from itertools import takewhile
     return ' '.join(takewhile(lambda x: not x.startswith('-'), in_string.split(' ')))
 
-EXTRA_OEMAKE += "LD=${@remove_options_tail(d.getVar('LD'))}"
+EXTRA_OEMAKE += "LD='${@remove_options_tail(d.getVar('LD'))}'"
 
-EXTRA_OEMAKE += "CC=${@remove_options_tail(d.getVar('CC'))}"
+EXTRA_OEMAKE += "CC='${@remove_options_tail(d.getVar('CC'))}'"
 
 # Verbose builds, no -Werror
 EXTRA_OEMAKE += "V=1 E=0"
-- 
2.42.0


