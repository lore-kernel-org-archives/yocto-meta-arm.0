Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8120AC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 14:26:19 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.27179.1644416778515039112
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 06:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=A0rBJ14L;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id x5so1853196qtw.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 06:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4vFh0GNXpGPYZSoYacsk8vsF0BdGA4VpYkqm2aXYILI=;
        b=A0rBJ14LTEnm4bYABJLtXr888yFFo4QAcgaD1HRs0tgoQdWV7/UM2K1NWkR9X46sjO
         AXiUK8MTtI7cbB7lQ/GLDH4xXnPCQRJWcw6LqD89pMZ7WVUiqMm86z2uq6jer1bYx59O
         Y2F6sTeFrl5jaWfnggeOIusqtdX3VQzrSsZUoVu6XoxS094Bo8cNcKbiG16o9mgRSriX
         YXA52kN4pBKCA7mN9vnSLgVDkWC1x+7ElXTL2Z25ssiG06fXOtgs7eZmwvV25sVGrrQL
         1vWA5BAlr4Hny4ujHf2BHgyBuutfvS9dpcCzWsIWsZ8zB4hr5FIOFtSm4WZji7VcrQf3
         07gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4vFh0GNXpGPYZSoYacsk8vsF0BdGA4VpYkqm2aXYILI=;
        b=In4wHIfKacNeey9Hm235o9xXJXo9JxnUCgrEd32IFt0CyO04Dy6TPILNu1GOd1Ob2l
         JyYhCdCWzTVxAzZQrrsjk0/NlHoihSJxmA1/LT5Z+PX1DUSPIS94wBOCHIFo5eIzZNb1
         TGu3yOpsdvbQoijBWWDc2OOjiTBcjcc5VFT7p/XEj1/RLCyzbJ6JR1jBWFBC4PXCzly0
         h4ZgF/EXxJR8t3hM1HQmUaieD+bpyHzeVsSF9bD2Bz2GSXQsXaFNGyCx3ikt0WPCxuTG
         IOD3TAKlaWe5n+9+zWpDQMrSFkurDrx1zKpTK+2hNv9/s4L7qGjZMu9uYXGuGc+iTlKv
         sHuA==
X-Gm-Message-State: AOAM530Jm+sp7eF3VZgmlOiKrJiiLJV0fVIFrqVl+7rsa3qQlzC3B0Jn
	NufBo+DSIUetX6M5XVj7afBpGRRtdPbh3Q==
X-Google-Smtp-Source: 
 ABdhPJzcon9E5Ji7B4nB1NUC/KVqPmRsEENrq2trUl2IKUWndYY29l34kAssk4g8QebV3Aos5Dj9CQ==
X-Received: by 2002:ac8:4e8c:: with SMTP id 12mr1533194qtp.618.1644416777617;
        Wed, 09 Feb 2022 06:26:17 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:6f2:2f18:c3b:979f])
        by smtp.gmail.com with ESMTPSA id
 n7sm9030282qkp.119.2022.02.09.06.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 06:26:17 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: update zephyr based testing
Date: Wed,  9 Feb 2022 09:26:08 -0500
Message-Id: <164441676784.2001848.4708422362530343690.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209041404.13954-1-jon.mason@arm.com>
References: <20220209041404.13954-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 14:26:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2965

On Tue, 8 Feb 2022 23:14:04 -0500, Jon Mason wrote:
> Update the zephyr testcases to be the ones that build and pass tests
> (where testing possible).  Also, add comment to qemu-cortex-a53 about
> not passing tests.

Applied, thanks!

[1/1] CI: update zephyr based testing
      commit: e09839481ab330e72880f9e6a992fe9ce1b160b4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

