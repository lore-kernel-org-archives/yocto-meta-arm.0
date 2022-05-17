Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC072C43217
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 15:24:13 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.8773.1652801049875892256
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 08:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vgC3MkV3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id z126so14803373qkb.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 08:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PEO633R+pRMQHyFEuTfITIqFtTw5O9TABnZGgTzRCLs=;
        b=vgC3MkV3dvxBUJAKmkG6TgeApGO2eJ6YMxI5xzvhPqBv8+u5CGVHPcUw5faHJDmZbK
         kNvjJoUAFBNlINwcJnmMnodhGz48SsOfG6BRYwEnkwGVsGmE4RqDxYTXw36r7iAMI9kf
         PW153356o3OKiV5XuqXiOja/42FKgIBYENPVls2pe0g+tTkcKmnnTmxXl5NZpb4EUscB
         BS3+WCvUaIQ0DWBvaIw15Q6LfzCXueyWLX2AkE7uEMKkUKBz9ed9bTslor8TXAg4H/2v
         ARN7uf4+Qv7K867wYtLMNEVxHax2V9u1hXN4UZrj608iimLl3G93XdoJWbHXW032bjA+
         tgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PEO633R+pRMQHyFEuTfITIqFtTw5O9TABnZGgTzRCLs=;
        b=panGgfPmDoNjLT+Oo/CmQ5nN3BNO7GfVsdhXrbbGJsKXabp8dyPz4uQsOfzM2vVBxf
         fHJSdUSnOLKWx44fqD7UrXl4x4yNdmYYB9iSj+bzxK/FJyn7692m8eZm3GaqHlYHjujn
         SpoknL/UoKcj11ImmScwfe33auCvqIOiM6Nqe1h9Z2wv9Ci54uCYyTuiRZhs/0A69kWc
         9Q9Zx+UKWbFCpVl+P1heQ+l5eJOvjj6DCmSYcaZn+WsHW6qvx5scqhoPEc1tC/er7fs3
         ERkkR5GriMoEKCtp0SC9G8Db+yHjteGeLKKKXnvXbhLekk4tyjjtG+H0NHr2Ini7mpLS
         hXjw==
X-Gm-Message-State: AOAM531a1tSIjh0SBGYHe/YoskgA5a2LgFWivQVCNqbtWuiI15CBrmJa
	NFNSoCbIE+rhZegiKXDTcPil+dHi48Z2P6s7
X-Google-Smtp-Source: 
 ABdhPJxk7NEOE5DMEQRR3g8p0pxPQn9wwHf8XPYbIdhA3WpQOURthVI6MA6sma5rpzP9P7cgwsBSHA==
X-Received: by 2002:a05:620a:2792:b0:6a2:eb8d:70e1 with SMTP id
 g18-20020a05620a279200b006a2eb8d70e1mr8089367qkp.574.1652801048920;
        Tue, 17 May 2022 08:24:08 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 c28-20020a05620a201c00b0069fcf7678besm7690596qka.105.2022.05.17.08.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 08:24:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/5] arm-bsp/optee-os: set PV correctly for the
 corstone1000 build
Date: Tue, 17 May 2022 11:23:49 -0400
Message-Id: <165280103077.3622764.2352618471418754935.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141231.2513449-1-ross.burton@arm.com>
References: <20220513141231.2513449-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 15:24:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3421

On Fri, 13 May 2022 15:12:27 +0100, Ross Burton wrote:
> The corstone1000 build of optee-os has a bbappend which uses a specific
> non-upstream branch of optee-os which is actually based on 3.10, so set
> PV appropriately in the recipe and update the PREFERRED_VERSION in
> corstone1000.inc.

Applied, thanks!

[1/5] arm-bsp/optee-os: set PV correctly for the corstone1000 build
      commit: 4b94d77f693a0d21d01eb287d5a9757ecb5122b0
[2/5] arm-bsp/optee-test: clean up bbappends
      commit: 6286e0d54cdc6edf9e1d03019fd9e0440f0d546f
[3/5] arm-bsp/optee-os: remove 3.16 bbappend
      commit: 7e09d10e23f4bd92ab0d559e8c84b32ee949fa22
[4/5] arm-bsp/optee-client: remove bbappends
      commit: 155a2f9ed4ff26d95ca0228d8d069062ac5bb4e4
[5/5] arm-bsp/optee-os-tadevkit: remove unused bbappend
      commit: 79a20dc1d76fbd983365c29063eca64872b8ab1d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

