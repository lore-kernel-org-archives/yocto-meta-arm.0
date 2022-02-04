Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BA5C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 03:57:31 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.4930.1643947050833838451
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 19:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=eMuLY08C;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id a7so4446030qvl.1
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 19:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0c465QIy+6ApK0P089I9AaJ6MyUcO4yRG72efZ00RsI=;
        b=eMuLY08CChE/3LUpevflyauW2iGWXQLjgXe79yqnhz7k6hunCWgD8eFvbHTWAsrVZB
         aZruIc439vcWKdqTCdixL2iJ17e++ny0voWwbfjITaeLtJ6hNc4Ci48wcGD4BiG4tky6
         dcttCsiMUYL8cs+bZ/b8qniGkNITED96x9aEwH/5HdAjo/rg0VJ23PobK8mTrpkW/FIO
         JIU7X24QqZ0OO64BH+kfM6Q6+UK+niMP1qbx2SrkUoRJDVlEfRDGlADBmOHDp8X4X18g
         A+rsAN5fCqLbqY3DI8HKdp52wunbqQ751Q/NzWVIpEXJAuzvfoefgeAr1vumLBM9zRe9
         wW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0c465QIy+6ApK0P089I9AaJ6MyUcO4yRG72efZ00RsI=;
        b=l0W7LuSc6UF6iy6gOsmDP5jF5wPmiKK3/p4oTaxbfMIac11V5I69MWMRodx7iuNzZ4
         PgEgZNLxrI1dpwmwicjGBwxleNRcxgon/8+mytFphqCiyPD53nVnLq1l9W1Wfx3Q+yfY
         +Yr3lrHQeBJtts3P9AlCozRJXtLOjm0IuqkUqHUF9FNLMq4uam1uWMA74+lH1aipwUwQ
         BuaxXvtyV+vBe5dpC1/sHGb1vcuHmBAsOb0tS8QJ426820d3kEQ2JobDuvMtH/RqhrBS
         p6idZ/0FN8du/+k2ajUNwVPXj8YbCYssEKUfGuVwNUVt5G/pBOn0xL0lR5v37jKt+dzm
         9OIA==
X-Gm-Message-State: AOAM5316/jZPPJ8zei2Rv0eVbNO/5ZlxctcVJ+CKD3hqNmqLMb4O93qR
	tYZACq9imMa//IW9UAhGyqW+snkU8CSx9Q==
X-Google-Smtp-Source: 
 ABdhPJwM3uOcOUc4s+HtgRwIxNKhlC1WN+8y2OwCkb3KiXnFwAmQ+/ZOX6Hop+vxj4rtYjy6Ni9CqA==
X-Received: by 2002:ad4:5b8a:: with SMTP id 10mr741812qvp.18.1643947049906;
        Thu, 03 Feb 2022 19:57:29 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:9889:122f:c76:bcb3])
        by smtp.gmail.com with ESMTPSA id w22sm570464qtk.7.2022.02.03.19.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 19:57:29 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Davidson K <davidson.kumaresan@arm.com>
Subject: Re: [PATCH] arm-bsp/tc: enable tracing in Total Compute
Date: Thu,  3 Feb 2022 22:56:17 -0500
Message-Id: <164394697721.2886371.4753439903627062230.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220203154345.36540-1-davidson.kumaresan@arm.com>
References: <20220203154345.36540-1-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Feb 2022 03:57:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2948

On Thu, 3 Feb 2022 21:13:45 +0530, Davidson K wrote:
> Enable coresight components in the config and also port the patches
> which were upstreamed in later version of the linux kernel.

Applied, thanks!

[1/1] arm-bsp/tc: enable tracing in Total Compute
      commit: 37ee3eecc521778ab7ead0136c91b92304f43d0f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

