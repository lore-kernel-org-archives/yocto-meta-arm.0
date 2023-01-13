Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F70FC3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:05:17 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.95568.1673633116220221014
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 10:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=CAypF4fQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.177, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-4d19b2686a9so168419887b3.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 10:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U52jSEfhhduz/ykno2M46vqWkOUP1LYkkL5lWR5Sx94=;
        b=CAypF4fQwljEWazzC5ld1UhhYFYwQZkrdKIW37Yym5bq17OnBnY7pFwuGn67+ilksr
         61RSC8De+YJsgLUaj/o5HzJbz8cC+Xjb5X9RDZTjCzqiii4zSRAd3OjjX9/N+NyN3kb0
         kwHlAe/gAHKEF2090hULsXZ7D8TY9i+eAo0/vxlKohGtL/Np3ShMMVqlPl0xAUxEisdN
         diVr+Nue/PCEMku+O2zILKI+wYWbraF9JgvgFF+dl7gf5mj9MnMEvLHemPsibMJSLN4c
         qxmheiPMILbrzWKUgdWh/w3FPKmJbMPk98SfgIVJCEyEb0rviXRkh7rFtlAn0PsT3LNG
         AmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U52jSEfhhduz/ykno2M46vqWkOUP1LYkkL5lWR5Sx94=;
        b=6EYzFD3y+yxeXPnD2OPqZ+MQ9alpDPVP/T9rKZ5bUIXAGgSePDDhcHV6ZgHSctnRTY
         GYm5jP3kXpjzGrKD+5Toy0VAfauKFBHWa5RXQ9kZ4Z4Aiqikeu9xe0Xdhcz2OO4BqBcm
         ukhGl+eH5+GpW89H1HcA4GX+MK5AuPf5cGNI0Ky7hu0YNLhbB5erf8UrgqhFfyvIn5Br
         LfzNOsxT4Uc/RdtVBSUJ7cTyKcCKF1Qk9vAeZEgStzeAwOeMtUKWjQIEqGMl4v6qvaB1
         EkNieOKx+jHP6ntHlpygnsiHmpuaBd1/Wc0UNofjd5IcvLsQvLZFFu0rzed6tFefJYKr
         /OYw==
X-Gm-Message-State: AFqh2krsPSStSH0AjYvZZAFyYU/eL4VAa8ykAcfYQyBiqG3HpRuzveDR
	K8xrRNwUJx4EyXqWPG0rJFBaok17bRBJGDk9
X-Google-Smtp-Source: AMrXdXtElyBezFkS91Ifkk7LIrWY4WKCqbMc22BzKkmM3ECikM9Q6z5EHo4yis9WulMdHcknZ3+RYg==
X-Received: by 2002:a05:7500:458d:b0:eb:b82:4c31 with SMTP id gh13-20020a057500458d00b000eb0b824c31mr1005961gab.47.1673633114725;
        Fri, 13 Jan 2023 10:05:14 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id dm30-20020a05620a1d5e00b006bbc3724affsm12946203qkb.45.2023.01.13.10.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 10:05:14 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH][dunfell 1/2] arm/scp-firmware: rationalise SRCREV/bbappends
Date: Fri, 13 Jan 2023 11:17:05 -0500
Message-Id: <167362662492.2507550.10331387866274908208.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230109144130.1399220-1-ross.burton@arm.com>
References: <20230109144130.1399220-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 18:05:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4280

On Mon, 9 Jan 2023 14:41:29 +0000, Ross Burton wrote:
> In "scp-firmware: allow setting log level to INFO or WARN"[1] the base
> SRCREV was bumped from db1991 (the 2.6 tag) to fd7c8356. This means a
> fair amount of cleanup can be made:
> 
> The base recipe should set PV=2.6+git, both of the existing bbappends
> already did this so those can be removed.
> 
> [...]

Applied, thanks!

[1/2] arm/scp-firmware: rationalise SRCREV/bbappends
      commit: a07dec8ad8a260f293a55e8300f514dee134b2d6
[2/2] arm/scp-firmware: backport a build race fix
      commit: d13be36099aff7ea2975a1a197564e2e801707a3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

