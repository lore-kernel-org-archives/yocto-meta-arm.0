Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B667DC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:06:44 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.14506.1639069603500538374
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=gkADlO6/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id kl8so5679532qvb.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L7BhzHHHEfwZm9cq9tXsfpHHZevH9qYmoWYouCtLOUE=;
        b=gkADlO6/K7DmbnR/DpJpjwtyWov9LEU1bofH40eY4B+uWf5ZcgEv2xOOrYjGIM3swp
         h703obMt9HbGh2Cifu8XDC+SYsma4GnzldeYV+j8CjTCOjp0eHnaWofW2YURtjE0OZ/f
         cQusaNA9ckw3LGp9oUinax7J2FZ3bZ7hfSfYIsPaH0EY/ouDJ+qIK2IngTmn8wx0aKMh
         P6W4jOeTZJNZobGV/a00nXmO5BqTqqHEK8VvyAg5wMQPvrTcEnXt3JQYHawJEHLveOFp
         hexo/JOOGtqn70qfqBvQF1l0LGkD3gi46PE4cyFCZkf64B/KlyYFevc/hJVcKdxYl5rG
         +dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L7BhzHHHEfwZm9cq9tXsfpHHZevH9qYmoWYouCtLOUE=;
        b=O42vKwv1ZV/EwmB8kEKKDWb3U771jkzbHwD9VljYDlzhab4zI1JpoWj5ZkEQIp8DKt
         aBoAdCZd4CK4RYjQb49Zavvs0Gg52NbjEC+54JoI867f1i1/5p6WiXMy/Vpv+WjQe876
         p1njLqWqNpEjSYWtO9oQCuQNCmMoEUHH6x+D0fp8DF/4DCA8eU4OZovb5WALSN5xyFxX
         bIyqJ06HFyHIehiUpu4BYI4//3VHuVWNYM2XuP3v8lzrv6uCo/DyBuzGaEs9txWROWcK
         i8ekvWqN93JwFiyneYcauxOC3RHddmXEia8ENMsonduICW0mAN/ZiaPYPJVDHPPtnGuX
         TnIA==
X-Gm-Message-State: AOAM531LNKiLUL9vsjSLoqJn7TCaLYc4F2HrE3JfyGHFCdDVxPX10LRX
	58eQfK+74e2aHlDQYC/XoDNUSb1+h+xMUQ==
X-Google-Smtp-Source: 
 ABdhPJxqsi+bhaqtg7YDybcKKfPWX7z4XpRw1iht+GcJXofHvT668V/nsO5GBxvRcCfTQ3kszFg0HA==
X-Received: by 2002:a05:6214:258f:: with SMTP id
 fq15mr17364570qvb.85.1639069602586;
        Thu, 09 Dec 2021 09:06:42 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:28c4:a17f:5953:8cab])
        by smtp.gmail.com with ESMTPSA id a3sm274308qtx.59.2021.12.09.09.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:06:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] trusted-firmware-a: Mark qemuarm64-secureboot as
 compatible
Date: Thu,  9 Dec 2021 12:06:34 -0500
Message-Id: <163906959603.25051.17840464569729095055.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208201732.3000425-1-raj.khem@gmail.com>
References: <20211208201732.3000425-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 17:06:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2584

On Wed, 8 Dec 2021 12:17:32 -0800, Khem Raj wrote:
> qemuarm64 fails to build since PLAT=invalid when MACHINE=qemuarm64
> 
> 

Applied, thanks!

[1/1] trusted-firmware-a: Mark qemuarm64-secureboot as compatible
      commit: 67332589e0cbe4b93267589cd52dd0b9f2679cfc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

