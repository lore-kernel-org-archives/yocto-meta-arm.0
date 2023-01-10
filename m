Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC0BC54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 18:27:04 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web10.1067.1673375218122142756
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 10:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Xrf9cVhd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.221.176, mailfrom: jdmason@kudzu.us)
Received: by mail-vk1-f176.google.com with SMTP id t2so6043113vkk.9
        for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 10:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U52jSEfhhduz/ykno2M46vqWkOUP1LYkkL5lWR5Sx94=;
        b=Xrf9cVhdz7MI6cbNWAYihYS3w4e9nDtNaM9I9Z8xRcEUIrsFqvYJ8+hI+ccderOVzg
         Y1IX9R0kJvZZEpyKBV/IoUWdDMBKvdKXpwvnZLNo9SfjfIZPfitU7CVx92TdOn3mdclj
         G1iewqYJ93Up+wcDz5v2CrssoUJ/ibZpXbt0hJ6BB3+I2F9T1PunH5cYAm7Ips190anO
         eJFa38xh/wJrbkUXnHRd0ZspqbziFdk0knnL9dcENibHhZknNNKmlHMih92LoETJLW/Z
         eqs8hZBs9OuJnCY4aLrbokkfxRTsaGNcLfNydECKETfvanNvV1omMvjAxYiWgQrtg+YA
         Fjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U52jSEfhhduz/ykno2M46vqWkOUP1LYkkL5lWR5Sx94=;
        b=JOtinUHOzskJqOoT68mvAcav8seo5JtQEKDRXuODmz6WyOZT1/MgH0fxSZTMrOyviB
         mta6laeWphrbSgLVy6CK10Jdf92Kk/scFgE1OVnahGQtdOapsZrGNpiNAxcWcde32JEN
         k4YegLnjBZjL2WdjiC6dD2puJgudPgY/c32LWBkIR6zIp9uxxP3I6qJOoZrKzPvQteTN
         W8XXbwN2Qw3/RCq72yCoGEqBEuv1SijQji7y9rm7wSPqisGAN8R9+bUGKRAh6YLbNd8b
         2jxgUeMuG8yX0TGzP3i4EJn1XWE6v32KvFxzTEg4kU9ma5zc3/AE6uev8fI1ONT58omu
         EPAQ==
X-Gm-Message-State: AFqh2koye68cKdiT87du2Jc9sx6NErEVU1C/9KjaSDGz3arRrA2aDHi+
	CyV1XRUUhFOi94JK+rPzVjLwzQwozlBkmXxz
X-Google-Smtp-Source: AMrXdXv69EKQxjVXDA9/S/Brrrd0wQOQmDLUO68xDDFMR1j97aK7iSFJkrJYDxi3DT0jTPorJhPfpQ==
X-Received: by 2002:a1f:98d2:0:b0:3c5:2154:31d with SMTP id a201-20020a1f98d2000000b003c52154031dmr33354866vke.10.1673375216714;
        Tue, 10 Jan 2023 10:26:56 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id g16-20020a05620a13d000b00702d1c6e7bbsm7386719qkl.130.2023.01.10.10.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 10:26:56 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH][dunfell 1/2] arm/scp-firmware: rationalise SRCREV/bbappends
Date: Tue, 10 Jan 2023 12:02:54 -0500
Message-Id: <167337017412.817238.16125322257077938592.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230109144130.1399220-1-ross.burton@arm.com>
References: <20230109144130.1399220-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 18:27:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4253

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

