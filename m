Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F899C001DE
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 03:31:07 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.60.1690428663204822880
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 20:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=AFgzLKuW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-63cffc0f95eso3137116d6.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jul 2023 20:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1690428662; x=1691033462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ysg/kBqVB2w4y1Q9sAFnMJjHXjdgffcnW3MVslcBqqo=;
        b=AFgzLKuWzZI0liTj01dT3zOSQOeKRMoUFgf9gJU7F6tOGumkC3/0mf3vPEkWM357iO
         2wk7WQrzkEE66YUYR5TRcSvaEXH/hmfjLcJrbc9zq/rUmrcr8U+shhAcr2+bgSVR8DM2
         MXRYnofumU+x/FDOBFr0Qwu1R7cpd1deTQ5/F65OFipERJbt1enIBZn6gbKcF5TCvbnl
         guJ5gydZkoVbRySKbd+yYLHXu3F1X/R0cLb7O1tz0agmH6m+4elq1INQro0NuAlpV3ED
         J1FAPdkhlljopug/cuCyCJyZxa5smWZhU2GGKwYtxJgxENA+0FNbaC2wA5xM5rrGx7Bv
         qTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690428662; x=1691033462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ysg/kBqVB2w4y1Q9sAFnMJjHXjdgffcnW3MVslcBqqo=;
        b=kZwCHn4dEwbXjFPJNDxPw77BWVEuY2kmIfsNSZq6QO9OlVGaAAmdMjwB6wQD0BZf6Z
         ka1WIzrIKn3c7L4qAxL2T/w3kARkcM1njCWLguqcPvLTglh5t8nHmvBOfy9WQ/7tqk8W
         qEI2DCOxIueA9vVeZrjLAOfSABlBFcd/vXQk8HNF8bXJvWDeiixXrkqXDNHMNI5r9CPj
         bpvjGQGUoGQ75aJU0vlqqNnVzEUgFXi2n0TLLTZlBBdxyNl76rs+BphdsoowMzz4yhB+
         CMGNn0ZDuOiwDo8xPXMThMWWTJweKNPj0UL7HIVjV3oUWYIKYh1p4mOD5zk9B2FDDnla
         HWaw==
X-Gm-Message-State: ABy/qLbm5PTWaAWx3zJA9TiuZj6kRSxDE+xWfiBIuS7UGc8qBvAroKJ0
	fe0XIlbe+aKWODZq8tLJHxldLS1zDPxYKhCi43s=
X-Google-Smtp-Source: APBJJlHnYpF+VQZTb0iCSQDI05NFPcSOi7AFxpq9aTsGjHpWCdFXWbC+Olc98CjDP8mmNKuNCWuSCQ==
X-Received: by 2002:a05:6214:1fc8:b0:637:59f9:b7c2 with SMTP id jh8-20020a0562141fc800b0063759f9b7c2mr2982343qvb.56.1690428661781;
        Wed, 26 Jul 2023 20:31:01 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id m9-20020a0cdb89000000b0063d2898f210sm118334qvk.103.2023.07.26.20.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 20:31:01 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/corstone1000: update u-boot preferred version
Date: Wed, 26 Jul 2023 23:29:15 -0400
Message-Id: <169042855628.3962951.14163732428594358374.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230726-master-next-v1-1-cd4758222729@arm.com>
References: <20230726-master-next-v1-1-cd4758222729@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jul 2023 03:31:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4925


On Wed, 26 Jul 2023 08:01:34 -0400, Jon Mason wrote:
> The upstream u-boot recipe did a minor version update, which is causing
> a "preferred version not available" warning.  Add a '%' to resolve this
> issue.
> 
> 

Applied, thanks!

[1/1] arm-bsp/corstone1000: update u-boot preferred version
      commit: 9ea107c5fe9942c8db7365f82f073a87ba8fca77

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

