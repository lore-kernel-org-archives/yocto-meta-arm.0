Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11266C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 17:02:46 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.30289.1653325363798701789
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=sIPXp4Id;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id g3so12987496qtb.7
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KL2jWhFdic1qqWJFFW9rTUS4S60AHUYVuUKqzQ/jwAo=;
        b=sIPXp4Id6+spCcgJBDMn3zMaTyWfftrGEllxcKQF7zVmPiZSeqJSy1lvGVPjmWsxM3
         iSJoTO0QNDf0SlsAobNmx8NsmVU5h6cEtMTo8YgmEVefMIJFa38rzPxXKOGcTheTd1Ff
         uIWpV5ichiipg430SqJlt4SCZhfrMkN9r6d0X6J+auYuZ1pqYnfYelkrHzr/4LZeNxRA
         CSrS1jE4WZZWhbLpudldLkSh2BTa70T9YP6+tiIn6l69kYyshX43UGG/+fXkYunoJ57y
         yIHbgg2jKxKYfaFH8FEHLwHroN++dGhCJlJUj2YRByjdAd6pJdlTtlNe6O/aZerdOZOQ
         AS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KL2jWhFdic1qqWJFFW9rTUS4S60AHUYVuUKqzQ/jwAo=;
        b=apMO7PdkxXQK7x77Et13zKhwtoBJZ/q4ouzYu+Lr8Ah5gJX37T8IgkoPD6bOhSVdUG
         qA/aJBMaCrUp95WdzE90dfG980+NtvaPEIEXrmkzLRDTyUPG+Ui3gF2RS4LY8OlTLZZk
         ja0C4ieEpzEuGUoKzS3xq+6/1NxtTPOgd07IXeuwYcRoh2pYMZtaugQ6ltE9fUDI8R4M
         GqDseJLaOBcBtX11odPnGfnQQbaFkSm7k1TUSF8eD4MmY6pdj4fcCuNugBqDH7t6dcPX
         8v5JFg6LBaX9SQHGOqOSNh6fYGzH976Nj270A6poIGvPQc0xvA9+x59zUePr7UaHktXd
         wUkQ==
X-Gm-Message-State: AOAM5320+6OqCuP8hELz7zmFmTGV9OJVhR1M/qe8Uqv1gX96Xa36EB9f
	3/HzrtH79NfJXoCYUb5ZtacvoTJVKgJs2LBG
X-Google-Smtp-Source: 
 ABdhPJxyvB/Pla+g/KEoAX4fcybqs+smpp+tWVa15VtNcQw0/Ai228RtzeL/nRFtedLNT9igIZolXg==
X-Received: by 2002:a05:622a:390:b0:2f3:b5ac:c2d0 with SMTP id
 j16-20020a05622a039000b002f3b5acc2d0mr17086610qtx.244.1653325362799;
        Mon, 23 May 2022 10:02:42 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 a13-20020ac84d8d000000b002f940249151sm13720qtw.73.2022.05.23.10.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 10:02:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH][kirkstone] CI: use external-arm-toolchain 10.3
Date: Mon, 23 May 2022 11:42:12 -0400
Message-Id: <165332053185.113912.10124739326113303593.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518112659.3471891-1-ross.burton@arm.com>
References: <20220518112659.3471891-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 17:02:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3459

On Wed, 18 May 2022 12:26:59 +0100, Ross Burton wrote:
> The 11.2 release of the Arm GCC uses Broadwell-onwards instructions, but
> our CI (and many other users) have pre-Broadwell hardware.
> 
> Until 11.3 is released which fixes this, go back to using 10.3 for our CI.

Applied, thanks!

[1/1] CI: use external-arm-toolchain 10.3
      commit: fc09cc0e8db287600625e64905170a6de24f2686

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

