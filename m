Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B09C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:08:10 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.3609.1645765689896816276
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vY2QPwyd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id z15so1532764qtx.13
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rr9oBdYtR70FC31dFsvIR0gHwBJSclYTHy2UGwg6dQw=;
        b=vY2QPwyddgScKY64Ed8lyzw1pXfQMTZL2o5ZATwEkslpiQNuBRxY54sCEnVHKCpXwe
         izTPh/H8GzVMKkeV+ccDxIpHSPkxzpP7MUXujaHnkD1OWl7SHeKrx3asg31e6G8xmNDr
         tz7KHlGB6ybI9ug2jJ5iU00rECtBspVXm120KR7QZs65i9PHIx8eFMo+vZjaACfDeYbO
         5dO2YDyyG8H7/pnYxi5hSUq4DfdZhY0NF+ms/YYtgBKBbg1nlZgeYWbFaBIT2wAbD2U0
         WPxaMsd7kTE2p34g040RYcKNMDci04Z/3GRiRBB+NdZqU8gItS/CueN119NPBdma1+pC
         2lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rr9oBdYtR70FC31dFsvIR0gHwBJSclYTHy2UGwg6dQw=;
        b=CbucbOpmKpy6JhKTFfw5xjJ+h84va+mE30WSqOBHw22Rr7dKkiarQl3/vlL1O0nRSm
         qJnJ3gQw5YaHAZWmstn0jBnj6IdWcz2ERkdsQ/Z67BU6R6DJqC0mFeL5JBc6gIukMfv9
         iCS7xVwEL2SVk6KBZHNe7cgkGMj+CZI+jyvN8Ae6Ap5/HCXEyg39cRdTymjTPHgrXxrm
         +lQC5VifBi4IZBEp77H8ZXdb4taF7H+DlR8nLFnxtDo5DyC7mrckdRDpEIAal4dukMpS
         7Qps/8T6TH8UHhsHBRh2PMoZB8+VPo5LFGNPAetloz4lzFOz5scQfEgPpWT4jKfporQg
         73tQ==
X-Gm-Message-State: AOAM531Ql2cNUV+r8OD1dSrYapjwQVIKe3oCRZM3A7slcHvLje1ImZZ+
	2FpIBBQJ3GOPKNbpmA/JHOEGPFaXQ+JIiA==
X-Google-Smtp-Source: 
 ABdhPJyvv19IGSZHbUrfr+SAUBBMb9ytxbh1QRs7UpUUAfeiroPAx1nnj9wJ/c4HBuxUusp/0JqkXQ==
X-Received: by 2002:a05:622a:1394:b0:2de:6af2:406e with SMTP id
 o20-20020a05622a139400b002de6af2406emr5531312qtk.527.1645765688922;
        Thu, 24 Feb 2022 21:08:08 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:97ee:8b84:aa35:fed0])
        by smtp.gmail.com with ESMTPSA id
 h24-20020a05620a10b800b00475cbe16a36sm747647qkk.133.2022.02.24.21.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:08:08 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 8/8] CI: temporarily pin meta-oe to pre-python-wheel removal
 until oe-core catches up
Date: Fri, 25 Feb 2022 00:08:03 -0500
Message-Id: <20220225050803.2517279-8-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225050803.2517279-1-jon.mason@arm.com>
References: <20220225050803.2517279-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 05:08:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3065

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/meta-openembedded.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index bed338dae05c..91343f0f5af2 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -4,6 +4,7 @@ header:
 repos:
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
+    refspec: 44a810f34e20c7985b0bcbdf71943799b278ecc7
     layers:
       meta-filesystems:
       meta-networking:
-- 
2.30.2


