Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F822C433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 19:40:04 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.2042.1642534803382044039
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 11:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=UlYra+dW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id c190so196114qkg.9
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 11:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xtu/42KIzt2dD3fbO2u1IxPIjENvrlPKSSVlBP75Tho=;
        b=UlYra+dWdswyhkcxhBQ4j63znkcjjkLh8nQhHAp62MlbxPLIMp6dm6+kVpIwgBledk
         t96/dR/UowbCxuzpnC5s+V9T4rd4RZl177weJ9EtCVfHh08u6BGPUjurL8Mv0jQq2V1c
         FcvSZmJK3LfFWLFfSfd6MAsT3Fx/Q9OxJvi8p2gVkcG0aj2HvzzKULc6R5P/4TzxGm3Y
         c2qa1+/dr3k2rRKme7Q+rGJg5gQegJDY8uqGPZhrspCmaEboeT8ll0FfMrXKEepBMptV
         WgBo+QFaHb9XqnEM6ZP9p28zAy4i3Aoq7V7PgumS1zBppg/8HGEdp64HDE9KwJ9Y0x7e
         z4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xtu/42KIzt2dD3fbO2u1IxPIjENvrlPKSSVlBP75Tho=;
        b=SmXuGdJSG9g/i8EVc8L8A5a5zcZK0OUricEnvapOS0G1bNiTdOy/PtReZ3oGkqQCU3
         V1xJs30IfuYJ/9Tf+wXQSLRd7fLQHibxj0+IagVpeKaof9r9z5oFNL20wML3A/KfN1ym
         HErh+wHL5aw4QtxTXbcnICDVb29DkbN94peMOPktoQlU4eAAiaOvu/FstdGcWDBFZ/4p
         ogXEeoTAyhw66j9U9NWY8kd83uLY/2l7ruZjyFShdiBiapGl5Fes/mXJOaPidFRjOK+O
         isVzr5+a3IRRE+Ghpfp1N29cWTwFGUHEii2S/xwMNuE4+lJIfHOzvyI3COAcHYGZqN10
         Qaqg==
X-Gm-Message-State: AOAM532BOPOWTKr1nWWYCcxTdy2nq769cSbabMrbrOHQNHzYK2o6E2yU
	+jQPPCbyz7le88ZiiC4Q9Zw2o9AZJlJtMA==
X-Google-Smtp-Source: 
 ABdhPJxpGW02ydNOVSukCfXnAX21yw7m3uMvVgCqQmvZq7ilMUvkVCaM4eVfEZHOhKkq3xP2yTiXmg==
X-Received: by 2002:a05:620a:430c:: with SMTP id
 u12mr18806902qko.589.1642534802295;
        Tue, 18 Jan 2022 11:40:02 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:ff9b:992d:3671:5cb2])
        by smtp.gmail.com with ESMTPSA id
 bj25sm3154490qkb.118.2022.01.18.11.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 11:40:02 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp: create u-boot 2020.10 to resolve warning
Date: Tue, 18 Jan 2022 14:39:43 -0500
Message-Id: <164253478337.1176449.17215343159780451091.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118170559.24303-1-jon.mason@arm.com>
References: <20220118170559.24303-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 19:40:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2865

On Tue, 18 Jan 2022 12:05:59 -0500, Jon Mason wrote:
> Poky, etc master branches updated the u-boot recipes to use 2022.01,
> causing bbappends for 2021.10 to no longer function.  Create a temporary
> recipe for 2021.10 until all the BSPs can update to support the latest
> version.

Applied, thanks!

[1/1] arm-bsp: create u-boot 2020.10 to resolve warning
      commit: 74caf3d057b67b2e64a9cf1b118125ef4e0de559

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

