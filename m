Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D497C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 20:06:44 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.759.1669061194982032985
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 12:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=tkiM6fGD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id x21so8858112qkj.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 12:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmuXCg5Z7O8ytN9Chv9LvwebvZD+1GbElmtZ+pQ5e5E=;
        b=tkiM6fGD1qpecU5ZQQhEUVIhohpNwynQfZnePy9yQg0IlLR3FwmUrGdlbaXNWUZC1f
         qXKpQvFthlw1/GZ/8PUYteGx7k5VpPkIIvyLhKV2DvTHBQXKkWM1KoDSd/Jmm4157RuB
         xAZSc+j+ItyPvZPMDqYVNdemLiN7TxyNjv5dtwmQfM5ZUisP6mcTGM5jq0qLIgUlAXp8
         Ktz67pQleCTqfbaAW8y+C2R3MkYwV8iTsndIC6lsQI1Cj5ippXEorzMtSyz3kkbqP3G8
         WyP72pHmojgI/aoyEacU0Ss8o+FRa9VpmmY/vU/GXhNaSZZUZFcFUh/TkZ7D1yPwfDw4
         rA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmuXCg5Z7O8ytN9Chv9LvwebvZD+1GbElmtZ+pQ5e5E=;
        b=dGat9WTwVtPrIvHL129bhQSMOgR7GeeAoa6tPU43RJ+5B/3i3LI/nVNa1YAdWFLI5u
         kKzAGGEuI47171YHSEluNUOhNreFrL0nz51YUDPsilvS3T5fxRxX3+LG22+v3befOpOm
         k7raK3X1JYUP5vPHZnFYkLGZNjcAaPCVe6SArozm2BNWkgbo9upb/X0UmaRjaEM/FwhE
         tkfiP3V470JOfe/NxNBwdyTTSfDuAgveLteQr8V0bIHdQXpWVwsvn9jAkphjqqHcMUTS
         3o7nw+xvCS0ATxwL6gKQdbWhYQ5n+o1+YNkukZR3keJmkMT1rwiotUcY+1CJZmnToVYD
         p9tQ==
X-Gm-Message-State: ANoB5pkBWmG3YDY4eaXQ80BjetXGqpDnKA+BbXpKH67am8ZxWWxkyixZ
	GC/DvkeQAq50rXpPhm153kP+Kzb3PBdQxg==
X-Google-Smtp-Source: AA0mqf7mvd0yDIeQSs84zYCcqXK1LhmWlsIAZ+9aXJgBLD7lKMeKZINOiJj/gxyPMvGfHxftIEeLow==
X-Received: by 2002:a05:620a:1a12:b0:6fa:b8f7:fb56 with SMTP id bk18-20020a05620a1a1200b006fab8f7fb56mr920264qkb.363.1669061193676;
        Mon, 21 Nov 2022 12:06:33 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id c12-20020ac8054c000000b003995f6513b9sm7008026qth.95.2022.11.21.12.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:06:32 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/trusted-services: add n1sdp support
Date: Mon, 21 Nov 2022 15:00:49 -0500
Message-Id: <166906085079.3764609.10024134087711446022.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221121144900.3079-1-jon.mason@arm.com>
References: <20221121144900.3079-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 20:06:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4153

On Mon, 21 Nov 2022 09:49:00 -0500, Jon Mason wrote:
> Add support for n1sdp to trusted-services bbappends and rework some
> things to make it easier to add more in the future.

Applied, thanks!

[1/1] arm-bsp/trusted-services: add n1sdp support
      commit: 11698cd358938daa92b4a098191b4c57847ebb7f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

