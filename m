Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107A2C433FE
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:34:49 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.23848.1636990488340120205
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 07:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=EbwFLSQe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id p4so8844879qkm.7
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 07:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mBcxl8Dbe43DiPMOOwBE1byGo+M+yDYfVH0FdLZDquA=;
        b=EbwFLSQekKvca0YvwF1LKdKL14EZgaMcQBnkN371cI9qEu2puuWh4vVqw8x6OW1TWG
         rj3byiSfachXcnmdpIhFI0sl9hnpckBQbh6G1oJCYj7JY2ZDbIXtHki1Fvm+OQ/+wI14
         UFEXC+/i901ji5z0vYmBLAh+ROlCExdnjIPRgP7T4mH085T5BLRE2KVcUjUXvbYebDdC
         HBctLHQiS2v2IHYJGXi4wL0uxSaqdyv9SWGWbsWuzojXk9JxxlFxHfOg6h+Poz0CuJGh
         /JrpHbHDF3runDFWE/Az2k/U3KsKGv2Q7SIoMduw2xMzt/NQEq/iiNGhhfMPppeA7xUZ
         JIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mBcxl8Dbe43DiPMOOwBE1byGo+M+yDYfVH0FdLZDquA=;
        b=N8wQLbDVUd/78+z6Td4/Tr5DvJGHNOnET5BXPgbSNuyBDN8b4WEXPJoBpkjLKvbkNk
         Loorw8GECpP5TYlC1xFctIE6gw22e9w1ha+WtQGbA8dLoXiKnFcWUJ+2YvBkA7PPmqeE
         y9K3IiRZ2gnMSmEFV2P+SAiPxZhW3e1sBEF6wtlnkUUc3hL7NtSwBSjsgLfzKq1F2G/O
         /zAocOa6akoHAfAmCSGuFG5q7MUeTY3PEcBzwtxFkhlzjVFvI0UPtdtwHL/hn0Jqmt8n
         kFBaUrd9T2AI1uegTn2WWyIw8bxaB0xPQ01wdh3+w063NTsGEfm5eAdbnne+Xawf+EWf
         bUmA==
X-Gm-Message-State: AOAM531hw5z1OZNMuQ6kV0WKz8MhDw6mVjRd3QtL/H3BR03Jj7bl4sbj
	z0iq1DmyDavysmM3yg7332RqgxvoVLcYQA==
X-Google-Smtp-Source: 
 ABdhPJxLZy7zccb8V2mg8Ikv9G5PGw+qwDLON0eXImy6ydarN/vK2ZDawVs8USQruZkjmkYXFz5boQ==
X-Received: by 2002:a37:d4f:: with SMTP id 76mr2159984qkn.525.1636990487248;
        Mon, 15 Nov 2021 07:34:47 -0800 (PST)
Received: from localhost ([2605:a601:a618:1500:6191:7e45:fd06:9a39])
        by smtp.gmail.com with ESMTPSA id
 m19sm6491403qkn.129.2021.11.15.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 07:34:47 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] Remove use of deprecated `lnr` command
Date: Mon, 15 Nov 2021 10:34:45 -0500
Message-Id: <163699033087.21481.7222084175437565577.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211112141414.575974-1-ross.burton@arm.com>
References: <20211112141414.575974-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 15:34:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2393

On Fri, 12 Nov 2021 14:14:14 +0000, Ross Burton wrote:
> lnr is deprecated and will be removed soon, so replace it with `ln -rs`
> 
> 

Applied, thanks!

[1/1] Remove use of deprecated `lnr` command
      commit: 2098ffd84a2c78824045e40067c418b86df7708c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

