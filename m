Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6411AC38A2D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 22:07:40 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.656.1666390047270237484
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 15:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=v2utWZbT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id 8so2954066qka.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 15:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Emdlf6yxNIxPmhWBf4axDtRQlL+GsEmb9gC0V4N9J8=;
        b=v2utWZbTN9/ThCklCQnijNoeZZebBEZQ7dSg4Z66YnUzdQNbJdpbl40Vzg9yJhKRwi
         TLOGjBHvQVY4+K/3CmGMx1g+lemJqEppjqUYD7rQGLJ3bTARF2DNGRMuhXAoMRyDPG/H
         inxYi3GDnb42QajwAfSVT54x5TRtRNSl49/h1VVz3cDR5UYkitOV7bLJiFXxAuR5G3SA
         kJc3WS2jJDxGoVk32qTQl4+LWTZXxdXiNsUisGHhDONYRjTQUKoJohstTdOy+lgKZkSo
         1Zhu0JKHq9Qordd2g+QbDDH8Y1EoqfdRnSv+mXhzUY7ftPG6zp4O3cyqhtUhsYq0x/mC
         VNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Emdlf6yxNIxPmhWBf4axDtRQlL+GsEmb9gC0V4N9J8=;
        b=a/B+Fgak+lp9x2HZvH6/hcrt5obBjfC2Di+Dx74mAFvmVlsk08c4SuNpFSkyrt9yvX
         bKh9p6e5Tb89ddHldg5+CYR7YgoQwcIchRx8cpoJuaVRucinjWG5k/rsb6rSpIn5iN/q
         arLNTBhJY8iurYiQWQuW6SOvM9i0WNcM3gP7oEC/kBWj8ascA5/45kJ7JErqhhE6qtoC
         Dw1SV5G64Fu4hUaFoz0FZG9nzcJ+yEiwxOnYhac2TW2N3kDWrFnO/WSoIjJoeBLHS9H0
         Jk1v9bixqdr7F2+F9z0iSwZwVeWisAszFStZpabXH6inpMaI32YcyNeWuLtG+eavC+tb
         E2EQ==
X-Gm-Message-State: ACrzQf0hS4Lo+Jk9Gl/vFQod0vKEGMjCDmVWfU+E+mAEK5M4lxcy4cZ6
	2KhDK7QD1xERDGrIElmVIqPui/pjmE8ImA==
X-Google-Smtp-Source: AMsMyM44Kq2q5q3r638dsg/kXCLnoXC0Uspr8qffNGZc9CsNQdc5qk2mz9WrGs8wHbFstS5FZzNwnQ==
X-Received: by 2002:a05:620a:448d:b0:6cf:2a95:a10c with SMTP id x13-20020a05620a448d00b006cf2a95a10cmr15706107qkp.526.1666390045741;
        Fri, 21 Oct 2022 15:07:25 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id s10-20020a05620a29ca00b006e07228ed53sm10691533qkp.18.2022.10.21.15.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 15:07:25 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] runfvp: corstone1000: add mmc card configuration
Date: Fri, 21 Oct 2022 16:01:46 -0400
Message-Id: <166638250646.2629587.14070571621703005571.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221021163612.27717-1-vishnu.banavath@arm.com>
References: <20221021163612.27717-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 22:07:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4012

On Fri, 21 Oct 2022 17:36:11 +0100, vishnu.banavath@arm.com wrote:
> These changes are to pass appropriate MMC card configuration to
> corstone1000 FVP.
> 
> Vishnu Banavath (1):
>   runfvp: corstone1000: add mmc card configuration
> 
>  meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks!

[1/1] runfvp: corstone1000: add mmc card configuration
      commit: a8075e1471519279f49580e95565fbcb5f47bc14

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

