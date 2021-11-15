Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B244C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:34:49 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.23847.1636990487553333781
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 07:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=zxm1W2t0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id u16so11562013qvk.4
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 07:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MS4ASD8XYjwlJfNwG0MWAm+zb55efGva8on8RpX4Ugo=;
        b=zxm1W2t0IbmqF7XNQklq2oz6G6FTxfwmAF45oAszKbQDoA9kJcDee/RZQRNU83ycqN
         y4TBvRzrmYxmooFK5aCJLTj6bd0F39j9y7VSBmjmNE2a6b5Vu5arWewZdi0mAHJyRHwr
         93G0eZ7k9EmIazMmC+gYASLEhghVQLmD6IKTJ+lLHkemgPmqwCbD9cM68efLYNSV5QzM
         GkNHMI0pDhz8QbtLZpfHgQK0cP3rbK0iQcM+60R4y2UU4lFBKsCSj+3uk055Mk5UjuLp
         q2euZwMCZxBvG+45n2HCJwMft8DW//5gDx+kFC8rcM6s6dGci0p2z5vggOIcXz1zCEie
         kzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MS4ASD8XYjwlJfNwG0MWAm+zb55efGva8on8RpX4Ugo=;
        b=xwu6yRVqRa1N6V59fxXZFubUCvGHGh/GxX6Evree19lu6Yh8TA2Nyuuy/ELwB7D8GG
         N+qxmZoMsSBzM6ZDOapyWxtFIVW39PSalAdIYUFGA1/BjbASphQZ+t5Q23aG8YXyjMV/
         CcHc+ORdez7jESILof8ruqjCJfu+SyxpfE2LzNa6KgyOjVoDrDqFqjgWnEN9aMJd3FcS
         42Poj6ej1gP1qlXU7Q8fgzRi6uUS2ixL9Nj3Ce8PXBBtAiIIRojkIbaWjj+/ONG0PiBz
         7UMKPhNtGiYiKVUyRbPwXk9CvHOm23WxFz20qwTtA4k441bNjgC2DyU4TDuWH0AvFPmV
         1NGQ==
X-Gm-Message-State: AOAM53274npsk9+fffwZGhWbnA7SLw36GA5OZ1yLJSqgjGUTpe+MzKgf
	fWxJ+XOM8XOgWfWbD7BFsrUCvaNNdvhcYw==
X-Google-Smtp-Source: 
 ABdhPJyOyvIfWOdsOTARMnwNPWolOQW4nBwWFwfnzJXga2Iq+DoFtZawqAZIKgAV0mSRITqSK/6TUA==
X-Received: by 2002:a05:6214:18cc:: with SMTP id
 cy12mr37892671qvb.47.1636990486500;
        Mon, 15 Nov 2021 07:34:46 -0800 (PST)
Received: from localhost ([2605:a601:a618:1500:6191:7e45:fd06:9a39])
        by smtp.gmail.com with ESMTPSA id
 s13sm7319967qki.23.2021.11.15.07.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 07:34:45 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-toolchain: upgrade gcc-arm-none-eabi (GNU-RM) to
 10.3-2021.10
Date: Mon, 15 Nov 2021 10:34:44 -0500
Message-Id: <163699033087.21481.9690031600829864262.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211112141429.576059-1-ross.burton@arm.com>
References: <20211112141429.576059-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 15:34:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2392

On Fri, 12 Nov 2021 14:14:29 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/1] arm-toolchain: upgrade gcc-arm-none-eabi (GNU-RM) to 10.3-2021.10
      commit: 6bc7edfe831972dc1da9e01f83dbfaf6458a168d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

