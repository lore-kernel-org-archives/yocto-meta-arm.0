Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD52C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 03:21:32 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.61930.1680492078748648401
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 02 Apr 2023 20:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=xIPXVGly;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id m6so20373820qvq.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 02 Apr 2023 20:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680492083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhxmQy9XAQ53oFFZMDa+9IYpQCfgQc51ShcPAQv3wUQ=;
        b=xIPXVGlyg7812xAloNYBCeXN/RA0o6UvRruXpicBYFYCJSuHQKgjAvubTEHWsimDwB
         yXUQfoLK0/V7Y8KQ/G5qTb+GfaLYmCMOR7XPkmO6n5AhFTWY5geQfH0clcTDr46sPDGf
         nGZtpyUYdUl5CqMbQeNjbzU33p6pOPXx26Oygnlb2lEtmF4QGRNgUD7/PX4NuiLnTbDK
         YgG/r8B/Dp9fx//Z0wG2+XqqIns+82cpuIh6LecPHxF9yttNBScDvozx62pJfOqjyCQI
         sQXTIz4kzwv/EqL7OAxywHpcqcF2/L7VVL371MOA2MlumnERcqZ+Myad267bUKNXa+p2
         LZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680492083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhxmQy9XAQ53oFFZMDa+9IYpQCfgQc51ShcPAQv3wUQ=;
        b=OFNTw4yiNh5CtWH4bD+R6NaxF6e6d1IFa+7LtGrO83qpGfV4nOuCS4SSL3umUOmuyd
         nUDBwpJz+9LRw0oh7VE7nq9KzTSSQn9XdM43GiwWe+rmqv2zJVM6WJQys3ni6EMmmqmu
         N+YCsifaOcmSQY9AoxoChDLW8ZB5ROnzLe6p70aF+YbvLOJphxASxw/TpPUE67ivJCxr
         froJ/TzDYT9ktShob3YQGfIdZ7UbS7d0zrz3STupOtxDIIXMUaSssfbd73XNHQbEFeVZ
         fVpJMHIZ/8AB3veJ+bl3XZHMGP3fbkhAOB2nQSlV9iy6+w49sWlEWQhHxG8Ch1ieiOpj
         bCZw==
X-Gm-Message-State: AAQBX9fMgnDbM6EdzvIW03D9MIHfH+Q0OrTdrfahCE0mzQ5OuIlgfho4
	4uYyK8olV1PiqKNEdNvljrJEpMxQVMmoPOmp7Dc=
X-Google-Smtp-Source: AKy350bEPt6sZOo9UNWih5+9l4VH+IFusmmYEy2J5pEyBdB4hivqrJHibaNBKGteBuaNk1AIGVZvFA==
X-Received: by 2002:a05:6214:27c2:b0:5db:4e49:b2bd with SMTP id ge2-20020a05621427c200b005db4e49b2bdmr28733968qvb.18.1680492083395;
        Sun, 02 Apr 2023 20:21:23 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id r8-20020a0cf808000000b005deeeba2aa2sm2354688qvn.43.2023.04.02.20.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 20:21:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"xueliang.zhong@arm.com" <xueliang.zhong@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp-board-firmware: update to newer SHA
Date: Sun,  2 Apr 2023 23:21:03 -0400
Message-Id: <168049206444.2209125.16678183741509190101.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331163713.28364-1-xueliang.zhong@arm.com>
References: <20230331163713.28364-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Apr 2023 03:21:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4532

On Fri, 31 Mar 2023 16:37:12 +0000, xueliang.zhong@arm.com wrote:
> arm-bsp/n1sdp-board-firmware: update to newer SHA.
> 
> Xueliang Zhong (1):
>   arm-bsp/n1sdp-board-firmware: update to newer SHA
> 
>  .../recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb      | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks!

[1/1] arm-bsp/n1sdp-board-firmware: update to newer SHA
      commit: 91725e95c937e6db168d7ecacad7ea871aa7fa83

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

