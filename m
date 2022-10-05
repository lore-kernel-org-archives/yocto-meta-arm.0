Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3F4C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:50:07 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.1205.1664992201736144868
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 10:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=36sLq8A0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id d15so3048746qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 10:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=2qOsRW5UtZV/jAyT1clmn8cpq5r/1HxFYZtkgSzisSY=;
        b=36sLq8A0rA/yHZqp8v0+TPQ/IbOTq4J/kaVd//MuFOgFEoilZ5mfR5skzY+HgDeOfD
         x6YHIrJhG0UGxYgga/0vg/6mHpQmGxk+pe/CdiXSxD4+qzU9wfKkBASa4HTP5vs+WZWG
         BoPJC4xvMwC1rYC9aB4qsrEPkyiQ0Lvvwzwzeqlw39jOdt/bHfgXGw9f3GbIm2umcl72
         wGBXXJwwEsBlvjj8bgQbQYmhfrMkLMoKXHunQ8EqpoQ1Hgii8x0AHY3zoZ8xzhqQbf8o
         uA+lb7qKJRuzUfjgZXsJsEdFvXa+rsbxkAkkabUG+cjS6qxvSp8LUJr1m5x3424aGMcb
         HvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2qOsRW5UtZV/jAyT1clmn8cpq5r/1HxFYZtkgSzisSY=;
        b=t1jQF1DFE71dpguuQePDqw+/yLz/dMEe2NVdDftEvJGvVjbjFu9v6iZLMlyWg0uTdz
         Ena4E5wuq8atGjXHDsr0psDxDOytLQPELA0MNjfBDlTADLsOJQPV47QLLkX3W7w3iVbm
         dQmDyWNRKE3w9njduCHTdvfffToGRaawHbvRwvqPR6MZzhkfQo2Jvx+xEFFLyHWbVGmu
         Fa5aylsIZkVmkD6ZQ7P0MjT9AhMlvIx/qFNhX7Tf2ZILu7WVrJMXsR9NzAX0KTceRQ1S
         /m28Nd4KYHMn5tgXFYN00t3qzF+ryphxEpVZLI2M7e0U+wWjhBQHSIZT5mChziYC934S
         8GoQ==
X-Gm-Message-State: ACrzQf3V7/B7cZ7TPBmrbbQVZyF0TkPH0SSIauxpS+2RsbY9CwbF9DPN
	4ACyivy/F28Mkcok7712ZlRtdfhfK+0Hkg==
X-Google-Smtp-Source: 
 AMsMyM6HJhuKJCVtppkaa+kU2K0pTyf+32e9whXLcpGev8HMwauGzZSGkdYBQ5zdpGzcHY9fAG3DWw==
X-Received: by 2002:a05:622a:282:b0:35d:4999:10cb with SMTP id
 z2-20020a05622a028200b0035d499910cbmr557264qtw.191.1664992200256;
        Wed, 05 Oct 2022 10:50:00 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 ay9-20020a05620a178900b006aedb35d8a1sm20050363qkb.74.2022.10.05.10.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:49:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] CI: trusted services as a feature instead of a
 machine
Date: Wed,  5 Oct 2022 13:49:50 -0400
Message-Id: <166499219049.3688469.12962741847459307992.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221005134700.7308-1-jon.mason@arm.com>
References: <20221005134700.7308-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 17:50:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3940

On Wed, 5 Oct 2022 09:46:59 -0400, Jon Mason wrote:
> Trusted services is a feature, not a unique machine.  Modify the setup
> to reflect this.

Applied, thanks!

[1/2] CI: trusted services as a feature instead of a machine
      commit: 09a3e899dcfaa30899a430daf45aa614be189ad8
[2/2] CI: cleanups for targets and removed tests
      commit: 1bc064e0209116586e15b98e23c0f6274d882b81

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

