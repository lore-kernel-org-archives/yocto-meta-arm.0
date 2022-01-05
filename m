Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3D0C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 17:24:57 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.3606.1641403496681842099
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 09:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=MOy/2IOT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id s19so1010482qtc.5
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 09:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/d/708MMkW8SWb0MCNVt7NpPtbVRmY7l2/jb8nhF3gw=;
        b=MOy/2IOTD0MdphK6eJkAhFdmcx72CvIvkUkw+JqBaiTHYXV23cDi9hKUkHycz78E/J
         lmCIsrg0G3EAUVLzHktC9laeokVEpYAZ5q6l5F6NFNVNSH7uq4wx5aHb1fQLu7YJFOcU
         dl+h+nktrxTZ42fHS/M4mNj5mGJlcQg/YCb1naQ3yKc2hxm32uHnLLKOhKkC1h7bbK17
         UlRD2XnfmMgBV/nY41igRBATf4LJaMxUqz3QYS3U2J2rnmjgq1wV5RaW1VK5bUnDN939
         /9g7jC7dFxmJMjLduve8TCAU6S5lIYENjYOb4QP0ksZZNoSLFiBar1gPQgdUQjbV49Fh
         HqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/d/708MMkW8SWb0MCNVt7NpPtbVRmY7l2/jb8nhF3gw=;
        b=AKr6lWCvXVt3wqxA29I8wqZ+VMEikOT5UhhCQ/t3Tr4Svg4Tm7ormo5IlfZ1SO2MjX
         Z9XGz+BVEYZJLkFzxN87++r8e8gQfy431JhsRj05rknSk/RkJosG7JaVT+d50KWgvfMW
         RsdbVUrF9vJGOFA7APQ3fn/ZHXUb/6NBDsRnINiy04q9qO12tl1UMTUvf0/4a1FKZs4/
         EojmdorDNMWcHyPnYi0i70ss3z4j3CEiuMMAZuye+0H74Is3SxFQemvRkJkpoio3VymJ
         RbFdzPzfhMXeiawbjVJRjcfUdFqTeymwx0FpHgRWc0RGpeymPX1Ds8f/lXisoUyai1W+
         9AUA==
X-Gm-Message-State: AOAM531jOw78MyCFyW0WYrPOI8bMdROdPGE9zNRtU+v+/lg+bvDVG3ut
	79uwkoLMF4lxsZ2JZJpvHwAm21GPMWFMkoK3
X-Google-Smtp-Source: 
 ABdhPJxbcC+UsDrRf7UBzTqyZX0FDGKgjUQzdI6h3ukoWdfmC0A/XyB6h4PmqlAOGw+ZA6xr8ELRNg==
X-Received: by 2002:ac8:5bd6:: with SMTP id b22mr49496354qtb.92.1641403495579;
        Wed, 05 Jan 2022 09:24:55 -0800 (PST)
Received: from athena.kudzu.us ([2605:a601:a63c:b500:1157:f61d:8f4d:425c])
        by smtp.gmail.com with ESMTPSA id
 h4sm2217437qkp.54.2022.01.05.09.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 09:24:55 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
Received: by athena.kudzu.us (sSMTP sendmail emulation);
 Wed, 05 Jan 2022 12:24:53 -0500
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/trusted-firmware-a: use full option names in
 sgdisk call
Date: Wed,  5 Jan 2022 12:24:45 -0500
Message-Id: <164140348516.3198110.11822303855569630613.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220104210558.3504309-1-ross.burton@arm.com>
References: <20220104210558.3504309-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Jan 2022 17:24:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2797

On Tue, 4 Jan 2022 21:05:57 +0000, Ross Burton wrote:
> The TC appends include a long sgdisk invocation which can be made a lot
> clearer by using the full option names (e.g. --change-name) instead of
> short (e.g. -c).

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-a: use full option names in sgdisk call
      commit: 8d53f4c3eb03218d9b1c31f6bbfda8e6f2dc5bb1
[2/2] arm-bsp/trusted-firmware-a: upgrade TC to 2.6
      commit: b398c1bcdfd653adc72d10882b21695d0d236988

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

