Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E88CC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 03:14:21 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.5460.1639624460108086544
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 19:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=yzPlEy7Z;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id t6so22145060qkg.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 19:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cFpuqygzqk2V8Yge3ZhrryZggipYcHESLbwpt/i+1Xo=;
        b=yzPlEy7Z1h/F3MdM/lFySo/5iLIndW0x0OCLcH+jC00uNfjbeSsm+FyQlwTLAImykq
         YOBbNlakPmR1Zu/VAPOjqP/4qCKwNe2e5BTNpe1VIFLBM3ajvE3YFAXgCKHrshyqLpDE
         ejvXrdJjZn6aKMylSLU4j5OE7c8JjCLj/w2EkE0gVrJ+5yyICx48kpn0g/6qXclH9OOF
         qjtEY43e0sp12DJBXrnuoNJ/YM/wv/uK1iJ408URxFeJ9DjVbKr6IjpX/XQ1TJ+CUQlc
         PEQtWtdXMBQ8sDD/WqJNO8SB9qyOjt+k5n22awdvzdufGycjvcD4BZDYT62582LA+HeH
         L2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cFpuqygzqk2V8Yge3ZhrryZggipYcHESLbwpt/i+1Xo=;
        b=hnv+SkEc/glDjyyUfV3ihXqAGDUPgoCRfVAxdFl63HMgL0bWVCSYf45tR/xRj6QLFH
         SZtr+S87FbL5BFyjaYSlKMhekWO3AoVdCI1dYAZeSe6kiLaI3iRsPEphNjyZruaoXp4i
         FwfTqsm8NtpUYvqpb2EobHlE6dz7PnL6gAiI4fK/UkjMlv+hn8lFmhd5L+MVp+4YuuI/
         DdApcxsfRsWdbt5+dkLvAKVqUW17nETfC9e9+/SzkUuE3qeYlODJoDoLYayEXn8zPuhA
         660VEczuyIv/K/4ELSGxkroZz/nRG77KdkPSJkWIc3r8g1fGg6jOQK1H6hvCk4+iu5v2
         GYlw==
X-Gm-Message-State: AOAM532qRcGFhpUtu8taGjJELVYbXF0Y0bdGHjDb0upkxJMDdd8TVy9Z
	WBpavqwmOGIbIwAPPC46+YKR2i2mZK/Us9ms
X-Google-Smtp-Source: 
 ABdhPJwvIdABOD7mKCFyznn6pgjwflFkXZOdQ2NE6hdeOoOqJ4ceFW0uOZULA7a3nqgUjLFYU9cK7Q==
X-Received: by 2002:a37:bd86:: with SMTP id
 n128mr10903621qkf.770.1639624459124;
        Wed, 15 Dec 2021 19:14:19 -0800 (PST)
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id
 bp38sm2167300qkb.66.2021.12.15.19.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 19:14:18 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] kas: corstone1000: update the FVP script repo SHA
Date: Wed, 15 Dec 2021 22:10:48 -0500
Message-Id: <163962424839.15698.6226156771737386002.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215180035.7395-1-abdellatif.elkhlifi@arm.com>
References: <20211215180035.7395-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 03:14:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2725

On Wed, 15 Dec 2021 18:00:35 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Setting the model script SHA to use the right FVP
> options.
> 
> 

Applied, thanks!

[1/1] kas: corstone1000: update the FVP script repo SHA
      commit: 7410a7f6211a8d41c75e0b032f2e4c7e9db98e5e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

