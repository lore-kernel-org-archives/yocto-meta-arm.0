Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCF2C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 22:58:28 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.3852.1640041106947154515
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 14:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=iNb79S3c;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id n15so11358333qta.0
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 14:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MTIDqnJkq1NkEYUby6+YXr0OwE4e1HYfyMG2X1hO6zU=;
        b=iNb79S3c0n9AEz+N1AVmKJyY1lxwo/ar6Q7GXEwWzNqJ+mrj0WGEptTOdYBUUJsBgD
         hP1vXWhr9x17vPcxqEnnR6dL1FRqIVhJyqmJCYFFFH3Uhl4eRyOnn4zQfmK9wi0JFRVH
         OG3e8ckwqjxquCMZUPoKThkNw+Jih/50gDfwchkjP2vEUrvDt15j027sbYYpK9Jb/vd0
         9uMQbvKtPOmb1cpdrLf6bX4BNODWpuD1pYpMlAWs++Io5zZzX4hCoJvJ48godp4Ysdbz
         axhE9iGYgyXhHw/z7kWlhaa2133rawQ8+wGGUw3Dh5GWE+fQEHmH7xN8edOMobFkcNJN
         ha8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MTIDqnJkq1NkEYUby6+YXr0OwE4e1HYfyMG2X1hO6zU=;
        b=mIR/uDhX2Z/acYwL5DtBGcW2Yu+v9ba83H2vjw/ih0yNZIi5EaFyXXgH0hzEuY18LQ
         aS7RKXastrMZYApeuBTplEWIVzxuh0lOrxjafyzM4ljMo3rzT/lu3qydPmwRkp1gOR5T
         LNEb9uSNqVt5N13F+rkl7xlowpMCCzfo2A1PhJBFCgaZQJw3QlNNEhvVTFLMt+1kHRVO
         Xsbmh6/ewP2YiRIOGXJZJ/KHlZ10L/9wXSdafDEvEpV4rvPRp6WcV2kxFcDeSbsNM+z4
         FKICywjsdRIX6yupxMMkHSc7NXNELC7Oo9OOleAV8CyUG8GIZ/R7CDAczdFvRoxuBR/i
         fKSQ==
X-Gm-Message-State: AOAM530/YAz/GMPzVEwOJ27Pwqq5Pg1VPO0XjRCY7qvAUNrcF/ZfT/r3
	yEM8W8Ra4LR/KOvty6AasyKHWbKk0Fsd69GQ
X-Google-Smtp-Source: 
 ABdhPJx0nVgeBaWw3GgpG3zdpGQgIpVzTx1PA9ftTc4PIZK4k4tx634Y8kAOeijq4w8mox3vDqz1aA==
X-Received: by 2002:ac8:7f13:: with SMTP id f19mr199775qtk.423.1640041106017;
        Mon, 20 Dec 2021 14:58:26 -0800 (PST)
Received: from localhost ([2605:a601:a60f:e00:4124:7c32:8a5c:5da3])
        by smtp.gmail.com with ESMTPSA id
 e13sm14606378qte.51.2021.12.20.14.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 14:58:25 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/7] arm/oeqa/fvp: wrap bootlog output correctly
Date: Mon, 20 Dec 2021 17:58:18 -0500
Message-Id: <164004109816.15663.17537464879134672997.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211220171337.877288-1-ross.burton@arm.com>
References: <20211220171337.877288-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 22:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2750

On Mon, 20 Dec 2021 17:13:31 +0000, Ross Burton wrote:
> Join the list of boot log lines with newlines, so it displays properly.
> 
> 

Applied, thanks!

[1/7] arm/oeqa/fvp: wrap bootlog output correctly
      commit: 17f7371ca85974422a752a8bea63aaacb9fb58c3
[2/7] runfvp: add an asyncio TODO
      commit: 12501b717f68e7b8f3d04fc89c71c86d055cd8cf
[3/7] runfvp: handle the fvp quitting before we kill it
      commit: 1512bf2aef5931c94c9a5bb996133a90ab31f454
[4/7] runfvp: don't hide output when using terminals
      commit: 1ccccbf6037c9ce3e41162e86f6372e0e082b1ce
[5/7] runfvp: don't use f-string when there's no expressions
      commit: 778037450047d1b6a3b6592a3c1b2ddb3731ecf0
[6/7] runfvp: refactor terminal selection
      commit: 10e60cc8ef6584c6a76e1b6eded5de28ae7af41c
[7/7] runfvp: add basic documentation
      commit: 31a520838392c1834684a1a5f027a1b4b65e241d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

