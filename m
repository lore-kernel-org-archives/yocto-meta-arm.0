Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CE7C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 03:06:52 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.65.1655262403387770565
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 20:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=JYkltTTX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id c144so7829560qkg.11
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 20:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x+fNzEf7gyaZFawUKWDgKRSQN0h0V3/5N9yeO35uNv0=;
        b=JYkltTTXnqXPraP6pCZ+plii/VviT59hLTZRO/njq6R84c0JNkn+5xc8u34WJkgi3L
         t72SPTTf0yxneHHGncu9Nz8r1sChpvKuMRylxeZmps1MdfkjHvlSupWYgUYhCYRoDbeu
         HVBt7X6N9Hp2mt5yyJBjv6j7pOV8cN8YlbmYZBtoIqtK8knBxUAASWIb8fpAT3MPE1QB
         4E2W9my/aXy2l4+qZw2zzu44F0/6X281gLx6MZZtBZ/QqfTyogFeUpdz+mBCnPgVvA83
         MydsS7dVBRLPy+6KoF5zyykZlpsQAW72APmRuYuNN6+td8bjBz1smkGeiwILwXjMvu2r
         dKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x+fNzEf7gyaZFawUKWDgKRSQN0h0V3/5N9yeO35uNv0=;
        b=Kl4hf6a7fJzq51sxsda/N0WEOzXeLFjVkITSbK9KlgmQoBi0t1qpz6sSfi/cXKPJff
         HslXUwp5g/hdVBjR/E4hgtRW6bC+/Xte4bt8RV3MZuTwfOdQSbzAC/6zDI5GKlJuRPaS
         TA+vqlL7xH7y475l4n5HivhAcX4bGVwtsWYZZRW06+4a2m43eD+77s2vZL2A5Wghhg80
         TZfHKqkw4aJ8gcHViJ8/2epOZ5U+Sm8kV83mtJ2Lq7/S3azBVArp4+ZDs6Rh3/kMjbyx
         z8KQo0DwkJzfCKj/2zGkOnX9PtrTfHSK7CJGcvKjRHyai0LK6Nv3t/UbL+ZSggzVW5RI
         fW/A==
X-Gm-Message-State: AOAM533RFFjQscA8GKyit7AjzO/zl7I62sHAQdEO6Lx+ZmG9RSPTiARc
	WnjxXUJhSu1elEq0hbVqcXqPeSlptSqdQQ==
X-Google-Smtp-Source: 
 ABdhPJzmp1CA9fYjjuayta4kwx51MPgHC8IgbkESR9C4wG/RcCc3fK0wRP/EH/z9r1TXUqAgujwo2w==
X-Received: by 2002:a05:620a:4505:b0:6a7:11bb:746b with SMTP id
 t5-20020a05620a450500b006a711bb746bmr6560604qkp.309.1655262402370;
        Tue, 14 Jun 2022 20:06:42 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 r15-20020ac8520f000000b00305030cabfcsm8249006qtn.38.2022.06.14.20.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 20:06:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/optee: update to v3.17
Date: Tue, 14 Jun 2022 23:06:37 -0400
Message-Id: <165526239778.1444600.8414251938137689780.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614201322.858-1-jon.mason@arm.com>
References: <20220614201322.858-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Jun 2022 03:06:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3504

On Tue, 14 Jun 2022 16:13:22 -0400, Jon Mason wrote:
> Update the recipes to v3.17 and remove v3.16

Applied, thanks!

[1/1] arm/optee: update to v3.17
      commit: 36b43bc327a30a6eb734117b2994f437ae2f2b77

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

