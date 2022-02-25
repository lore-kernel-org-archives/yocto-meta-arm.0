Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1812C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:08:08 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.3521.1645765688381250047
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=w04viuC4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id g24so3700770qkl.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qqegDuohM8t+ilrccWRktY0gnTD1VCiCFraxhbQNgfo=;
        b=w04viuC4e4GB+HAaD9ZunjeXvkgbbFww42SxkkeGhRnr9JyhK2SD/OjI3oY4mSi6hK
         oEggtoCNgvOYsML1z4QQDynLwweIbK+0JsF3JNvnohknJpvsEMZkmC97CaczCKkQG60V
         P/MjaLU3qug1DcSfjr1v5N+0bPLM8xAvApKNnWdkigc9BwNqadhaLF/HM9uu73PNsmgo
         J4JBmJP9TAtgQRlyVYGuOhBqN8rMaHezQaPwZ07S5zB4Qtr4c77NsRFPxaeItVGQ9OGC
         wxsY0cZL8Y8AK1jJ0ucZUdSY4YTCZNZA0I5BFNFjqH9y3UU2oW3UC/CjQZysqikruQzo
         zStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qqegDuohM8t+ilrccWRktY0gnTD1VCiCFraxhbQNgfo=;
        b=F5vPyNTSCaBP0C5SAre5/Y3p1/dXlWzicO2w5JaJumVUhlQxDJTTg17bEPTyejdp0E
         qA1CcMX+7Hc/MF7VFc+d6AYg5/8PlHoTxQKapCnTbdW3vumB/8kCmBk0nLtcXmi5YBRg
         K1YCFWmCk4yDJ4HyD8SN0t1rniwaeTJP12JKstW8gw0cRMOMB1n8TcXskfoo59go8fY4
         WBXLpwanpl54f2IrtF0Hew4qsV69l3MyoUOthio+phFGpnADk+qVGvHEOa4OEM7kl8NU
         H2qKt1X/mnGqxN/EtrKVVZiksvDphgoSnUHkxOz/Igx1xeqU8IFyukg8lVH8fn8D6ZV0
         ACfg==
X-Gm-Message-State: AOAM533fkoHLZwueQhhJ0lWYBkJ9tZ0gLrlHqVAwmkcYTjyBcCMnYs45
	kcKMKXcHm7HSKzgNwKhEhPZ+4mnc9dovkQ==
X-Google-Smtp-Source: 
 ABdhPJyquQX4KtBVuaZo9HaQcDBinamQkkGbbFLALhIGwt2WOx1EZDjRvdkFgVnbiaz9elwTm1BGYA==
X-Received: by 2002:a05:620a:1e4:b0:648:acba:3a24 with SMTP id
 x4-20020a05620a01e400b00648acba3a24mr3843286qkn.431.1645765687451;
        Thu, 24 Feb 2022 21:08:07 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:97ee:8b84:aa35:fed0])
        by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002de8f564305sm997957qtp.1.2022.02.24.21.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:08:07 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 6/8] CI: use kas:latest, needed for the latest bitbake
Date: Fri, 25 Feb 2022 00:08:01 -0500
Message-Id: <20220225050803.2517279-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225050803.2517279-1-jon.mason@arm.com>
References: <20220225050803.2517279-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 05:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3063

From: Ross Burton <ross.burton@arm.com>

As BitBake has renamed BB_ENV_EXTRAWHITE to BB_ENV_PASSTHROUGH_ADDITIONS
the SSTATE_DIR and DL_DIR variables don't get passed from the
environment to bitake anymore.

This is fixed in Kas's git repo, so use :latest until a release is made.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bd495cf9cfc9..66d213f575ab 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ghcr.io/siemens/kas/kas:latest-release
+image: ghcr.io/siemens/kas/kas:latest
 
 stages:
   - prep
-- 
2.30.2


