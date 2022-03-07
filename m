Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19732C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 18:55:28 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.1969.1646679327526014586
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 10:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ylTZR5L0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id x3so12774746qvd.8
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 10:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oljHb6mNgk0qVtrmujgTjv/3FOROWS9b8WNNJ7kWGpQ=;
        b=ylTZR5L0nC00glN60RSndD0bqzRayBGU7MMPuoHrj61L5237+ifZdRv5Ysq8mhwF0g
         pzTNSkbWu8vPRDwY9RVNk2vLLrdtRgBWeu79VyHi7vCRBWH7LMA8gd2hFQnTeFO2iama
         FJd2X537ZKqSw9iC9paNbPHlumoJS7IZyjlLO5oqAKgOxzW4id4EHvx9mi2PzrkUPcko
         IGyuW3RvXjBpFoEo4p/O2INQg1E66/Tf1TcFGOWQah7e6fu4hMPT/hev7OV36KNrkZBH
         mGJIGqfvo9vP74FqjUklxTJFvQeNV5DWi1eKGcfKt3aRwLj0qRAPyjTAHO5WxDuH1RcB
         iU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oljHb6mNgk0qVtrmujgTjv/3FOROWS9b8WNNJ7kWGpQ=;
        b=k9xya1A9Qla5W4U3gSvjI5mhH9cXDXsE8FeaDHVHNHyKLpzXmlWBCdx+jlpA8+eKUM
         AsZYgB/HmLXf93VAounchIUCbPu3VBbb+p3S1qw7DSvL3FiUWMrHWtuDENdUgQaWlKf4
         X4v6RzkYe5m873UH+9SK+bDn4g4sipy3atEtjEwT982/OaWrMid8QLEnrxspkK/wDkmC
         ks0npZm5C6QgZ72F6KYmhsjIkoa7s42MCnWTCTni+KLmEz3tvEx8yqlTVMf625yjw89P
         zFAxbARumoNtIPpTcq7pf1ulF1BEN4cUkOCm2n9JNfEWEY9bDMRsLJF6D5qH4vKovDJi
         RItA==
X-Gm-Message-State: AOAM533575eNQWqYz2qEaYI/8mW3CJhUUhv6lZcLgwu3/Qon0nZkK/N6
	U6eMQSF6tR+o/Wk1hLauzVjtr26zoJLqXQ==
X-Google-Smtp-Source: 
 ABdhPJy5LQb5BwAWIu1aW6f9DQ5aZl9m7iGjR7emmMSWBW9OjbRUkPqTr/izMexWGCeidSL4PdYh5g==
X-Received: by 2002:a05:6214:627:b0:435:2dcd:d6c0 with SMTP id
 a7-20020a056214062700b004352dcdd6c0mr9418505qvx.100.1646679326420;
        Mon, 07 Mar 2022 10:55:26 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:7502:be68:40e1:3841])
        by smtp.gmail.com with ESMTPSA id
 m19-20020a05620a13b300b0067b4cc3041fsm632746qki.115.2022.03.07.10.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 10:55:26 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH dunfell] arm-bsp: fix yyloc kernel build error
Date: Mon,  7 Mar 2022 13:55:21 -0500
Message-Id: <164667932129.693350.15430463803266601357.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220307162333.2014-1-jon.mason@arm.com>
References: <20220307162333.2014-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Mar 2022 18:55:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3122

On Mon, 7 Mar 2022 11:23:33 -0500, Jon Mason wrote:
> Backport patch from upstream to address the following error:
> scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Applied, thanks!

[1/1] arm-bsp: fix yyloc kernel build error
      commit: ce072987837656d99d857436926fb5fbe2b280b2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

