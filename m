Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0795AC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 13:49:37 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.381.1641390560650145960
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 05:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=6hTw9qID;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id q3so37607620qvc.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 05:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0dL+/t0Rai7QFyQp68ItEe4QMUv93YbIoEkvKu8k3nI=;
        b=6hTw9qID7oCw/ogqMLHZNaInxibOGHqp7ooYo/WHr3/DBXTyM8oz4kaPgcamOYPADZ
         G6ig7yxjO6u+VSswLuJfd/lITp3pZVkWq7w2iW1f+tejjF+3x40FVgEkK4Nsy+FK3jY5
         O7hn7U+9+D7VOZ6RmbWUg+9VlQ0TqnP/HbQp+XdRXEd+EIaif2XGiwdyMO7cAmP4PW2+
         yyEBvYHmhBol9WqAa4+foN+8YSH+JHmr4QFb/J4qVQA8utOxt4sgpUOSE/b/a6k+3Osg
         WxOv5wAUuQeZ335oGMdrYWXM8uWGFEEp32nFtrEc8aiZ5hUNBWlnbSU1EkN+yc8SXi+m
         YdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0dL+/t0Rai7QFyQp68ItEe4QMUv93YbIoEkvKu8k3nI=;
        b=pUYRwssBh2CpQcfUcGEU3O7KCr3zyxIhbZVBVj/fyWewibbHqT8l8xc2LLemCEg1Ym
         rUnYEFXYEVssQc3sdfrgJbYTuF29MzE4ShjzC+fXDGJ6gKn2A/5pdMKur2tMcigCHNhc
         p3h0YM7toWApW4RHkN05C11xiwOrULBDWiLu5Blgcs8uSivAcMPAKZCo9C1z7lBZMeG1
         iy/P3fLzUs6e/LHO4NcGajE8HjmqE2ZEbas6QYvxi1YdTYe2mipmoLlRfip6Qn7pQpyI
         NE8KjVzLAddt0MLxyy0n2H+s80yrnmJgF5Z+HSO+lhS2qBRqtcAqbaiDWVa+wOFnYhW1
         b8jA==
X-Gm-Message-State: AOAM531pDAVC2ujdV067OszLG5PfskA1qaOBgjomDCR81hG8/caQKvTr
	nmbsiSwuxXnWxpBWJhP1TijwEBj0OuVJCL2M
X-Google-Smtp-Source: 
 ABdhPJyZAerzB+4P8D10/lAFa782vzXv5gYyuIvi7EnKbE56HkNsQTHbY2Le9aP/d0qmPCRUZufGmg==
X-Received: by 2002:a05:6214:c41:: with SMTP id
 r1mr38425435qvj.76.1641390559718;
        Wed, 05 Jan 2022 05:49:19 -0800 (PST)
Received: from athena.kudzu.us ([2605:a601:a63c:b500:1157:f61d:8f4d:425c])
        by smtp.gmail.com with ESMTPSA id
 i7sm35418329qkn.0.2022.01.05.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 05:49:19 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
Received: by athena.kudzu.us (sSMTP sendmail emulation);
 Wed, 05 Jan 2022 08:49:09 -0500
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH honister 0/1] arm-bsp/secure-partitions: add check for
 null attribute field
Date: Wed,  5 Jan 2022 08:48:57 -0500
Message-Id: <164139053780.3978608.682099504845105968.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220104172345.22414-1-gowtham.sureshkumar@arm.com>
References: <20220104172345.22414-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Jan 2022 13:49:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2795

On Tue, 4 Jan 2022 17:23:44 +0000, gowtham.sureshkumar@arm.com wrote:
> UEFI spec says that if 0 is passed in the attributes filed in
> setVariable() API, it means that it's a delete variable call.
> Currently smm gateway doesn't handle this case. This change
> is to add above mentioned check.
> 
> Vishnu Banavath (1):
>   arm-bsp/secure-partitions: add check for null attribute field
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/secure-partitions: add check for null attribute field
      commit: 15815c7d4989b84607ed1a0e4f75738258d4e296

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

